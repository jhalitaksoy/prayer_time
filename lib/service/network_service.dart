import 'package:logging/logging.dart';
import 'package:prayer_time/config/config.dart';
import 'package:prayer_time/model/test_data.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  ///
  ///Logging
  final logger = Logger("NetworkService");

  ///
  ///Remote adress
  final String url = "https://ezanvakti.herokuapp.com";

  ///
  /// Perform get request to server adress with given route
  ///
  Future<String> performGet(String route) async {
    if (isTest) {
      return currentTestData.networkData;
    } else {
      logger.info('Performing Get Request to ${url + route} ...');
      var response = await http.get(url + route);
      logger.info('Get Request Response status: ${response.statusCode}');
      return response.body;
    }
  }

  static final NetworkService _networkService = NetworkService._internal();

  factory NetworkService() {
    return _networkService;
  }

  NetworkService._internal();
}
