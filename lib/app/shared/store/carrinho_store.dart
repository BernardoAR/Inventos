import 'package:inventos/app/shared/models/carrinho_model.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:mobx/mobx.dart';
part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStoreBase with _$CarrinhoStore;

abstract class _CarrinhoStoreBase with Store {
  var produtosNoCarrinho = ObservableList<CarrinhoModel>();
  void adicionarProdutoCarrinho(ProdutoModel produtoModel) {
    print(produtoModel.toJson());
    // Verifica se tem um índice na lista em relação ao produto, para adicionar mais uma quantidade caso exista
    var index = produtosNoCarrinho.indexWhere(
        (carrinhoModel) => carrinhoModel.produto.id == produtoModel.id);
    // Se possuir, busca o elemento e adiciona
    if (index >= 0) {
      produtosNoCarrinho.elementAt(index).adicionar();
      // Caso não exista, adiciona o produto no carrinho
    } else {
      produtosNoCarrinho.add(CarrinhoModel(produto: produtoModel));
    }
  }

  void removerProdutosNoCarrinho(ProdutoModel produtoModel) {
    // Verifica se tem um índice na lista em relação ao produto, para adicionar mais uma quantidade caso exista
    var index = produtosNoCarrinho.indexWhere(
        (carrinhoModel) => carrinhoModel.produto.id == produtoModel.id);
    // Se possuir, busca o elemento e deleta
    produtosNoCarrinho.removeAt(index);
  }

  @computed
  double get total {
    if (produtosNoCarrinho.isEmpty) {
      return 0.00;
    } else {
      return produtosNoCarrinho
          .map((item) => item.produto.precoUnitario * item.quantidade)
          .reduce((value, element) => value + element);
    }
  }
}
