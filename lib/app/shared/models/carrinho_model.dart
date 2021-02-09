import 'dart:convert';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/models/usuario_model.dart';
import 'package:mobx/mobx.dart';
part 'carrinho_model.g.dart';

class CarrinhoModel = _CarrinhoModelBase with _$CarrinhoModel;

abstract class _CarrinhoModelBase with Store {
  final UsuarioModel usuario;
  final ProdutoModel produto;
  @observable
  int quantidade = 1;

  _CarrinhoModelBase({this.usuario, this.produto, this.quantidade}) {
    if (this.quantidade == null) {
      this.quantidade = 1;
    }
  }

  fromJson(Map<String, dynamic> json) {
    return CarrinhoModel(
        quantidade: int.parse(json['quantidade']),
        usuario: UsuarioModel.fromJson(json['usuario']),
        produto: ProdutoModel.fromJson(json['produto']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['quantidade'] = this.quantidade;
    data['usuario'] = this.usuario.uid;
    data['produto'] = this.produto.id;
    return data;
  }

  @computed
  int get quantidades => quantidade;

  @action
  void adicionar() {
    if (quantidade != produto.quantidade) {
      quantidade++;
    }
  }

  @action
  void remover() {
    if (quantidade != 1) {
      quantidade--;
    }
  }
}
