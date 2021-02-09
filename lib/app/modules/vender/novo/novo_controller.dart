import 'package:flutter/material.dart';
import 'package:inventos/app/shared/repositories/produtos/produtos_controller.dart';
import 'package:inventos/app/shared/store/usuarios_store.dart';
import 'package:inventos/app/shared/widgets/imagem/imagem_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'novo_controller.g.dart';

@Injectable()
class NovoController = _NovoControllerBase with _$NovoController;

abstract class _NovoControllerBase with Store {
  ProdutosController produto = Modular.get();
  ImagemController imagemController =
      ImagemController(caminho: 'uploads/produtos');
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController quantidadeController = TextEditingController();
  final TextEditingController precoUnitarioController = TextEditingController();
  final TextEditingController descontoController = TextEditingController();
  final TextEditingController categoriaController = TextEditingController();
  final _tipoProduto = {'1': 'Alugar', '2': 'Vender'};
  final UsuariosStore _usuariosStore = Modular.get();
  get tiposProduto => _tipoProduto;
  @observable
  var itemSelecionado = '1';
  @action
  atualizaItemSelecionado(String valor) {
    itemSelecionado = valor;
  }

  @action
  Future insereProduto() async {
    try {
      var produtoDetalhes = {
        'ativo': 1,
        'desconto': double.parse(descontoController.text),
        'descricao': descricaoController.text,
        'precoUnitario': double.parse(precoUnitarioController.text),
        'quantidade': int.parse(quantidadeController.text),
        'tipoProduto': itemSelecionado,
        'titulo': tituloController.text,
        'url': imagemController.url,
        'usuario': _usuariosStore.uid
      };
      var categoria = {'nome': categoriaController.text};
      produto.inserirProduto(produtoDetalhes, categoria);
      Modular.to.popAndPushNamed('/vender',
          arguments: {'mensagem': 'Cadastro de Produto/Serviço Concluído!'});
    } catch (e) {
      print(e);
    }
  }

  @action
  String validaTitulo(valor) {
    if (valor.isEmpty) {
      return 'O campo Título não pode ser vazio';
    }
    return null;
  }

  @action
  String validaDescricao(valor) {
    if (valor.isEmpty) {
      return 'O campo Descrição não pode ser vazio.';
    }
    return null;
  }

  @action
  String validaQuantidade(valor) {
    if (valor.isEmpty) {
      return 'O campo Quantidade não pode ser vazio.';
    }
    return null;
  }

  @action
  String validaPrecoUnitario(valor) {
    if (valor.isEmpty) {
      return 'O campo Preço Unitário não pode ser vazio.';
    }
    return null;
  }

  @action
  String validaDesconto(valor) {
    if (valor.isEmpty) {
      return 'O campo Desconto por Unidade não pode ser vazio.';
    }
    return null;
  }

  @action
  String validaCategoria(valor) {
    if (valor.isEmpty) {
      return 'O campo Categoria não pode ser vazio.';
    }
    return null;
  }
}
