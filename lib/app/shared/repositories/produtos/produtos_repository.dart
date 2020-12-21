import 'dart:convert';

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
  Future getPost() async {
    final response = await dio.client.get('/produto/pegaprodutos');
    return jsonDecode(response.data)
        .map((item) => ProdutoModel.fromJson(item))
        .toList();
  }

  @override
  Future updatePost() {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
