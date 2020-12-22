import 'package:firebase_auth/firebase_auth.dart';
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
  get userProfile => user;

  @action
  _AuthControllerBase() {
    _authRepository.user.then(setUser);
  }
  @action
  Future cadastraComEmail({email, senha, nome}) async {
    return _authRepository.createEmailPasswordLogin(
        email: email, senha: senha, nome: nome);
  }

  @action
  Future resetaSenha({email}) async {
    String texto;
    try {
      await _authRepository.resetPassword(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        texto += 'E-mail inválido.';
      } else if (e.code == 'user-not-found') {
        texto += 'Usuário não encontrado.';
      }
    }
    return {'texto': texto};
  }

  @action
  Future loginWithEmail({email, senha}) async {
    String texto;
    try {
      user = await _authRepository.getEmailPasswordLogin(
          email: email, senha: senha);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        texto += 'E-mail não encontrado.';
      } else if (e.code == 'wrong-password') {
        texto += 'Senha incorreta.';
      }
    }
    return {'texto': texto};
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
