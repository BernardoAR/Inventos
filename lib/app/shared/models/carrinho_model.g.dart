// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoModel on _CarrinhoModelBase, Store {
  Computed<int> _$quantidadesComputed;

  @override
  int get quantidades =>
      (_$quantidadesComputed ??= Computed<int>(() => super.quantidades,
              name: '_CarrinhoModelBase.quantidades'))
          .value;

  final _$quantidadeAtom = Atom(name: '_CarrinhoModelBase.quantidade');

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  final _$_CarrinhoModelBaseActionController =
      ActionController(name: '_CarrinhoModelBase');

  @override
  void adicionar() {
    final _$actionInfo = _$_CarrinhoModelBaseActionController.startAction(
        name: '_CarrinhoModelBase.adicionar');
    try {
      return super.adicionar();
    } finally {
      _$_CarrinhoModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remover() {
    final _$actionInfo = _$_CarrinhoModelBaseActionController.startAction(
        name: '_CarrinhoModelBase.remover');
    try {
      return super.remover();
    } finally {
      _$_CarrinhoModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantidade: ${quantidade},
quantidades: ${quantidades}
    ''';
  }
}
