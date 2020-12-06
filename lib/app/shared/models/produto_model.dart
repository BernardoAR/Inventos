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

  factory ProdutoModel.fromJson(dynamic json) {
    return ProdutoModel(
        ativo: int.parse(json['ativo']),
        descricao: json['descricao'],
        id: int.parse(json['id']),
        precoUnitario: double.parse(json['precoUnitario']),
        quantidade: int.parse(json['quantidade']),
        titulo: json['titulo'] as String,
        url: json['url'] as String,
        usuario: UsuarioModel.fromJson(json['usuario']));
  }
}
