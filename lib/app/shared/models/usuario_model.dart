import 'package:inventos/app/shared/models/tipo_usuario_model.dart';

class UsuarioModel {
  final String uid;
  final String nome;
  final TipoUsuarioModel tipoUsuario;

  UsuarioModel({this.uid, this.nome, this.tipoUsuario});

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
        uid: json['uid'],
        nome: json['nome'],
        tipoUsuario: TipoUsuarioModel.fromJson(json['tipoUsuario']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uid'] = this.uid;
    data['nome'] = this.nome;
    data['tipoUsuario'] = this.tipoUsuario.id;
    return data;
  }
}
