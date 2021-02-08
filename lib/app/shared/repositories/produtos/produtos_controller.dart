import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/repositories/produtos/produtos_repository.dart';
import 'package:mobx/mobx.dart';
part 'produtos_controller.g.dart';

class ProdutosController = _ProdutosControllerBase with _$ProdutosController;

abstract class _ProdutosControllerBase with Store {
  final ProdutosRepository _produtosRepository = Modular.get();

  @action
  Future getListaProdutos() async {
    return await _produtosRepository.getPost();
  }

  @action
  Future getListaProdutosWhere(String nome) async {
    return await _produtosRepository.getPost(nome: nome);
  }

  @action
  Future getListaProdutosUsuario(String uid) async {
    return await _produtosRepository.getPostUsuario(uid: uid);
  }

  @action
  Future inserirProduto(dynamic produto, dynamic categoria) async {
    return await _produtosRepository.insertProduto(
        produto: produto, categoria: categoria);
  }
}
