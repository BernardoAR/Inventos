import 'package:flutter/cupertino.dart';
import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:inventos/app/shared/widgets/imagem/imagem_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
part 'perfil_controller.g.dart';

@Injectable()
class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  AuthController auth = Modular.get();
  ImagemController imagemController =
      ImagemController(caminho: 'uploads/fotoPerfil');
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController novaSenhaController = TextEditingController();
  @observable
  bool logadoGoogle = false;

  _PerfilControllerBase() {
    imagemController.online = true;
    imagemController.url = auth.userProfile.user.photoURL;
    nomeController.text = auth.userProfile.user.displayName;
    if (!logadoGoogle) {
      emailController.text = auth.userProfile.user.email;
    }
  }
  @action
  Future atualizaDados() async {
    await auth.atualizaPerfil(
        email: emailController.text,
        senha: senhaController.text,
        novaSenha: novaSenhaController.text,
        nome: nomeController.text,
        url: imagemController.url);
    Modular.to.popAndPushNamed('/configuracoes',
        arguments: {'mensagem': 'Atualização Concluída!'});
  }

  @action
  Future atualizaLogadoGoogle() async {
    logadoGoogle = await auth.estaLogadoGoogle();
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
    if (!logadoGoogle) {
      if (valor.isEmpty) {
        return 'O campo e-mail não pode ser vazio.';
      }
      if (!RegExp(constants.regexEmail).hasMatch(valor)) {
        return 'Insira um e-mail válido.';
      }
    }
    return null;
  }

  @action
  String validaSenha(valor) {
    if (!logadoGoogle) {
      if (valor.isEmpty) {
        return 'O campo senha não pode ser vazio.';
      }
    }
    return null;
  }
}
