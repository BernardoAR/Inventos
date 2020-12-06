import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/models/usuario_model.dart';
import 'package:mobx/mobx.dart';
part 'carrinho_model.g.dart';

class CarrinhoModel = _CarrinhoModelBase with _$CarrinhoModel;

abstract class _CarrinhoModelBase with Store {
  final UsuarioModel usuario;
  final ProdutoModel produto;
  @observable
  int _quantidade = 1;

  _CarrinhoModelBase({this.usuario, this.produto});

  @computed
  int get quantidade => _quantidade;

  @action
  void adicionar() {
    _quantidade++;
  }

  @action
  void remover() {
    _quantidade--;
  }
}
