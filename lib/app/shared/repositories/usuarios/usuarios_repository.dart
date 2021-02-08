import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/custom_dio/custom_dio.dart';
import 'package:inventos/app/shared/models/usuario_model.dart';

part 'usuarios_repository.g.dart';

@Injectable()
class UsuariosRepository extends Disposable {
  final CustomDio dio;

  UsuariosRepository(this.dio);
  Future insereAtualizaUsuario(UsuarioModel usuario) async {
    try {
      var response = await dio.client
          .post('/usuario/insereAtualizaUsuario', data: usuario.toJson());
      return response.statusCode;
    } on DioError catch (e) {
      print(e.message);
    }
  }

  Future pegaDadosUsuarioUid(String uid) async {
    try {
      final response =
          await dio.client.post('/usuario/pegaUsuarioUid', data: {'uid': uid});
      return jsonDecode(response.data)
          .map((item) => UsuarioModel.fromJson(item))
          .toList()[0];
    } on DioError catch (e) {
      print(e.message);
    }
  }

  @override
  void dispose() {}
}
