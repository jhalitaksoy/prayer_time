import 'package:flutter_test/flutter_test.dart';
import 'package:prayer_time/model/test_data.dart';
import 'package:prayer_time/provider/prayer_time_provider.dart';

void main() {
  group("Prayer Time Provider Test", () {
    test("Prayer Time Provider Test", () async {
      var remaningTime = await PrayerTimeProvider().calculateRemaningTime();

      expect(remaningTime.previousPrayerTime.type,
          currentTestData.remaningTime.previousPrayerTime.type);
          
      expect(remaningTime.nextPrayerTime.type,
          currentTestData.remaningTime.nextPrayerTime.type);
    });
  });
}
