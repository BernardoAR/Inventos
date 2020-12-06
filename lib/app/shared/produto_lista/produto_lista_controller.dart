import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/produto_lista/repositories/produto_lista_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'produto_lista_controller.g.dart';

class ProdutoListaController = _ProdutoListaControllerBase
    with _$ProdutoListaController;

abstract class _ProdutoListaControllerBase with Store {
  final IProdutoListaRepository _produtoRepository = Modular.get();

  @observable
  List<ProdutoModel> produto;

  @action
  setProdutos(dynamic value) {
    produto = value;
  }

  @action
  _ProdutoListaControllerBase() {
    _produtoRepository.getProdutos().then(setProdutos);
  }
  @action
  Future getListaProdutos() async {
    return await _produtoRepository.getProdutos();
  }
}
