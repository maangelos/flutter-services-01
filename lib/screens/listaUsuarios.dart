import 'dart:convert';
import 'package:flutter/material.dart';

import '../url.dart';

final title = 'Lista de Usuários';

class AppListaUsuarios extends StatelessWidget {

  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaUsuarios(),
    );
  }
}

class ListaUsuarios extends StatefulWidget {
  @override
  _ListaUsuariosState createState() => _ListaUsuariosState();
}
class _ListaUsuariosState extends State<ListaUsuarios> {

  List<AlbumUsuario> usuarios = new List<AlbumUsuario>();

  _ListaUsuariosState() {
    URL.getUsuarios().then((dados){
      setState(() {
        Iterable lista = json.decode(dados.body);
        usuarios = lista.map((model) => AlbumUsuario.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount : usuarios.length,
          itemBuilder: (context, index) {
            return usuario(index);
          },
        )
    );
  }

  Card usuario(int index) {
    return Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person_outline),
              title: Text(usuarios[index].nome, style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              title: Text(usuarios[index].cidade, style: TextStyle(color: Colors.black54)),
              leading: Icon(Icons.location_on),
            )
          ],
        )
    );
  }
}
