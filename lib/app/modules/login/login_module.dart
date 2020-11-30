import 'package:flutter/material.dart';
import 'package:listamidia/app/repositories/usuario.repository.dart';
import 'package:listamidia/app/services/loading-manager/progress_loading_manager_service.dart';
import 'package:listamidia/app/shared/manager-repositories/dio_repository_manager.dart';

import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    $LoginController,
    Bind((i) => DioRepositoryManager()),
    Bind((i) => UsuarioRepository()),
    Bind((i) => ProgressLoadingManagerService()),
    Bind((i) => GlobalKey<FormState>(debugLabel: '1'))
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}
