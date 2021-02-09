import 'package:flutter/material.dart';
import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:inventos/app/shared/models/endereco_model.dart';
import 'package:inventos/app/shared/repositories/endereco/endereco_repository.dart';
import 'package:inventos/app/shared/store/usuarios_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'enderecos_controller.g.dart';

@Injectable()
class EnderecosController = _EnderecosControllerBase with _$EnderecosController;

abstract class _EnderecosControllerBase with Store {
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController ufController = TextEditingController();
  final TextEditingController referenciaController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final EnderecoRepository _enderecoRepository = Modular.get();
  final UsuariosStore _usuariosStore = Modular.get();
  List<dynamic> enderecoModel;
  Future atualizaValores() async {
    enderecoModel = await _enderecoRepository.getPost(uid: _usuariosStore.uid);
    cidadeController.text = enderecoModel.single?.cidade;
    enderecoController.text = enderecoModel.single?.endereco;
    bairroController.text = enderecoModel.single?.bairro;
    ufController.text = enderecoModel.single?.uf;
    referenciaController.text = enderecoModel.single?.referencia;
    cepController.text = enderecoModel.single?.cep;
  }

  Future atualizaEndereco() async {
    await _enderecoRepository.insertAtualizaEndereco(endereco: {
      'usuario': _usuariosStore.uid,
      'cidade': cidadeController.text,
      'bairro': bairroController.text,
      'endereco': enderecoController.text,
      'uf': ufController.text,
      'referencia': referenciaController.text,
      'cep': cepController.text
    });
    Modular.to.popAndPushNamed('/configuracoes',
        arguments: {'mensagem': 'Atualização Concluída!'});
  }

  @action
  String validaCidade(valor) {
    if (valor.isEmpty) {
      return 'O campo Cidade não pode ser vazio';
    }
    return null;
  }

  @action
  String validaEndereco(valor) {
    if (valor.isEmpty) {
      return 'O campo Endereco não pode ser vazio';
    }
    return null;
  }

  @action
  String validaBairro(valor) {
    if (valor.isEmpty) {
      return 'O campo Bairro não pode ser vazio';
    }
    return null;
  }

  @action
  String validaUf(valor) {
    if (valor.isEmpty) {
      return 'O campo UF não pode ser vazio';
    }
    return null;
  }

  @action
  String validaReferencia(valor) {
    if (valor.isEmpty) {
      return 'O campo Referência não pode ser vazio';
    }
    return null;
  }

  @action
  String validaCep(valor) {
    if (valor.isEmpty) {
      return 'O campo CEP não pode ser vazio';
    }
    return null;
  }
}
