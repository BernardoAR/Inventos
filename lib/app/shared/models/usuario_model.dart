import 'package:inventos/app/shared/models/tipo_usuario_model.dart';

class UsuarioModel {
  final String uid;
  final String nome;
  final TipoUsuarioModel tipoUsuario;

  UsuarioModel({this.uid, this.nome, this.tipoUsuario});
}
