import 'package:flutter/material.dart';

class LogoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
            "assets/images/logo.jpg",
            height: 150.0,
            width: 210.0,
            fit: BoxFit.scaleDown,
          )
        ],
      ),
    );
  }
}
