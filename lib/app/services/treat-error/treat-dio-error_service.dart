import 'package:dio/dio.dart';
import 'package:listamidia/app/services/treat-error/treat-error_service.dart';
import 'package:listamidia/app/shared/manager-repositories/repository.dto.dart';

class TreatDioErrorService implements TreatErrorService{

  @override
  void treat(Error error){
    DioError dioError = error as DioError;
    if(dioError.type == DioErrorType.DEFAULT)
      throw RepositoryDto(
        statusMessage: 'Erro de conexão', 
        data: null
      );
    else if(dioError.type == DioErrorType.CONNECT_TIMEOUT)
      throw RepositoryDto(
        statusMessage: 'Tempo de conexão expirou', 
        data: null
      );
    else if(dioError.type == DioErrorType.RESPONSE){
      throw RepositoryDto(
        statusMessage: dioError.response.data['message'], 
        data: null
      );
    }
  }

}