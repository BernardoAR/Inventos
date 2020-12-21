import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'menu_controller.g.dart';

@Injectable()
class MenuController = _MenuControllerBase with _$MenuController;

abstract class _MenuControllerBase with Store {
  AuthController auth = Modular.get();
  @observable
  dynamic usuario;

  @action
  setUsuario() {
    usuario = auth.getUserProfile;
  }

  @action
  deslogar() {
    Modular.get<AuthController>().logOut();
    Modular.to.pushReplacementNamed('/login', arguments: {'mensagem': ''});
  }
}
