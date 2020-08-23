import 'dart:convert';

import 'package:prayer_time/config/config.dart';
import 'package:prayer_time/model/location.dart';
import 'package:prayer_time/provider/prayer_time_provider.dart';
import 'package:prayer_time/service/local_storage_service.dart';
import 'package:prayer_time/service/network_service.dart';

class LocationProvider {
  ///
  /// Tag for LocalStorage
  final currentLocationTag = "current_location";

  ///
  /// Load whole countries from remote.
  ///
  Future<List<Country>> getCountries() async {
    if (isTest) {
      return [
        Country(ulkeAdi: "Country1"),
        Country(ulkeAdi: "Country2"),
        Country(ulkeAdi: "Country3"),
      ];
    }
    final json = jsonDecode(await NetworkService().performGet("/ulkeler"));
    final List<Country> result = [];
    if (json is List) {
      for (var jsonCountry in json) {
        result.add(Country.fromJson(jsonCountry));
      }
    }
    return result;
  }

  ///
  /// Load whole cities from remote.
  ///
  Future<List<City>> getCities(String countryId) async {
    if (isTest) {
      return [
        City(sehirAdi: "City1"),
        City(sehirAdi: "City2"),
        City(sehirAdi: "City3"),
      ];
    }
    final json = jsonDecode(
        await NetworkService().performGet("/sehirler?ulke=$countryId"));
    final List<City> result = [];
    if (json is List) {
      for (var jsonCity in json) {
        result.add(City.fromJson(jsonCity));
      }
    }
    return result;
  }

  ///
  /// Load whole counties from remote.
  ///
  Future<List<County>> getCounties(String cityId) async {
    if (isTest) {
      return [
        County(ilceAdi: "County1"),
        County(ilceAdi: "County2"),
        County(ilceAdi: "County3"),
      ];
    }
    final json = jsonDecode(
      await NetworkService().performGet("/ilceler?sehir=$cityId"),
    );
    final List<County> result = [];
    if (json is List) {
      for (var jsonCounty in json) {
        result.add(County.fromJson(jsonCounty));
      }
    }
    return result;
  }

  ///
  /// Get current location from local stroage.
  ///
  Future<County> currentLocation() async {
    final text = await LocalStorageService().read(currentLocationTag);
    if (text == null) return null;
    final json = jsonDecode(text);
    return County.fromJson(json);
  }

  ///
  /// Set current location to local stroage.
  ///
  Future<bool> setCurrentLocation(County county) async {
    PrayerTimeProvider().resetCache();
    LocalStorageService().clear(PrayerTimeProvider().localStorageTag);
    return LocalStorageService()
        .write(currentLocationTag, jsonEncode(county.toJson()));
  }

  static final LocationProvider _locationProvider =
      LocationProvider._internal();

  factory LocationProvider() {
    return _locationProvider;
  }

  LocationProvider._internal();
}
