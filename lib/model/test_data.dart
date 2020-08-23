import 'package:prayer_time/model/prayer_time.dart';

class TestData {
  final DateTime now;

  String networkData;

  RemainingTime remaningTime;

  TestData(this.now, this.networkData, this.remaningTime);
}

var testData1 = TestData(
    DateTime.parse("2020-08-10 22:14:30"),
    networkData1,
    RemainingTime([],
      PrayerTime(
          type: PrayerTimeType.gunes,
          dateTime: DateTime.parse("2020-08-10 06:02:00")),
      PrayerTime(
          type: PrayerTimeType.ogle,
          dateTime: DateTime.parse("2020-08-10 13:14:00")),
    ));

var currentTestData = testData1;

const networkData1 =
    '[{"Aksam":"20:17","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/d7.gif","Gunes":"06:02","GunesBatis":"20:10","GunesDogus":"06:09","HicriTarihKisa":"20.12.1441","HicriTarihUzun":"20 Zilhicce 1441","Ikindi":"17:06","Imsak":"04:23","KibleSaati":"12:16","MiladiTarihKisa":"10.08.2020","MiladiTarihKisaIso8601":"10.08.2020","MiladiTarihUzun":"10 Ağustos 2020 Pazartesi","MiladiTarihUzunIso8601":"2020-08-10T00:00:00.0000000+03:00","Ogle":"13:14","Yatsi":"21:50"},{"Aksam":"20:16","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/sondordun.gif","Gunes":"06:03","GunesBatis":"20:09","GunesDogus":"06:10","HicriTarihKisa":"21.12.1441","HicriTarihUzun":"21 Zilhicce 1441","Ikindi":"17:05","Imsak":"04:24","KibleSaati":"12:15","MiladiTarihKisa":"11.08.2020","MiladiTarihKisaIso8601":"11.08.2020","MiladiTarihUzun":"11 Ağustos 2020 Salı","MiladiTarihUzunIso8601":"2020-08-11T00:00:00.0000000+03:00","Ogle":"13:14","Yatsi":"21:48"},{"Aksam":"20:14","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/sd1.gif","Gunes":"06:04","GunesBatis":"20:07","GunesDogus":"06:11","HicriTarihKisa":"22.12.1441","HicriTarihUzun":"22 Zilhicce 1441","Ikindi":"17:04","Imsak":"04:26","KibleSaati":"12:15","MiladiTarihKisa":"12.08.2020","MiladiTarihKisaIso8601":"12.08.2020","MiladiTarihUzun":"12 Ağustos 2020 Çarşamba","MiladiTarihUzunIso8601":"2020-08-12T00:00:00.0000000+03:00","Ogle":"13:14","Yatsi":"21:46"},{"Aksam":"20:13","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/sd2.gif","Gunes":"06:05","GunesBatis":"20:06","GunesDogus":"06:12","HicriTarihKisa":"23.12.1441","HicriTarihUzun":"23 Zilhicce 1441","Ikindi":"17:04","Imsak":"04:27","KibleSaati":"12:14","MiladiTarihKisa":"13.08.2020","MiladiTarihKisaIso8601":"13.08.2020","MiladiTarihUzun":"13 Ağustos 2020 Perşembe","MiladiTarihUzunIso8601":"2020-08-13T00:00:00.0000000+03:00","Ogle":"13:14","Yatsi":"21:44"},{"Aksam":"20:12","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/sd3.gif","Gunes":"06:06","GunesBatis":"20:05","GunesDogus":"06:13","HicriTarihKisa":"24.12.1441","HicriTarihUzun":"24 Zilhicce 1441","Ikindi":"17:03","Imsak":"04:28","KibleSaati":"12:13","MiladiTarihKisa":"14.08.2020","MiladiTarihKisaIso8601":"14.08.2020","MiladiTarihUzun":"14 Ağustos 2020 Cuma","MiladiTarihUzunIso8601":"2020-08-14T00:00:00.0000000+03:00","Ogle":"13:14","Yatsi":"21:42"},{"Aksam":"20:10","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/sd4.gif","Gunes":"06:07","GunesBatis":"20:03","GunesDogus":"06:14","HicriTarihKisa":"25.12.1441","HicriTarihUzun":"25 Zilhicce 1441","Ikindi":"17:03","Imsak":"04:30","KibleSaati":"12:12","MiladiTarihKisa":"15.08.2020","MiladiTarihKisaIso8601":"15.08.2020","MiladiTarihUzun":"15 Ağustos 2020 Cumartesi","MiladiTarihUzunIso8601":"2020-08-15T00:00:00.0000000+03:00","Ogle":"13:14","Yatsi":"21:41"},{"Aksam":"20:09","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/sd5.gif","Gunes":"06:08","GunesBatis":"20:02","GunesDogus":"06:15","HicriTarihKisa":"26.12.1441","HicriTarihUzun":"26 Zilhicce 1441","Ikindi":"17:02","Imsak":"04:31","KibleSaati":"12:12","MiladiTarihKisa":"16.08.2020","MiladiTarihKisaIso8601":"16.08.2020","MiladiTarihUzun":"16 Ağustos 2020 Pazar","MiladiTarihUzunIso8601":"2020-08-16T00:00:00.0000000+03:00","Ogle":"13:13","Yatsi":"21:39"},{"Aksam":"20:07","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/sd6.gif","Gunes":"06:09","GunesBatis":"20:00","GunesDogus":"06:16","HicriTarihKisa":"27.12.1441","HicriTarihUzun":"27 Zilhicce 1441","Ikindi":"17:01","Imsak":"04:33","KibleSaati":"12:11","MiladiTarihKisa":"17.08.2020","MiladiTarihKisaIso8601":"17.08.2020","MiladiTarihUzun":"17 Ağustos 2020 Pazartesi","MiladiTarihUzunIso8601":"2020-08-17T00:00:00.0000000+03:00","Ogle":"13:13","Yatsi":"21:37"},{"Aksam":"20:06","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/sd7.gif","Gunes":"06:10","GunesBatis":"19:59","GunesDogus":"06:17","HicriTarihKisa":"28.12.1441","HicriTarihUzun":"28 Zilhicce 1441","Ikindi":"17:01","Imsak":"04:34","KibleSaati":"12:10","MiladiTarihKisa":"18.08.2020","MiladiTarihKisaIso8601":"18.08.2020","MiladiTarihUzun":"18 Ağustos 2020 Salı","MiladiTarihUzunIso8601":"2020-08-18T00:00:00.0000000+03:00","Ogle":"13:13","Yatsi":"21:35"},{"Aksam":"20:05","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/ruyet.gif","Gunes":"06:11","GunesBatis":"19:58","GunesDogus":"06:18","HicriTarihKisa":"29.12.1441","HicriTarihUzun":"29 Zilhicce 1441","Ikindi":"17:00","Imsak":"04:36","KibleSaati":"12:10","MiladiTarihKisa":"19.08.2020","MiladiTarihKisaIso8601":"19.08.2020","MiladiTarihUzun":"19 Ağustos 2020 Çarşamba","MiladiTarihUzunIso8601":"2020-08-19T00:00:00.0000000+03:00","Ogle":"13:13","Yatsi":"21:33"},{"Aksam":"20:03","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/r1.gif","Gunes":"06:12","GunesBatis":"19:56","GunesDogus":"06:19","HicriTarihKisa":"1.1.1442","HicriTarihUzun":"1 Muharrem 1442","Ikindi":"16:59","Imsak":"04:37","KibleSaati":"12:09","MiladiTarihKisa":"20.08.2020","MiladiTarihKisaIso8601":"20.08.2020","MiladiTarihUzun":"20 Ağustos 2020 Perşembe","MiladiTarihUzunIso8601":"2020-08-20T00:00:00.0000000+03:00","Ogle":"13:13","Yatsi":"21:31"},{"Aksam":"20:02","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/r2.gif","Gunes":"06:13","GunesBatis":"19:55","GunesDogus":"06:20","HicriTarihKisa":"2.1.1442","HicriTarihUzun":"2 Muharrem 1442","Ikindi":"16:58","Imsak":"04:39","KibleSaati":"12:08","MiladiTarihKisa":"21.08.2020","MiladiTarihKisaIso8601":"21.08.2020","MiladiTarihUzun":"21 Ağustos 2020 Cuma","MiladiTarihUzunIso8601":"2020-08-21T00:00:00.0000000+03:00","Ogle":"13:12","Yatsi":"21:29"},{"Aksam":"20:00","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/r3.gif","Gunes":"06:14","GunesBatis":"19:53","GunesDogus":"06:21","HicriTarihKisa":"3.1.1442","HicriTarihUzun":"3 Muharrem 1442","Ikindi":"16:58","Imsak":"04:40","KibleSaati":"12:07","MiladiTarihKisa":"22.08.2020","MiladiTarihKisaIso8601":"22.08.2020","MiladiTarihUzun":"22 Ağustos 2020 Cumartesi","MiladiTarihUzunIso8601":"2020-08-22T00:00:00.0000000+03:00","Ogle":"13:12","Yatsi":"21:28"},{"Aksam":"19:59","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/r4.gif","Gunes":"06:15","GunesBatis":"19:52","GunesDogus":"06:22","HicriTarihKisa":"4.1.1442","HicriTarihUzun":"4 Muharrem 1442","Ikindi":"16:57","Imsak":"04:41","KibleSaati":"12:06","MiladiTarihKisa":"23.08.2020","MiladiTarihKisaIso8601":"23.08.2020","MiladiTarihUzun":"23 Ağustos 2020 Pazar","MiladiTarihUzunIso8601":"2020-08-23T00:00:00.0000000+03:00","Ogle":"13:12","Yatsi":"21:26"},{"Aksam":"19:57","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/r5.gif","Gunes":"06:16","GunesBatis":"19:50","GunesDogus":"06:23","HicriTarihKisa":"5.1.1442","HicriTarihUzun":"5 Muharrem 1442","Ikindi":"16:56","Imsak":"04:43","KibleSaati":"12:06","MiladiTarihKisa":"24.08.2020","MiladiTarihKisaIso8601":"24.08.2020","MiladiTarihUzun":"24 Ağustos 2020 Pazartesi","MiladiTarihUzunIso8601":"2020-08-24T00:00:00.0000000+03:00","Ogle":"13:11","Yatsi":"21:24"},{"Aksam":"19:56","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/ilkdordun.gif","Gunes":"06:17","GunesBatis":"19:48","GunesDogus":"06:24","HicriTarihKisa":"6.1.1442","HicriTarihUzun":"6 Muharrem 1442","Ikindi":"16:55","Imsak":"04:44","KibleSaati":"12:05","MiladiTarihKisa":"25.08.2020","MiladiTarihKisaIso8601":"25.08.2020","MiladiTarihUzun":"25 Ağustos 2020 Salı","MiladiTarihUzunIso8601":"2020-08-25T00:00:00.0000000+03:00","Ogle":"13:11","Yatsi":"21:22"},{"Aksam":"19:54","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/i1.gif","Gunes":"06:18","GunesBatis":"19:47","GunesDogus":"06:25","HicriTarihKisa":"7.1.1442","HicriTarihUzun":"7 Muharrem 1442","Ikindi":"16:54","Imsak":"04:46","KibleSaati":"12:04","MiladiTarihKisa":"26.08.2020","MiladiTarihKisaIso8601":"26.08.2020","MiladiTarihUzun":"26 Ağustos 2020 Çarşamba","MiladiTarihUzunIso8601":"2020-08-26T00:00:00.0000000+03:00","Ogle":"13:11","Yatsi":"21:20"},{"Aksam":"19:52","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/i2.gif","Gunes":"06:19","GunesBatis":"19:45","GunesDogus":"06:26","HicriTarihKisa":"8.1.1442","HicriTarihUzun":"8 Muharrem 1442","Ikindi":"16:54","Imsak":"04:47","KibleSaati":"12:03","MiladiTarihKisa":"27.08.2020","MiladiTarihKisaIso8601":"27.08.2020","MiladiTarihUzun":"27 Ağustos 2020 Perşembe","MiladiTarihUzunIso8601":"2020-08-27T00:00:00.0000000+03:00","Ogle":"13:11","Yatsi":"21:18"},{"Aksam":"19:51","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/i3.gif","Gunes":"06:20","GunesBatis":"19:44","GunesDogus":"06:27","HicriTarihKisa":"9.1.1442","HicriTarihUzun":"9 Muharrem 1442","Ikindi":"16:53","Imsak":"04:48","KibleSaati":"12:02","MiladiTarihKisa":"28.08.2020","MiladiTarihKisaIso8601":"28.08.2020","MiladiTarihUzun":"28 Ağustos 2020 Cuma","MiladiTarihUzunIso8601":"2020-08-28T00:00:00.0000000+03:00","Ogle":"13:10","Yatsi":"21:16"},{"Aksam":"19:49","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/i4.gif","Gunes":"06:21","GunesBatis":"19:42","GunesDogus":"06:28","HicriTarihKisa":"10.1.1442","HicriTarihUzun":"10 Muharrem 1442","Ikindi":"16:52","Imsak":"04:50","KibleSaati":"12:01","MiladiTarihKisa":"29.08.2020","MiladiTarihKisaIso8601":"29.08.2020","MiladiTarihUzun":"29 Ağustos 2020 Cumartesi","MiladiTarihUzunIso8601":"2020-08-29T00:00:00.0000000+03:00","Ogle":"13:10","Yatsi":"21:14"},{"Aksam":"19:48","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/i5.gif","Gunes":"06:22","GunesBatis":"19:41","GunesDogus":"06:29","HicriTarihKisa":"11.1.1442","HicriTarihUzun":"11 Muharrem 1442","Ikindi":"16:51","Imsak":"04:51","KibleSaati":"12:00","MiladiTarihKisa":"30.08.2020","MiladiTarihKisaIso8601":"30.08.2020","MiladiTarihUzun":"30 Ağustos 2020 Pazar","MiladiTarihUzunIso8601":"2020-08-30T00:00:00.0000000+03:00","Ogle":"13:10","Yatsi":"21:12"},{"Aksam":"19:46","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/i6.gif","Gunes":"06:23","GunesBatis":"19:39","GunesDogus":"06:30","HicriTarihKisa":"12.1.1442","HicriTarihUzun":"12 Muharrem 1442","Ikindi":"16:50","Imsak":"04:52","KibleSaati":"12:00","MiladiTarihKisa":"31.08.2020","MiladiTarihKisaIso8601":"31.08.2020","MiladiTarihUzun":"31 Ağustos 2020 Pazartesi","MiladiTarihUzunIso8601":"2020-08-31T00:00:00.0000000+03:00","Ogle":"13:09","Yatsi":"21:10"},{"Aksam":"19:44","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/i7.gif","Gunes":"06:24","GunesBatis":"19:37","GunesDogus":"06:31","HicriTarihKisa":"13.1.1442","HicriTarihUzun":"13 Muharrem 1442","Ikindi":"16:49","Imsak":"04:54","KibleSaati":"11:59","MiladiTarihKisa":"01.09.2020","MiladiTarihKisaIso8601":"01.09.2020","MiladiTarihUzun":"01 Eylül 2020 Salı","MiladiTarihUzunIso8601":"2020-09-01T00:00:00.0000000+03:00","Ogle":"13:09","Yatsi":"21:09"},{"Aksam":"19:43","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/dolunay.gif","Gunes":"06:25","GunesBatis":"19:36","GunesDogus":"06:32","HicriTarihKisa":"14.1.1442","HicriTarihUzun":"14 Muharrem 1442","Ikindi":"16:48","Imsak":"04:55","KibleSaati":"11:58","MiladiTarihKisa":"02.09.2020","MiladiTarihKisaIso8601":"02.09.2020","MiladiTarihUzun":"02 Eylül 2020 Çarşamba","MiladiTarihUzunIso8601":"2020-09-02T00:00:00.0000000+03:00","Ogle":"13:09","Yatsi":"21:07"},{"Aksam":"19:41","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/d1.gif","Gunes":"06:26","GunesBatis":"19:34","GunesDogus":"06:33","HicriTarihKisa":"15.1.1442","HicriTarihUzun":"15 Muharrem 1442","Ikindi":"16:47","Imsak":"04:56","KibleSaati":"11:57","MiladiTarihKisa":"03.09.2020","MiladiTarihKisaIso8601":"03.09.2020","MiladiTarihUzun":"03 Eylül 2020 Perşembe","MiladiTarihUzunIso8601":"2020-09-03T00:00:00.0000000+03:00","Ogle":"13:08","Yatsi":"21:05"},{"Aksam":"19:39","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/d2.gif","Gunes":"06:27","GunesBatis":"19:32","GunesDogus":"06:34","HicriTarihKisa":"16.1.1442","HicriTarihUzun":"16 Muharrem 1442","Ikindi":"16:46","Imsak":"04:58","KibleSaati":"11:56","MiladiTarihKisa":"04.09.2020","MiladiTarihKisaIso8601":"04.09.2020","MiladiTarihUzun":"04 Eylül 2020 Cuma","MiladiTarihUzunIso8601":"2020-09-04T00:00:00.0000000+03:00","Ogle":"13:08","Yatsi":"21:03"},{"Aksam":"19:38","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/d3.gif","Gunes":"06:28","GunesBatis":"19:31","GunesDogus":"06:35","HicriTarihKisa":"17.1.1442","HicriTarihUzun":"17 Muharrem 1442","Ikindi":"16:45","Imsak":"04:59","KibleSaati":"11:55","MiladiTarihKisa":"05.09.2020","MiladiTarihKisaIso8601":"05.09.2020","MiladiTarihUzun":"05 Eylül 2020 Cumartesi","MiladiTarihUzunIso8601":"2020-09-05T00:00:00.0000000+03:00","Ogle":"13:08","Yatsi":"21:01"},{"Aksam":"19:36","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/d4.gif","Gunes":"06:29","GunesBatis":"19:29","GunesDogus":"06:36","HicriTarihKisa":"18.1.1442","HicriTarihUzun":"18 Muharrem 1442","Ikindi":"16:44","Imsak":"05:00","KibleSaati":"11:54","MiladiTarihKisa":"06.09.2020","MiladiTarihKisaIso8601":"06.09.2020","MiladiTarihUzun":"06 Eylül 2020 Pazar","MiladiTarihUzunIso8601":"2020-09-06T00:00:00.0000000+03:00","Ogle":"13:07","Yatsi":"20:59"},{"Aksam":"19:35","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/d5.gif","Gunes":"06:30","GunesBatis":"19:27","GunesDogus":"06:37","HicriTarihKisa":"19.1.1442","HicriTarihUzun":"19 Muharrem 1442","Ikindi":"16:43","Imsak":"05:01","KibleSaati":"11:53","MiladiTarihKisa":"07.09.2020","MiladiTarihKisaIso8601":"07.09.2020","MiladiTarihUzun":"07 Eylül 2020 Pazartesi","MiladiTarihUzunIso8601":"2020-09-07T00:00:00.0000000+03:00","Ogle":"13:07","Yatsi":"20:57"},{"Aksam":"19:33","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/d6.gif","Gunes":"06:31","GunesBatis":"19:26","GunesDogus":"06:38","HicriTarihKisa":"20.1.1442","HicriTarihUzun":"20 Muharrem 1442","Ikindi":"16:42","Imsak":"05:03","KibleSaati":"11:52","MiladiTarihKisa":"08.09.2020","MiladiTarihKisaIso8601":"08.09.2020","MiladiTarihUzun":"08 Eylül 2020 Salı","MiladiTarihUzunIso8601":"2020-09-08T00:00:00.0000000+03:00","Ogle":"13:07","Yatsi":"20:55"},{"Aksam":"19:31","AyinSekliURL":"https://namazvakti.diyanet.gov.tr/images/d7.gif","Gunes":"06:32","GunesBatis":"19:24","GunesDogus":"06:39","HicriTarihKisa":"21.1.1442","HicriTarihUzun":"21 Muharrem 1442","Ikindi":"16:41","Imsak":"05:04","KibleSaati":"11:51","MiladiTarihKisa":"09.09.2020","MiladiTarihKisaIso8601":"09.09.2020","MiladiTarihUzun":"09 Eylül 2020 Çarşamba","MiladiTarihUzunIso8601":"2020-09-09T00:00:00.0000000+03:00","Ogle":"13:06","Yatsi":"20:53"}]';
