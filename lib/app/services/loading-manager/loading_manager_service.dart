import 'package:flutter_modular/flutter_modular.dart';
import 'package:listamidia/app/services/message-manager/message-struct.dart';

abstract class LoadingManagerService extends Disposable {
  void showLoading(String message);
  void updateMessage(String newMessage);
  void hideLoading([String message, MessageStruct messageStruct]);
  
  @override
  void dispose();
}