import 'package:inventos/app/shared/repositories/produtos/produtos_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  ProdutosController produto = Modular.get();
  @observable
  List produtos;

  @action
  Future listarProdutos() async {
    produtos = await produto.getListaProdutos();
  }

  @action
  Future listarProdutosWhere(nome) async {
    produtos = await produto.getListaProdutosWhere(nome);
  }
}
