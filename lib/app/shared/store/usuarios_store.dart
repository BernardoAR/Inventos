import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:inventos/app/shared/models/usuario_model.dart';
import 'package:inventos/app/shared/repositories/usuarios/usuarios_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'usuarios_store.g.dart';

@Injectable()
class UsuariosStore = _UsuariosStoreBase with _$UsuariosStore;

abstract class _UsuariosStoreBase with Store {
  final UsuariosRepository _usuariosRepository = Modular.get();
  AuthController auth = Modular.get();
  @observable
  UsuarioModel _usuario;

  @action
  setUsuario(dynamic value) {
    _usuario = value;
  }

  get usuario => _usuario;
  get uid => auth.userProfile.user.uid;

  _UsuariosStoreBase() {
    _usuariosRepository.pegaDadosUsuarioUid(uid).then(setUsuario);
  }
}
