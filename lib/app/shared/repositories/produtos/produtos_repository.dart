import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/custom_dio/custom_dio.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/repositories/repository_interface.dart';
part 'produtos_repository.g.dart';

@Injectable()
class ProdutosRepository extends Disposable implements IRepository {
  final CustomDio dio;

  ProdutosRepository(this.dio);

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future createPost() {
    throw UnimplementedError();
  }

  @override
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
