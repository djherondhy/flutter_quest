import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:quest/models/Personagem.dart';
import 'package:quest/services/http_interceptors.dart';

class ApiService {
  static const String url = "http://10.0.2.2:8000/api/";
  static const String resource = "characters/";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  String getURL() {
    return 'http://10.0.2.2:8000/api/characters/';
  }

  Uri getUri() {
    return Uri.parse(getURL());
  }

  Future<bool> register(Personagem personagem, String Token) async {
    String jsonPersonagem = json.encode(personagem.toMap());

    http.Response response = await client.post(
      Uri.parse(getURL()),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $Token'
      },
      body: jsonPersonagem,
    );
    if (response.statusCode == 201) {
      return true;
    }

    return true;
  }

  Future<bool> isTokenValid(String token) async {
    final response = await client.post(
      Uri.parse("http://10.0.2.2:8000/api/token/verify/"),
      // Supondo que este seja o endpoint para validar o token
      body: {
        "token": token
      },
    );

    // Se a resposta for 200, o token é válido
    if (response.statusCode == 200) {
      return true;
    }

    // Caso contrário, o token não é válido
    return false;
  }


  Future<List<Personagem>> getAll(String token) async {
    // Verificar se o token é válido antes de fazer a requisição
    bool isValid = await isTokenValid(token);
    if (!isValid) {
      throw UnauthorizedException(); // Lança exceção caso o token não seja válido
    }

    // Agora que sabemos que o token é válido, continuamos com a requisição
    final response = await client.get(
      Uri.parse(getURL()),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 401) {
      throw UnauthorizedException();
    }

    List<dynamic> dynamicList = json.decode(response.body);
    return dynamicList.map((jsonMap) => Personagem.fromMap(jsonMap)).toList();
  }


  Future<bool> delete(String? id, String Token) async {
    final Uri deleteUri = Uri.parse('${getURL()}$id/');

    http.Response response = await client.delete(deleteUri,
      headers: {
      "Authorization": "Bearer $Token",
      "Content-Type": "application/json",
      },);

    if (response.statusCode == 204) {
      return true; // Sucesso
    } else {
      throw Exception('Erro ao deletar o personagem com ID: $id');
    }
  }
}

class UnauthorizedException implements Exception {}
