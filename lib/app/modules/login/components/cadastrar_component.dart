import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CadastrarComponent extends StatefulWidget {

  final Function onPressed;

  const CadastrarComponent({Key key, this.onPressed}) : super(key: key);  


  @override
  _CadastrarComponentState createState() => _CadastrarComponentState();
}

class _CadastrarComponentState extends State<CadastrarComponent> {
  GlobalKey globalKey = Modular.get<GlobalKey<FormState>>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0), 
      child: FlatButton(
        onPressed: (){
          widget.onPressed(globalKey);
        }, 
        child: Text(
          'Cadastre-se',
          style: TextStyle(
            color: Colors.blue[900],
            decoration: TextDecoration.underline,
            fontSize: 18.0
          ),
        )
      ) 
    );
  }
}