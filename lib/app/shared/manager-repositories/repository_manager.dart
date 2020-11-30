import 'package:listamidia/app/shared/manager-repositories/parameter_repository.dart';
import 'package:listamidia/app/shared/manager-repositories/repository.dto.dart';

abstract class RepositoryManager{
  Future<RepositoryDto> execute(ParameterRepository parametros, dynamic data);
  Future<RepositoryDto> create(ParameterRepository parametros, dynamic data);
  Future<RepositoryDto> read(ParameterRepository parametros);
  Future<RepositoryDto> update(ParameterRepository parametros, dynamic data);
  Future<RepositoryDto> delete(ParameterRepository parametros);
}