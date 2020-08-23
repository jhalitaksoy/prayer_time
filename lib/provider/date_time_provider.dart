import 'package:prayer_time/config/config.dart';
import 'package:prayer_time/model/test_data.dart';

class DateTimeProvider {

  ///
  /// Get DateTime.now() or mock data.
  ///
  DateTime now() {
    if (isTest) {
      return currentTestData.now;
    } else {
      return DateTime.now();
    }
  }

  static final DateTimeProvider _dateTimeProvider =
      DateTimeProvider._internal();

  factory DateTimeProvider() {
    return _dateTimeProvider;
  }

  DateTimeProvider._internal();
}
