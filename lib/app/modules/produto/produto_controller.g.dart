// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProdutoController = BindInject(
  (i) => ProdutoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoController on _ProdutoControllerBase, Store {
  final _$produtosAtom = Atom(name: '_ProdutoControllerBase.produtos');

  @override
  List<dynamic> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(List<dynamic> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  final _$listarProdutosAsyncAction =
      AsyncAction('_ProdutoControllerBase.listarProdutos');

  @override
  Future<dynamic> listarProdutos() {
    return _$listarProdutosAsyncAction.run(() => super.listarProdutos());
  }

  @override
  String toString() {
    return '''
produtos: ${produtos}
    ''';
  }
}
