import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/store/carrinho_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'detalhes_produto_controller.g.dart';

@Injectable()
class DetalhesProdutoController = _DetalhesProdutoControllerBase
    with _$DetalhesProdutoController;

abstract class _DetalhesProdutoControllerBase with Store {
  final CarrinhoStore _carrinhoStore;

  _DetalhesProdutoControllerBase(this._carrinhoStore);
  @action
  void adicionaProdutoNoCarrinho(ProdutoModel produtoModel) {
    _carrinhoStore.adicionarProdutoCarrinho(produtoModel);
  }
}
