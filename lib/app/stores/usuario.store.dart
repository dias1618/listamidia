import 'package:mobx/mobx.dart';
import 'package:listamidia/app/models/usuario.model.dart';

part 'usuario.store.g.dart';

class UsuarioStore = _UsuarioStoreBase with _$UsuarioStore;

abstract class _UsuarioStoreBase with Store{
  @observable
  Usuario usuario;
}