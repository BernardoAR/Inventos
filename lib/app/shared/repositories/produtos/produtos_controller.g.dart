// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProdutosController on _ProdutosControllerBase, Store {
  final _$produtoAtom = Atom(name: '_ProdutosControllerBase.produto');

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
      AsyncAction('_ProdutosControllerBase.getListaProdutos');

  @override
  Future<dynamic> getListaProdutos() {
    return _$getListaProdutosAsyncAction.run(() => super.getListaProdutos());
  }

  final _$getListaProdutosWhereAsyncAction =
      AsyncAction('_ProdutosControllerBase.getListaProdutosWhere');

  @override
  Future<dynamic> getListaProdutosWhere(String nome) {
    return _$getListaProdutosWhereAsyncAction
        .run(() => super.getListaProdutosWhere(nome));
  }

  final _$_ProdutosControllerBaseActionController =
      ActionController(name: '_ProdutosControllerBase');

  @override
  dynamic setProdutos(dynamic value) {
    final _$actionInfo = _$_ProdutosControllerBaseActionController.startAction(
        name: '_ProdutosControllerBase.setProdutos');
    try {
      return super.setProdutos(value);
    } finally {
      _$_ProdutosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
produto: ${produto}
    ''';
  }
}
