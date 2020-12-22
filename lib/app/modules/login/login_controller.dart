import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  AuthController auth = Modular.get();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  @observable
  String titulo;
  @observable
  String conteudo;
  @observable
  bool loading = false;
  @observable
  bool erro = false;
  @action
  String validaEmail(valor) {
    if (valor.isEmpty) {
      return 'O campo e-mail não pode ser vazio.';
    }
    if (!RegExp(constants.regexEmail).hasMatch(valor)) {
      return 'Insira um e-mail válido.';
    }
    return null;
  }

  @action
  String validaSenha(valor) {
    if (valor.isEmpty) {
      return 'O campo e-mail não pode ser vazio.';
    }
    return null;
  }

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await auth.loginWithGoogle();
      Modular.to.pushReplacementNamed('/home');
    } catch (e) {
      loading = false;
    }
  }

  @action
  Future loginWithEmail() async {
    loading = true;
    var objeto = await auth.loginWithEmail(
      email: emailController.text,
      senha: senhaController.text,
    );
    // Verifica se tem erro
    if (objeto['texto'] != null) {
      titulo = 'Erro';
      conteudo = objeto['texto'];
      erro = true;
    } else {
      // Se não tiver, vai para a tela home
      Modular.to.pushReplacementNamed('/home');
    }
  }
}
