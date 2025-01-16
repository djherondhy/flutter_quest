import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:quest/models/Personagem.dart';
import 'package:quest/services/http_interceptors.dart';

class ApiService {
  static const String url = "http://172.31.16.1:3000/";
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

  Future<bool> register(Personagem personagem) async {
    String jsonPersonagem = json.encode(personagem.toMap());

    http.Response response = await client.post(
      Uri.parse(getURL()),
      headers: {'Content-type': 'application/json'},
      body: jsonPersonagem,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return true;
  }

  Future<List<Personagem>> getAll() async {
    http.Response response = await client.get(Uri.parse(getURL()));

    if(response.statusCode != 200){
      throw Exception();
    }
    List<Personagem> list = [];
    List<dynamic> dynamicList = json.decode(response.body);

    for(var jsonMap in dynamicList){
      list.add(Personagem.fromMap(jsonMap));
    }
    print(list.length);
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
