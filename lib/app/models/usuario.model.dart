import 'package:listamidia/app/models/model.dart';

class Usuario implements Model {
  int id;
  String nome;
  String login;
  String senha;
  String email;

  Usuario({this.id, this.nome, this.login, this.senha, this.email});

  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    login = json['login'];
    senha = json['senha'];
    email = json['email'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['login'] = this.login;
    data['senha'] = this.senha;
    data['email'] = this.email;
    return data;
  }
}