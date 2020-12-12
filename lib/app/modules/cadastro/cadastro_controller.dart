import 'package:flutter/material.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'cadastro_controller.g.dart';

@Injectable()
class CadastroController = _CadastroControllerBase with _$CadastroController;

abstract class _CadastroControllerBase with Store {
  AuthController auth = Modular.get();
  @observable
  String titulo;
  @observable
  String conteudo;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final form = GlobalKey<FormState>();
  @observable
  bool loading = false;
  @observable
  bool erro = false;

  @action
  Future cadastraComEmail() async {
    loading = true;
    var objeto = await auth.cadastraComEmail(
      email: emailController.text,
      senha: senhaController.text,
      nome: nomeController.text,
    );
    // Verifica se tem erro
    if (objeto['temErro']) {
      titulo = 'Erro';
      conteudo = objeto['texto'];
      erro = true;
    } else {
      // Se não tiver, vai para a tela de login
      Modular.to.pushReplacementNamed('/login', arguments: {
        'mensagem': 'Cadastro concluído! Verifique sua caixa de e-mail'
      });
    }
  }

  @action
  String validaNome(valor) {
    if (valor.isEmpty) {
      return 'O campo nome não pode ser vazio';
    }
    return null;
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

  @action
  String validaSenha(valor) {
    if (valor.isEmpty) {
      return 'O campo e-mail não pode ser vazio.';
    }
    return null;
  }
}
