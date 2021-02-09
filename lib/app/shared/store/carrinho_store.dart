import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/models/carrinho_model.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/repositories/carrinho/carrinho_repository.dart';
import 'package:inventos/app/shared/store/usuarios_store.dart';
import 'package:mobx/mobx.dart';
part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStoreBase with _$CarrinhoStore;

abstract class _CarrinhoStoreBase with Store {
  var produtosNoCarrinho = ObservableList<CarrinhoModel>();
  final UsuariosStore _usuarioStore = Modular.get();
  final CarrinhoRepository _carrinhoRepository = Modular.get();
  _CarrinhoStoreBase() {
    colocaProdutos();
  }
  Future colocaProdutos() async {
    var carrinhos = await _carrinhoRepository.getPost();
    for (var i = 0; i < carrinhos.length; i++) {
      produtosNoCarrinho.add(carrinhos[i]);
    }
  }

  void adicionarProdutoCarrinho(ProdutoModel produtoModel) {
    // Verifica se tem um índice na lista em relação ao produto, para adicionar mais uma quantidade caso exista
    var index = produtosNoCarrinho.indexWhere(
        (carrinhoModel) => carrinhoModel.produto.id == produtoModel.id);
    // Se possuir, busca o elemento e adiciona
    if (index >= 0) {
      produtosNoCarrinho.elementAt(index).adicionar();
      // Caso não exista, adiciona o produto no carrinho
    } else {
      produtosNoCarrinho.add(
          CarrinhoModel(produto: produtoModel, usuario: _usuarioStore.usuario));
    }
  }

  // Atualiza\ todos os produtos do carrinho
  atualizaProdutoCarrinho() {
    for (var i = 0; i < produtosNoCarrinho.length; i++) {
      _carrinhoRepository.atualiza(produtosNoCarrinho.elementAt(i));
    }
  }

  removeProdutoCarrinho(CarrinhoModel carrinhoModel) {
    _carrinhoRepository.remove(carrinhoModel);
  }

  void removerProdutosNoCarrinho(ProdutoModel produtoModel) {
    // Verifica se tem um índice na lista em relação ao produto, para adicionar mais uma quantidade caso exista
    var index = produtosNoCarrinho.indexWhere(
        (carrinhoModel) => carrinhoModel.produto.id == produtoModel.id);
    // Remove o produto
    removeProdutoCarrinho(produtosNoCarrinho.elementAt(index));
    // Se possuir, busca o elemento e deleta
    produtosNoCarrinho.removeAt(index);
  }

  @computed
  double get total {
    if (produtosNoCarrinho.isEmpty) {
      return 0.00;
    } else {
      return produtosNoCarrinho
          .map((item) => item.produto.precoUnitario * item.quantidades)
          .reduce((value, element) => value + element);
    }
  }
}
