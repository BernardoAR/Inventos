import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/custom_dio/custom_dio.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
part 'produtos_repository.g.dart';

@Injectable()
class ProdutosRepository extends Disposable {
  final CustomDio dio;

  ProdutosRepository(this.dio);

  //dispose will be called automatically
  @override
  void dispose() {}

  /// Método utilizado para pegar os produtos
  Future getPost({nome}) async {
    try {
      final response =
          await dio.client.post('/produto/pegaProdutos', data: {'nome': nome});
      return jsonDecode(response.data)
          .map((item) => ProdutoModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      print(e);
    }
  }

  /// Método utilizado para pegar os produtos por usuario
  Future getPostUsuario({uid}) async {
    try {
      final response = await dio.client
          .post('/produto/pegaProdutosUsuario', data: {'uid': uid});
      return jsonDecode(response.data)
          .map((item) => ProdutoModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      print(e);
    }
  }

  Future insertProduto({produto, categoria}) async {
    try {
      var response = await dio.client.post(
          '/produto/insereAtualizaProdutoUsuario',
          data: {'produto': produto, 'categoria': categoria});
      print(response.data);
    } on DioError catch (e) {
      print(e);
    }
  }
}
