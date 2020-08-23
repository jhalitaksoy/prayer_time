import 'package:prayer_time/model/prayer_time.dart';

///
/// Static String Store
///
class TextProvider {
  String getPrayerTimeName(PrayerTimeType prayerTimeType) {
    return prayerTimeNames[prayerTimeType.index];
  }

  final prayerTimeNames = [
    "İmsak",
    "Güneş",
    "Öğle",
    "İkindi",
    "Akşam",
    "Yatsı",
  ];

  final nowText = "Şuan";

  final appBarText = "Namaz Vakti";

  final selectLocation = "Konum Seç";

  final shouldSelectCountry = "Önce ülke seçmelisiniz.";
  final shouldSelectCity = "Önce şehir seçmelisiniz.";

  final selectCountry = "Ülke seç.";
  final selectCity = "Şehir seç.";
  final selectCounty = "İlçe seç.";

  final hour = "saat";

  final minute = "dakika";

  final callToPrayerTime = "Ezan vakti.";

  String remainingTime(String text) {
    return text + " kaldı.";
  }

  static final TextProvider _textProvider = TextProvider._internal();

  factory TextProvider() {
    return _textProvider;
  }

  TextProvider._internal();
}
