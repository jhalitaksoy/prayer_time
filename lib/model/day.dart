import 'package:prayer_time/model/prayer_time.dart';
import 'package:prayer_time/util/datetime_util.dart';

class MyDay {
  PrayerTime imsak;
  PrayerTime gunes;
  PrayerTime ogle;
  PrayerTime ikindi;
  PrayerTime aksam;
  PrayerTime yatsi;
  DateTime day;

  MyDay.fromRawDay(RawDay rawDay) {
    day = DateTimeUtil.parseDayMonthYear(rawDay.miladiTarihKisa);
    imsak = PrayerTime(
      type: PrayerTimeType.imsak,
      dateTime: DateTimeUtil.parseHourMinute(day, rawDay.imsak),
    );
    gunes = PrayerTime(
      type: PrayerTimeType.gunes,
      dateTime: DateTimeUtil.parseHourMinute(day, rawDay.gunes),
    );
    ogle = PrayerTime(
      type: PrayerTimeType.ogle,
      dateTime: DateTimeUtil.parseHourMinute(day, rawDay.ogle),
    );
    ikindi = PrayerTime(
      type: PrayerTimeType.ikindi,
      dateTime: DateTimeUtil.parseHourMinute(day, rawDay.ikindi),
    );
    aksam = PrayerTime(
      type: PrayerTimeType.aksam,
      dateTime: DateTimeUtil.parseHourMinute(day, rawDay.aksam),
    );
    yatsi = PrayerTime(
      type: PrayerTimeType.yatsi,
      dateTime: DateTimeUtil.parseHourMinute(day, rawDay.yatsi),
    );
  }
}

class RawDay {
  String aksam;
  String ayinSekliURL;
  String gunes;
  String gunesBatis;
  String gunesDogus;
  String hicriTarihKisa;
  String hicriTarihUzun;
  String ikindi;
  String imsak;
  String kibleSaati;
  String miladiTarihKisa;
  String miladiTarihKisaIso8601;
  String miladiTarihUzun;
  String miladiTarihUzunIso8601;
  String ogle;
  String yatsi;

  RawDay(
      {this.aksam,
      this.ayinSekliURL,
      this.gunes,
      this.gunesBatis,
      this.gunesDogus,
      this.hicriTarihKisa,
      this.hicriTarihUzun,
      this.ikindi,
      this.imsak,
      this.kibleSaati,
      this.miladiTarihKisa,
      this.miladiTarihKisaIso8601,
      this.miladiTarihUzun,
      this.miladiTarihUzunIso8601,
      this.ogle,
      this.yatsi});

  RawDay.fromJson(Map<String, dynamic> json) {
    aksam = json['Aksam'];
    ayinSekliURL = json['AyinSekliURL'];
    gunes = json['Gunes'];
    gunesBatis = json['GunesBatis'];
    gunesDogus = json['GunesDogus'];
    hicriTarihKisa = json['HicriTarihKisa'];
    hicriTarihUzun = json['HicriTarihUzun'];
    ikindi = json['Ikindi'];
    imsak = json['Imsak'];
    kibleSaati = json['KibleSaati'];
    miladiTarihKisa = json['MiladiTarihKisa'];
    miladiTarihKisaIso8601 = json['MiladiTarihKisaIso8601'];
    miladiTarihUzun = json['MiladiTarihUzun'];
    miladiTarihUzunIso8601 = json['MiladiTarihUzunIso8601'];
    ogle = json['Ogle'];
    yatsi = json['Yatsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Aksam'] = this.aksam;
    data['AyinSekliURL'] = this.ayinSekliURL;
    data['Gunes'] = this.gunes;
    data['GunesBatis'] = this.gunesBatis;
    data['GunesDogus'] = this.gunesDogus;
    data['HicriTarihKisa'] = this.hicriTarihKisa;
    data['HicriTarihUzun'] = this.hicriTarihUzun;
    data['Ikindi'] = this.ikindi;
    data['Imsak'] = this.imsak;
    data['KibleSaati'] = this.kibleSaati;
    data['MiladiTarihKisa'] = this.miladiTarihKisa;
    data['MiladiTarihKisaIso8601'] = this.miladiTarihKisaIso8601;
    data['MiladiTarihUzun'] = this.miladiTarihUzun;
    data['MiladiTarihUzunIso8601'] = this.miladiTarihUzunIso8601;
    data['Ogle'] = this.ogle;
    data['Yatsi'] = this.yatsi;
    return data;
  }
}
