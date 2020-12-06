// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_lista_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutoListaController on _ProdutoListaControllerBase, Store {
  final _$produtoAtom = Atom(name: '_ProdutoListaControllerBase.produto');

  @override
  List<ProdutoModel> get produto {
    _$produtoAtom.reportRead();
    return super.produto;
  }

  @override
  set produto(List<ProdutoModel> value) {
    _$produtoAtom.reportWrite(value, super.produto, () {
      super.produto = value;
    });
  }

  final _$getListaProdutosAsyncAction =
      AsyncAction('_ProdutoListaControllerBase.getListaProdutos');

  @override
  Future<dynamic> getListaProdutos() {
    return _$getListaProdutosAsyncAction.run(() => super.getListaProdutos());
  }

  final _$_ProdutoListaControllerBaseActionController =
      ActionController(name: '_ProdutoListaControllerBase');

  @override
  dynamic setProdutos(dynamic value) {
    final _$actionInfo = _$_ProdutoListaControllerBaseActionController
        .startAction(name: '_ProdutoListaControllerBase.setProdutos');
    try {
      return super.setProdutos(value);
    } finally {
      _$_ProdutoListaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produto: ${produto}
    ''';
  }
}
