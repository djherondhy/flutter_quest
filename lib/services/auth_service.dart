import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:quest/services/http_interceptors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String url = "http://10.0.2.2:8000/api/";


  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  Future<bool> login({required String username, required String password}) async {
    http.Response response = await client.post(
      Uri.parse('${url}token/'),
      body:{
        'username' : username,
        'password': password
      }
    );

    if(response.statusCode != 200){
        throw UserNotFindException();
    }

    saveUserInfo(response.body);
    return true;
  }

  register({required String username, required String password}) async {
    http.Response response = await client.post(
        Uri.parse('${url}characters/register/'),
        body:{
          'username' : username,
          'password': password
        }
    );

    if(response.statusCode != 201){
      print(response.statusCode);

    }

  }

  saveUserInfo(String body) async{
    Map<String, dynamic> map = json.decode(body);
    String token = map["access"];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("access", token);
    print(prefs.getString("access"));

  }
}

class UserNotFindException implements Exception{

}
