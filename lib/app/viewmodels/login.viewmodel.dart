import 'package:listamidia/app/viewmodels/viewmodel.dart';

class LoginViewModel implements ViewModel{
  String login;
  String senha;
  
  LoginViewModel({this.login, this.senha});

  LoginViewModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    senha = json['senha'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['senha'] = this.senha;
    return data;
  }
  
}