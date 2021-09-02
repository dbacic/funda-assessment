import 'package:funda_assessment/services/environment_variables.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

// wrapping the http client in order to inject headers and switch server urls
@sealed
class HttpClient {
  final client = Client();

  // here we can choose base on the (kReleaseMode) property which server url to use
  // or by any other method and also if necessary add some authorization headers
  // and other stuff
  Future<Response> doGet(String endpoint) {
    final url = Uri.parse('$baseServerUrl$endpoint');
    return client.get(url);
  }

  // We would create also for other methods (post, delete, put) and also add additional parameters in the method like headers and body
}
