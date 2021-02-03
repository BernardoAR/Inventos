import 'package:inventos/app/shared/models/carrinho_model.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/store/carrinho_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'carrinho_lista_produtos_controller.g.dart';

@Injectable()
class CarrinhoListaProdutosController = _CarrinhoListaProdutosControllerBase
    with _$CarrinhoListaProdutosController;

abstract class _CarrinhoListaProdutosControllerBase with Store {
  final CarrinhoStore _carrinhoStore;

  _CarrinhoListaProdutosControllerBase(this._carrinhoStore);

  @computed
  ObservableList<CarrinhoModel> get listaProdutos =>
      _carrinhoStore.produtosNoCarrinho;
  @action
  void removerProdutosNoCarrinho(ProdutoModel produtoModel) {
    _carrinhoStore.removerProdutosNoCarrinho(produtoModel);
  }
}
