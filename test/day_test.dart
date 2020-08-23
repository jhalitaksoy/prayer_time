import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:prayer_time/model/day.dart';

const jsonDay =
    '{"Aksam":"20:17","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/d7.gif","Gunes":"06:02","GunesBatis":"20:10","GunesDogus":"06:09","HicriTarihKisa":"20.12.1441","HicriTarihUzun":"20 Zilhicce 1441","Ikindi":"17:06","Imsak":"04:23","KibleSaati":"12:16","MiladiTarihKisa":"10.08.2020","MiladiTarihKisaIso8601":"10.08.2020","MiladiTarihUzun":"10 Ağustos 2020 Pazartesi","MiladiTarihUzunIso8601":"2020-08-10T00:00:00.0000000+03:00","Ogle":"13:14","Yatsi":"21:50"}';

void main() {
  group("Day Test", () {
    test("Day Test", () {
      var rawDay = RawDay.fromJson(jsonDecode(jsonDay));
      var day = MyDay.fromRawDay(rawDay);

      expect(day.day.year, 2020);
      expect(day.day.month, 8);
      expect(day.day.day, 10);
      expect(day.aksam.dateTime.year, 2020);
      expect(day.aksam.dateTime.month, 8);
      expect(day.aksam.dateTime.day, 10);
      expect(day.aksam.dateTime.hour, 20);
      expect(day.aksam.dateTime.minute, 17);
    });
  });
}
