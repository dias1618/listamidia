import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listamidia/app/modules/login/components/cadastrar_component.dart';
import 'package:listamidia/app/modules/login/components/enter_component.dart';
import 'package:listamidia/app/modules/login/components/id_component.dart';
import 'package:listamidia/app/modules/login/components/logo_component.dart';
import 'package:listamidia/app/modules/login/components/senha_component.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  GlobalKey<FormState> _formKey = Modular.get<GlobalKey<FormState>>();
  final loginController = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: ListView(
        shrinkWrap: true, 
        reverse: false, 
        children: <Widget>[
          Column(
            children: <Widget>[
              new SizedBox(
                height: 60.0,
              ),
              LogoComponent(),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IdComponent(
                        idController: loginController.idController(),
                      ),
                      SenhaComponent(
                        senhaController: loginController.senhaController(),
                      ),
                      EnterComponent(
                        onPressed: loginController.login,
                      ),
                      CadastrarComponent(
                        onPressed: loginController.signup)
                    ]
                  )
                ),
              )
            ],
          ),
        ]
      )
    );
  }
}
