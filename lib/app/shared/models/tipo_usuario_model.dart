class TipoUsuarioModel {
  final int id;
  final String tipo;

  TipoUsuarioModel({this.id, this.tipo});

  factory TipoUsuarioModel.fromJson(dynamic json) {
    return TipoUsuarioModel(id: json['id'], tipo: json['tipo']);
  }
}
