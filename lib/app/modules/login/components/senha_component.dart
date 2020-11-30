import 'package:flutter/material.dart';

class SenhaComponent extends StatefulWidget {

  final TextEditingController senhaController;

  const SenhaComponent({Key key, this.senhaController}) : super(key: key);  

  @override
  _SenhaComponentState createState() => _SenhaComponentState();
}

class _SenhaComponentState extends State<SenhaComponent> {
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      obscureText: true,
      controller: widget.senhaController,
      autofocus: false,
      decoration: new InputDecoration(
        labelText: "Senha",
        
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Digite uma senha';
        }
        return null;
      },
      keyboardType: TextInputType.text,
    );
  }
}