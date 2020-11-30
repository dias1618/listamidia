import 'dart:io';

import 'package:dio/dio.dart';
import 'package:listamidia/app/services/treat-error/treat-dio-error_service.dart';
import 'package:listamidia/app/services/treat-error/treat-error_service.dart';
import 'package:listamidia/app/shared/manager-repositories/parameter_repository.dart';
import 'package:listamidia/app/shared/manager-repositories/repository.dto.dart';
import 'package:listamidia/app/shared/manager-repositories/repository_manager.dart';

class DioRepositoryManager implements RepositoryManager{
  
  BaseOptions options;
  Dio dio;
  TreatDioErrorService treatErrorService;

  DioRepositoryManager(){
    options = new BaseOptions(
      //baseUrl: "http://dias1618.host:3000",
      baseUrl: "http://10.0.0.159:3000",
      connectTimeout: 5000,
    );

    dio = new Dio(options);
    treatErrorService = new TreatDioErrorService();
  }

  @override
  Future<RepositoryDto> execute(ParameterRepository parametros, dynamic data) async {
    return await create(parametros, data);
  }

  @override
  Future<RepositoryDto> create(ParameterRepository parametros, dynamic data) async {
    try{
      return this.createReturn(await dio.post(parametros.data['path'], data: data));
    } on DioError catch(dioException){
      this.treatErrorService.treat(dioException as Error);
    }
    
  }

  @override
  Future<RepositoryDto> delete(ParameterRepository parametros) async {
    try{
      return this.createReturn(await dio.delete(parametros.data['path']));
    } on DioError catch(dioException){
      this.treatErrorService.treat(dioException as Error);
    }
  }

  @override
  Future<RepositoryDto> read(ParameterRepository parametros) async {
    try{
      return this.createReturn(await dio.get(parametros.data['path']));
    } on DioError catch(dioException){
      this.treatErrorService.treat(dioException as Error);
    }
  }

  @override
  Future<RepositoryDto> update(ParameterRepository parametros, dynamic data) async {
    try{
      return this.createReturn(await dio.patch(parametros.data['path'], data: data));
    } on DioError catch(dioException){
      this.treatErrorService.treat(dioException as Error);
    }
  }

  RepositoryDto createReturn(Response response){
    return RepositoryDto(
      statusMessage: response.statusMessage, 
      data: response.data
    );
  }

}