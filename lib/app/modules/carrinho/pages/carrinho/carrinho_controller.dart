import 'package:inventos/app/shared/store/carrinho_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'carrinho_controller.g.dart';

@Injectable()
class CarrinhoController = _CarrinhoControllerBase with _$CarrinhoController;

abstract class _CarrinhoControllerBase with Store {
  final CarrinhoStore _carrinhoStore = Modular.get();
  atualizarProdutosCarrinho() {
    _carrinhoStore.atualizaProdutoCarrinho();
  }
}
