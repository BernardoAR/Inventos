// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detalhes_produto_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DetalhesProdutoController = BindInject(
  (i) => DetalhesProdutoController(i<CarrinhoStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetalhesProdutoController on _DetalhesProdutoControllerBase, Store {
  final _$_DetalhesProdutoControllerBaseActionController =
      ActionController(name: '_DetalhesProdutoControllerBase');

  @override
  void adicionaProdutoNoCarrinho(ProdutoModel produtoModel) {
    final _$actionInfo =
        _$_DetalhesProdutoControllerBaseActionController.startAction(
            name: '_DetalhesProdutoControllerBase.adicionaProdutoNoCarrinho');
    try {
      return super.adicionaProdutoNoCarrinho(produtoModel);
    } finally {
      _$_DetalhesProdutoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
