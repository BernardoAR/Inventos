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

  void adicionaProdutoNoCarrinho(produtoModel) {
    _carrinhoStore.adicionarProdutoCarrinho(produtoModel);
  }
}
