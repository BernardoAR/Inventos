import 'package:inventos/app/shared/models/usuario_model.dart';

class ProdutoModel {
  final int id;
  final bool ativo;
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

  static fromJson(val) {}
}
