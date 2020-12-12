import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/repositories/produtos/produtos_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'produtos_controller.g.dart';

class ProdutosController = _ProdutosControllerBase with _$ProdutosController;

abstract class _ProdutosControllerBase with Store {
  final IProdutosRepository _produtosRepository = Modular.get();

  @observable
  List<ProdutoModel> produto;

  @action
  setProdutos(dynamic value) {
    produto = value;
  }

  @action
  _ProdutosControllerBase() {
    _produtosRepository.fetchProdutos().then(setProdutos);
  }
  @action
  Future getListaProdutos() async {
    return await _produtosRepository.fetchProdutos();
  }
}
