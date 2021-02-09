import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/custom_dio/custom_dio.dart';
import 'package:inventos/app/shared/models/endereco_model.dart';

part 'endereco_repository.g.dart';

@Injectable()
class EnderecoRepository extends Disposable {
  final CustomDio dio;

  EnderecoRepository(this.dio);

  /// Método utilizado para pegar o endereço
  Future getPost({uid}) async {
    try {
      final response = await dio.client
          .post('/endereco/pegaEnderecoUsuario', data: {'uid': uid});
      return jsonDecode(response.data)
          .map((item) => EnderecoModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      print(e);
    }
  }

  /// Método utilizado para inserir ou atualizar
  Future insertAtualizaEndereco({endereco}) async {
    try {
      var response = await dio.client.post('/endereco/insereAtualizaEndereco',
          data: {'endereco': endereco});
      print(response.data);
    } on DioError catch (e) {
      print(e);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
