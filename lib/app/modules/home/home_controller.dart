import 'package:inventos/app/shared/produto_lista/produto_lista_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ProdutoListaController produto = Modular.get();
  @observable
  List produtos;
  @action
  Future listarProdutos() async {
    produtos = await produto.getListaProdutos();
  }
}
