import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:quest/services/http_interceptors.dart';

class ApiService{
  static const String url = "http://172.19.240.1:3000/";
  static const String resource = "personagens/";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  String getURL() {
    return "$url$resource";
  }

  Uri getUri() {
    return Uri.parse(getURL());
  }

  void register(String content) {
    client.post(Uri.parse(getURL()), body: {'content': content});
  }

  void get() async {
    http.Response response = await client.get(Uri.parse(getURL()));
  }
}