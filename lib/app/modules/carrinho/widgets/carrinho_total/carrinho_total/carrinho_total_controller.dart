import 'package:inventos/app/shared/store/carrinho_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'carrinho_total_controller.g.dart';

@Injectable()
class CarrinhoTotalController = _CarrinhoTotalControllerBase
    with _$CarrinhoTotalController;

abstract class _CarrinhoTotalControllerBase with Store {
  final CarrinhoStore _carrinhoStore;

  _CarrinhoTotalControllerBase(this._carrinhoStore);

  @computed
  double get total => _carrinhoStore.total;
}
