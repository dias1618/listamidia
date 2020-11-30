import 'package:listamidia/app/models/usuario.model.dart';
import 'package:listamidia/app/repositories/usuario.repository.dart';
import 'package:listamidia/app/repositories/repository.dart';
import 'package:listamidia/app/services/loading-manager/loading_manager_service.dart';
import 'package:listamidia/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:listamidia/app/services/message-manager/message_manager_service.dart';
import 'package:listamidia/app/shared/manager-repositories/repository.dto.dart';
import 'package:listamidia/app/stores/usuario.store.dart';
import 'package:listamidia/app/viewmodels/login.viewmodel.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  UsuarioStore usuarioStore = Modular.get<UsuarioStore>();
  UsuarioRepository usuarioRespository = Modular.get<UsuarioRepository>();
  LoadingManagerService progressDialogService = Modular.get<ProgressLoadingManagerService>();

  @observable
  TextEditingController _idController = new TextEditingController();
  @action
  TextEditingController idController() {
    return _idController;
  }

  @observable
  TextEditingController _senhaController = new TextEditingController();
  @action
  TextEditingController senhaController() {
    return _senhaController;
  }

  @action
  Future signup(GlobalKey<FormState> globalKey) async {
    globalKey.currentState.reset();
    await Modular.to.pushNamed('/signup');
  }

  @action
  Future login(GlobalKey<FormState> globalKey) async {
    progressDialogService.showLoading('Autenticando...');
    try{
      RepositoryDto repositoryDto = await usuarioRespository.login(LoginViewModel(
        login: idController().value.text,
        senha: senhaController().value.text,
      ));

      usuarioStore.usuario = Usuario.fromJson(repositoryDto.data);
      globalKey.currentState.reset();
      Modular.to.pushReplacementNamed('/home');
      
    }catch(error){
      progressDialogService.hideLoading(error.statusMessage, MessageManagerService.MESSAGE_ERROR);
    }

  }
  
}
