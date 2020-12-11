import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();
  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  dynamic user;

  @action
  setUser(dynamic value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  @computed
  get getUserProfile => user.additionalUserInfo.profile;

  @action
  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }
  @action
  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleLogin();
  }

  @action
  Future logOut() {
    return _authRepository.getLogOut();
  }
}

enum AuthStatus { loading, login, logoff }
