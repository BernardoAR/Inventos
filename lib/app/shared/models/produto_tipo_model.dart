class ProdutoTipoModel {
  final int id;
  final String titulo;

  ProdutoTipoModel({this.id, this.titulo});

  factory ProdutoTipoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoTipoModel(id: json['id'], titulo: json['titulo']);
  }
}
