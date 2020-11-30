
import 'package:listamidia/app/services/loading-manager/loading_manager_service.dart';
import 'package:listamidia/app/services/message-manager/message-struct.dart';
import 'package:listamidia/app/services/message-manager/toasty_message_manager_service.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:listamidia/app/services/message-manager/message_manager_service.dart';

class ProgressLoadingManagerService implements LoadingManagerService {

  static ProgressDialog progressDialogSingleton;
  static MessageManagerService messageManager;
  
 
  static initProgressDialog(context){
    progressDialogSingleton = new ProgressDialog(context, isDismissible: false);
    messageManager = ToastyMessageManagerService();
    messageManager.initMessage(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void hideLoading([String message, MessageStruct messageStruct]) {
    Future.delayed(Duration(seconds: 3)).then((value) {
      progressDialogSingleton.hide().whenComplete(() {
        if(message != null)
          messageManager.dialogMessage(
            message, 
            messageStruct: messageStruct
          );
      });
    });
  }

  @override
  void showLoading(String message) {
    progressDialogSingleton.style(
      message: message,
    );
    progressDialogSingleton.show();
  }

  @override
  void updateMessage(String newMessage, [double progress]) {
    progressDialogSingleton.update(
      progress: progress,
      message: newMessage,
    );
  }
}