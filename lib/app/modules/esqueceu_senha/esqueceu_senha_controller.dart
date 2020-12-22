import 'package:flutter/material.dart';
import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
part 'esqueceu_senha_controller.g.dart';

@Injectable()
class EsqueceuSenhaController = _EsqueceuSenhaControllerBase
    with _$EsqueceuSenhaController;

abstract class _EsqueceuSenhaControllerBase with Store {
  AuthController auth = Modular.get();
  final TextEditingController emailController = TextEditingController();
  @observable
  String titulo;
  @observable
  String conteudo;
  @observable
  bool loading = false;
  @observable
  bool erro = false;
  @action
  Future enviaPedidoRecuperacao() async {
    var objeto = await auth.resetaSenha(email: emailController.text);
    // Verifica se tem erro
    if (objeto['texto'] != null) {
      titulo = 'Erro';
      conteudo = objeto['texto'];
      erro = true;
    } else {
      // Se não tiver, vai para a tela home
      Modular.to.popAndPushNamed('/login', arguments: {
        'mensagem':
            'E-mail de recuperação enviado! Verifique sua caixa de e-mail.'
      });
    }
  }

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
}
