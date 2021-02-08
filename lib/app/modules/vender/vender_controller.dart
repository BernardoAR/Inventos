import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/repositories/produtos/produtos_controller.dart';
import 'package:inventos/app/shared/store/usuarios_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'vender_controller.g.dart';

@Injectable()
class VenderController = _VenderControllerBase with _$VenderController;

abstract class _VenderControllerBase with Store {
  ProdutosController produto = Modular.get();
  final UsuariosStore _usuariosStore = Modular.get();
  @observable
  List produtos;
  @action
  Future listarProdutos() async {
    produtos = await produto.getListaProdutosUsuario(_usuariosStore.uid);
  }
}
