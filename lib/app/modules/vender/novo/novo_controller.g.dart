// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novo_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $NovoController = BindInject(
  (i) => NovoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NovoController on _NovoControllerBase, Store {
  final _$itemSelecionadoAtom =
      Atom(name: '_NovoControllerBase.itemSelecionado');

  @override
  String get itemSelecionado {
    _$itemSelecionadoAtom.reportRead();
    return super.itemSelecionado;
  }

  @override
  set itemSelecionado(String value) {
    _$itemSelecionadoAtom.reportWrite(value, super.itemSelecionado, () {
      super.itemSelecionado = value;
    });
  }

  final _$insereProdutoAsyncAction =
      AsyncAction('_NovoControllerBase.insereProduto');

  @override
  Future<dynamic> insereProduto() {
    return _$insereProdutoAsyncAction.run(() => super.insereProduto());
  }

  final _$_NovoControllerBaseActionController =
      ActionController(name: '_NovoControllerBase');

  @override
  dynamic atualizaItemSelecionado(String valor) {
    final _$actionInfo = _$_NovoControllerBaseActionController.startAction(
        name: '_NovoControllerBase.atualizaItemSelecionado');
    try {
      return super.atualizaItemSelecionado(valor);
    } finally {
      _$_NovoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaTitulo(dynamic valor) {
    final _$actionInfo = _$_NovoControllerBaseActionController.startAction(
        name: '_NovoControllerBase.validaTitulo');
    try {
      return super.validaTitulo(valor);
    } finally {
      _$_NovoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaDescricao(dynamic valor) {
    final _$actionInfo = _$_NovoControllerBaseActionController.startAction(
        name: '_NovoControllerBase.validaDescricao');
    try {
      return super.validaDescricao(valor);
    } finally {
      _$_NovoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaQuantidade(dynamic valor) {
    final _$actionInfo = _$_NovoControllerBaseActionController.startAction(
        name: '_NovoControllerBase.validaQuantidade');
    try {
      return super.validaQuantidade(valor);
    } finally {
      _$_NovoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaPrecoUnitario(dynamic valor) {
    final _$actionInfo = _$_NovoControllerBaseActionController.startAction(
        name: '_NovoControllerBase.validaPrecoUnitario');
    try {
      return super.validaPrecoUnitario(valor);
    } finally {
      _$_NovoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaDesconto(dynamic valor) {
    final _$actionInfo = _$_NovoControllerBaseActionController.startAction(
        name: '_NovoControllerBase.validaDesconto');
    try {
      return super.validaDesconto(valor);
    } finally {
      _$_NovoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaCategoria(dynamic valor) {
    final _$actionInfo = _$_NovoControllerBaseActionController.startAction(
        name: '_NovoControllerBase.validaCategoria');
    try {
      return super.validaCategoria(valor);
    } finally {
      _$_NovoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemSelecionado: ${itemSelecionado}
    ''';
  }
}
