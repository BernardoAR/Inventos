import 'package:inventos/app/shared/models/usuario_model.dart';

class ProdutoModel {
  final int id;
  final int ativo;
  final String titulo;
  final String url;
  final String descricao;
  final double precoUnitario;
  final int quantidade;
  final UsuarioModel usuario;

  ProdutoModel(
      {this.id,
      this.ativo,
      this.titulo,
      this.url,
      this.descricao,
      this.precoUnitario,
      this.quantidade,
      this.usuario});
  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
        id: int.parse(json['id']),
        ativo: int.parse(json['ativo']),
        descricao: json['descricao'],
        precoUnitario: double.parse(json['precoUnitario']),
        quantidade: int.parse(json['quantidade']),
        titulo: json['titulo'],
        url: json['url'],
        usuario: UsuarioModel.fromJson(json['usuario']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['ativo'] = this.ativo;
    data['titulo'] = this.titulo;
    data['url'] = this.url;
    data['descricao'] = this.descricao;
    data['precoUnitario'] = this.precoUnitario;
    data['quantidade'] = this.quantidade;
    data['usuario'] = this.usuario.uid;
    return data;
  }
}
