import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:quest/models/Personagem.dart';
import 'package:quest/services/http_interceptors.dart';

class ApiService {
  static const String url = "http://127.0.0.1:8000/api/";
  static const String resource = "characters/";
  static const String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM3NDc0MzU4LCJpYXQiOjE3Mzc0NzQwNTgsImp0aSI6IjBjZDc0MjFhMTk1NTRlMTU5OGJmN2I1YmI4Y2RhMzViIiwidXNlcl9pZCI6MX0.f8qqkz43GbaR9s9JibzWUqfoHYUR2q9qi5-Ov9bHdEQ";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggingInterceptor()],
  );

  String getURL() {
    return 'http://10.0.2.2:8000/api/characters/';
  }

  Uri getUri() {
    return Uri.parse(getURL());
  }

  Future<bool> register(Personagem personagem) async {
    String jsonPersonagem = json.encode(personagem.toMap());

    http.Response response = await client.post(
      Uri.parse(getURL()),
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonPersonagem,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return true;
  }

  Future<List<Personagem>> getAll() async {
    http.Response response = await client.get(Uri.parse(getURL()),
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzM3NDc1NDk5LCJpYXQiOjE3Mzc0NzUxOTksImp0aSI6ImExN2U2NDVkOTdhNTQ4NjE4MzA4ZDg4NDdlM2ZjMGMyIiwidXNlcl9pZCI6MX0.5XB0dI0TWlRIqt2uBgwQU0Cf2CTq6vpc24g_gE5PO6A",
        "Content-Type": "application/json"
      },
    );


    if (response.statusCode != 200) {
      throw Exception('Erro: ${response.body}');
    }
    List<Personagem> list = [];
    List<dynamic> dynamicList = json.decode(response.body);

    for (var jsonMap in dynamicList) {
      list.add(Personagem.fromMap(jsonMap));
    }
    print(list);
    return list;
  }

  Future<bool> delete(String? id) async {
    final Uri deleteUri = Uri.parse('${getURL()}$id');

    http.Response response = await client.delete(deleteUri);

    if (response.statusCode == 200) {
      return true; // Sucesso
    } else {
      throw Exception('Erro ao deletar o personagem com ID: $id');
    }
  }

}
