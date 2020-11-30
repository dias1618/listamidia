import 'package:listamidia/app/repositories/repository.dart';
import 'package:listamidia/app/viewmodels/login.viewmodel.dart';
import 'package:listamidia/app/models/usuario.model.dart';
import 'package:listamidia/app/shared/manager-repositories/dio_repository_manager.dart';
import 'package:listamidia/app/shared/manager-repositories/parameter_repository.dart';
import 'package:listamidia/app/shared/manager-repositories/repository.dto.dart';
import 'package:listamidia/app/shared/manager-repositories/repository_manager.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsuarioRepository implements Repository{

  RepositoryManager repositoryManager = Modular.get<DioRepositoryManager>();

  Future<RepositoryDto> createUsuario(Usuario usuario) async{

    RepositoryDto repositoryDto = await repositoryManager.create(
      ParameterRepository(
        data: {
          "path": "/auth/signup"
        }
      ), 
      usuario.toJson()
    );

    return repositoryDto;
  }

  Future<RepositoryDto> login(LoginViewModel loginModel) async{
    RepositoryDto repositoryDto = await repositoryManager.execute(
      ParameterRepository(
        data: {
          "path": "/auth/login"
        }
      ), 
      LoginViewModel.fromJson({
        "login": loginModel.login,
        "senha": loginModel.senha
      })
    );
    return repositoryDto;
  }

}