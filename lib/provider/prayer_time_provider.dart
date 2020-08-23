import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:prayer_time/model/day.dart';
import 'package:prayer_time/model/prayer_time.dart';
import 'package:prayer_time/provider/date_time_provider.dart';
import 'package:prayer_time/provider/location_provider.dart';
import 'package:prayer_time/service/local_storage_service.dart';
import 'package:prayer_time/service/network_service.dart';
import 'package:prayer_time/util/prayer_time_util.dart';

class PrayerTimeProvider {
  ///
  ///Logging
  final logger = Logger('PrayerTimeProvider');

  ///
  ///Tag for Local Storage
  final localStorageTag = "prayer_times";

  DateTime _lastCalculatedTime = DateTime(2020);

  _CalculationDays _cacheDays;

  RemainingTime _lastCalculatedRemaningTime;

  void resetCache() {
    _lastCalculatedTime = DateTime(2020);
    _cacheDays = null;
    _lastCalculatedRemaningTime = null;
  }

  bool shouldUpdate() {
    final now = DateTimeProvider().now();
    final res = now.day != _lastCalculatedTime.day ||
        now.hour != _lastCalculatedTime.hour ||
        now.minute != _lastCalculatedTime.minute;
    return res;
  }

  ///
  /// Calculate Remaining Time to Call To Prayer
  ///
  /// Load Days And Calculate
  ///
  Future<RemainingTime> calculateRemaningTime() async {
    logger.info('called calculateRemaningTime');

    final now = DateTimeProvider().now();

    if (now.day != _lastCalculatedTime.day) {
      _lastCalculatedTime = now;
      _cacheDays = await _loadDays();
      if (_cacheDays == null) {
        throw Exception("Yüklenemedi");
      }
      final prayerTimes = _cacheDays.getPrayerTimeList();
      _lastCalculatedRemaningTime = PrayerTimeUtil.calculateRemaningTime(
        prayerTimes,
        now,
      );
      return _lastCalculatedRemaningTime;
    } else if (now.hour != _lastCalculatedTime.hour ||
        now.minute != _lastCalculatedTime.minute) {
      _lastCalculatedTime = now;
      final prayerTimes = _cacheDays.getPrayerTimeList();
      _lastCalculatedRemaningTime = PrayerTimeUtil.calculateRemaningTime(
        prayerTimes,
        now,
      );
      return _lastCalculatedRemaningTime;
    } else {
      _lastCalculatedTime = now;
      return _lastCalculatedRemaningTime;
    }
  }

  ///
  /// Load Suitable Days (Yesterday, Today, Tomorrow)
  ///
  /// Firstly,
  /// Load from local storage, if there is not suitable data
  /// Load from network and write to local storage.
  ///
  Future<_CalculationDays> _loadDays() async {
    var prayerTimesText = await LocalStorageService().read(localStorageTag);
    if (prayerTimesText == null) {
      if (!await _fetchDataFromRemoteAndWriteToLocal()) return null;
      prayerTimesText = await LocalStorageService().read(localStorageTag);
    }
    var prayerTimesJson = jsonDecode(prayerTimesText);
    final calculationDays = _CalculationDays();
    if (!await calculationDays.loadDays(prayerTimesJson)) {
      if (!await _fetchDataFromRemoteAndWriteToLocal()) return null;
    }
    prayerTimesText = await LocalStorageService().read(localStorageTag);
    if (prayerTimesText == null) return null;
    prayerTimesJson = jsonDecode(prayerTimesText);
    if (!await calculationDays.loadDays(prayerTimesJson)) {
      return null;
    }
    return calculationDays;
  }

  ///
  /// Fetch data from remote and write to Local Storage.
  ///
  Future<bool> _fetchDataFromRemoteAndWriteToLocal() async {
    final county = await LocationProvider().currentLocation();
    if (county == null) {
      return false;
    }
    final route = "/vakitler?ilce=${county.ilceID}";
    final newData = await NetworkService().performGet(route);
    if (newData == null) return false;
    return await LocalStorageService().write(localStorageTag, newData);
  }

  static final PrayerTimeProvider _prayerTimeProvider =
      PrayerTimeProvider._internal();

  factory PrayerTimeProvider() {
    return _prayerTimeProvider;
  }

  PrayerTimeProvider._internal();
}

class _CalculationDays {
  ///
  ///
  MyDay yesterday, today, tomorrow;

  ///
  /// Get days (Yesterday, Today, Tomorrow) from given json
  ///
  Future<bool> loadDays(List<dynamic> prayerTimesJson) async {
    final dateTimeToday = DateTimeProvider().now();
    final dateTimeYesterday = dateTimeToday.subtract(Duration(days: 1));
    final dateTimeTomorrow = dateTimeToday.add(Duration(days: 1));

    yesterday = await getDay(prayerTimesJson, dateTimeYesterday);
    today = await getDay(prayerTimesJson, dateTimeToday);
    tomorrow = await getDay(prayerTimesJson, dateTimeTomorrow);

    return today != null && tomorrow != null;
  }

  ///
  /// Get day from given json
  ///
  Future<MyDay> getDay(List<dynamic> jsonList, DateTime dateTime) async {
    final dateTimeText = DateFormat("dd.MM.yyyy").format(dateTime);
    final jsonName = "MiladiTarihKisa";
    Map<String, dynamic> jsonDay;
    if (jsonList is List) {
      for (var day in jsonList) {
        if (day[jsonName] == dateTimeText) {
          jsonDay = day;
          break;
        }
      }
    } else {
      return null;
    }
    if (jsonDay == null) return null;
    final rawDay = RawDay.fromJson(jsonDay);
    return MyDay.fromRawDay(rawDay);
  }

  ///
  /// Return prayer times that contains
  /// yesterday.yatsi, all times in today and tomorrow.imsak
  ///
  List<PrayerTime> getPrayerTimeList() {
    final today_00_00 = PrayerTime(
      type: PrayerTimeType.yatsi,
      dateTime: today.day,
    );
    return [
      yesterday?.yatsi ?? today_00_00,
      today.imsak,
      today.gunes,
      today.ogle,
      today.ikindi,
      today.aksam,
      today.yatsi,
      tomorrow.imsak
    ];
  }
}
