import 'package:listamidia/app/services/message-manager/message-struct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class MessageManagerService extends Disposable {

  static MessageStruct MESSAGE_ERROR = MessageStruct(
    iconData: Icons.error,
    color: Colors.red
  );

  static MessageStruct MESSAGE_OK = MessageStruct(
    iconData: Icons.check,
    color: Colors.green
  );

  void initMessage(BuildContext context);

  void dialogMessage(String message, {
    int timeMessage=3, 
    MessageStruct messageStruct
  });

  @override
  void dispose();
}