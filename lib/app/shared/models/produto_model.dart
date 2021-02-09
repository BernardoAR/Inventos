import 'package:inventos/app/shared/models/usuario_model.dart';
import 'package:inventos/app/shared/models/produto_tipo_model.dart';

class ProdutoModel {
  final int id;
  final int ativo;
  final String titulo;
  final String url;
  final String descricao;
  final double precoUnitario;
  final double desconto;
  final int quantidade;
  final UsuarioModel usuario;
  final ProdutoTipoModel tipoProduto;

  ProdutoModel(
      {this.id,
      this.ativo,
      this.titulo,
      this.url,
      this.descricao,
      this.precoUnitario,
      this.desconto,
      this.quantidade,
      this.usuario,
      this.tipoProduto});
  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
        id: int.parse(json['id'].toString()),
        ativo: int.parse(json['ativo'].toString()),
        descricao: json['descricao'],
        precoUnitario: double.parse(json['precoUnitario'].toString()),
        desconto: double.parse(json['desconto'].toString()),
        quantidade: int.parse(json['quantidade'].toString()),
        titulo: json['titulo'],
        url: json['url'],
        usuario: UsuarioModel.fromJson(json['usuario']),
        tipoProduto: ProdutoTipoModel.fromJson(json['produtoTipo']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['ativo'] = this.ativo;
    data['titulo'] = this.titulo;
    data['url'] = this.url;
    data['descricao'] = this.descricao;
    data['precoUnitario'] = this.precoUnitario;
    data['desconto'] = this.desconto;
    data['quantidade'] = this.quantidade;
    data['usuario'] = this.usuario.uid;
    data['tipoProduto'] = this.tipoProduto.id;
    return data;
  }
}
