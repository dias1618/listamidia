import 'package:listamidia/app/services/message-manager/message-struct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:listamidia/app/services/message-manager/message_manager_service.dart';

class ToastyMessageManagerService extends Disposable implements MessageManagerService {

  FlutterToast flutterToast;
  
  @override
  void initMessage(BuildContext context){
    this.flutterToast = FlutterToast(context);
  }

  @override
  void dialogMessage(String message, {
      int timeMessage=3, 
      MessageStruct messageStruct
    }) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: this.chooseColor(messageStruct)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            this.chooseIconData(messageStruct),
            color: Colors.white,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            message,
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ],
      ),
    );

    flutterToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: timeMessage),
    );
  }


  Color chooseColor(MessageStruct messageStruct){
    if(messageStruct == null){
      return Theme.of(this.flutterToast.context).accentColor;
    }
    return messageStruct.color;
  }

  IconData chooseIconData(MessageStruct messageStruct){
    if(messageStruct == null){
      return Icons.check;
    }
    return messageStruct.iconData;
  }

  @override
  void dispose() {}

}