import 'package:logging/logging.dart';
import 'package:prayer_time/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  ///
  ///Logging
  final logger = Logger("LocalStorageService");

  ///
  ///Local Storage for testing.
  Map<String, dynamic> testStorage = {};

  ///
  /// Clear data that named [name] from local storage.
  ///
  Future<bool> clear(String name) async {
    logger.info('Called clear $name');
    if (isTest) {
      return testStorage.remove(name);
    } else {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.remove(name);
    }
  }

  ///
  /// Read data that named [name] from local storage.
  ///
  Future<String> read(String name) async {
    logger.info('Called read $name');
    if (isTest) {
      return testStorage[name];
    } else {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(name);
    }
  }

  ///
  /// Write [data] that named [name] from local storage.
  ///
  Future<bool> write(String name, String data) async {
    logger.info('Called write $name');
    if (isTest) {
      testStorage[name] = data;
      return true;
    } else {
      final prefs = await SharedPreferences.getInstance();
      return await prefs.setString(name, data);
    }
  }

  static final LocalStorageService _localStorageService =
      LocalStorageService._internal();

  factory LocalStorageService() {
    return _localStorageService;
  }

  LocalStorageService._internal();
}
