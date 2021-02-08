import 'package:inventos/app/shared/repositories/produtos/produtos_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'produto_controller.g.dart';

@Injectable()
class ProdutoController = _ProdutoControllerBase with _$ProdutoController;

abstract class _ProdutoControllerBase with Store {
  ProdutosController produto = Modular.get();
  @observable
  List produtos;
  @action
  Future listarProdutos() async {
    produtos = await produto.getListaProdutos();
  }

  @action
  Future listarMeusProdutos(uid) async {
    produtos = await produto.getListaProdutosWhere(uid);
  }
}
