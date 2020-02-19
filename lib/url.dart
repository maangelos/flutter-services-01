import 'package:http/http.dart' as http;

const url = "https://jsonplaceholder.typicode.com/users";

class URL {
  static Future getUsuarios() async{
    return await http.get(url);
  }
}

class AlbumUsuario {
  final String nome;
  final String cidade;
  AlbumUsuario({this.nome, this.cidade});
  factory AlbumUsuario.fromJson(Map<String, dynamic> json) {
    return AlbumUsuario(
      nome: json['name'],
      cidade: json['address']['city'],
    );
  }
}