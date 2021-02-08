import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:inventos/app/shared/custom_dio/custom_dio.dart';
import 'package:inventos/app/shared/models/carrinho_model.dart';
part 'carrinho_repository.g.dart';

@Injectable()
class CarrinhoRepository extends Disposable {
  final CustomDio dio;
  AuthController auth = Modular.get();
  get usuario => auth.userProfile.user.uid;
  CarrinhoRepository(this.dio);

  //dispose will be called automatically
  @override
  void dispose() {}

  /// Método utilizado para pegar os produtos no carrinho
  Future getPost() async {
    try {
      final response = await dio.client
          .post('/carrinho/pegaProdutosCarrinho', data: {'usuario': usuario});
      return jsonDecode(response.data)
          .map((item) => CarrinhoModel().fromJson(item))
          .toList();
    } on DioError catch (e) {
      print(e);
    }
  }

  // Método utilizado para atualizar os produtos no carrinho
  Future atualiza(CarrinhoModel carrinhoModel) async {
    try {
      var response = await dio.client.post('/carrinho/atualizaProdutosCarrinho',
          data: {'carrinho': carrinhoModel.toJson(), 'usuario': usuario});
      return response.statusCode;
    } on DioError catch (e) {
      print(e);
    }
  }

  // Método utilizado para atualizar os produtos no carrinho
  Future remove(CarrinhoModel carrinhoModel) async {
    try {
      await dio.client.post('/carrinho/removeProdutosCarrinho',
          data: {'carrinho': carrinhoModel.toJson()});
    } on DioError catch (e) {
      print(e);
    }
  }
}
