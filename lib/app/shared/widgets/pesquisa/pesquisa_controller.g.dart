// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pesquisa_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PesquisaController on _PesquisaControllerBase, Store {
  Computed<bool> _$estaPesquisandoComputed;

  @override
  bool get estaPesquisando =>
      (_$estaPesquisandoComputed ??= Computed<bool>(() => super.estaPesquisando,
              name: '_PesquisaControllerBase.estaPesquisando'))
          .value;
  Computed<String> _$getPesquisaComputed;

  @override
  String get getPesquisa =>
      (_$getPesquisaComputed ??= Computed<String>(() => super.getPesquisa,
              name: '_PesquisaControllerBase.getPesquisa'))
          .value;

  final _$_estaPesquisandoAtom =
      Atom(name: '_PesquisaControllerBase._estaPesquisando');

  @override
  bool get _estaPesquisando {
    _$_estaPesquisandoAtom.reportRead();
    return super._estaPesquisando;
  }

  @override
  set _estaPesquisando(bool value) {
    _$_estaPesquisandoAtom.reportWrite(value, super._estaPesquisando, () {
      super._estaPesquisando = value;
    });
  }

  final _$_pesquisaAtom = Atom(name: '_PesquisaControllerBase._pesquisa');

  @override
  String get _pesquisa {
    _$_pesquisaAtom.reportRead();
    return super._pesquisa;
  }

  @override
  set _pesquisa(String value) {
    _$_pesquisaAtom.reportWrite(value, super._pesquisa, () {
      super._pesquisa = value;
    });
  }

  final _$_PesquisaControllerBaseActionController =
      ActionController(name: '_PesquisaControllerBase');

  @override
  void _pararPesquisa() {
    final _$actionInfo = _$_PesquisaControllerBaseActionController.startAction(
        name: '_PesquisaControllerBase._pararPesquisa');
    try {
      return super._pararPesquisa();
    } finally {
      _$_PesquisaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void limparPesquisa() {
    final _$actionInfo = _$_PesquisaControllerBaseActionController.startAction(
        name: '_PesquisaControllerBase.limparPesquisa');
    try {
      return super.limparPesquisa();
    } finally {
      _$_PesquisaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void atualizaPesquisa(String novaPesquisa) {
    final _$actionInfo = _$_PesquisaControllerBaseActionController.startAction(
        name: '_PesquisaControllerBase.atualizaPesquisa');
    try {
      return super.atualizaPesquisa(novaPesquisa);
    } finally {
      _$_PesquisaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void iniciaPesquisa(dynamic context) {
    final _$actionInfo = _$_PesquisaControllerBaseActionController.startAction(
        name: '_PesquisaControllerBase.iniciaPesquisa');
    try {
      return super.iniciaPesquisa(context);
    } finally {
      _$_PesquisaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estaPesquisando: ${estaPesquisando},
getPesquisa: ${getPesquisa}
    ''';
  }
}
