// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroController = BindInject(
  (i) => CadastroController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroController on _CadastroControllerBase, Store {
  final _$tituloAtom = Atom(name: '_CadastroControllerBase.titulo');

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  final _$conteudoAtom = Atom(name: '_CadastroControllerBase.conteudo');

  @override
  String get conteudo {
    _$conteudoAtom.reportRead();
    return super.conteudo;
  }

  @override
  set conteudo(String value) {
    _$conteudoAtom.reportWrite(value, super.conteudo, () {
      super.conteudo = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CadastroControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$erroAtom = Atom(name: '_CadastroControllerBase.erro');

  @override
  bool get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(bool value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$cadastraComEmailAsyncAction =
      AsyncAction('_CadastroControllerBase.cadastraComEmail');

  @override
  Future<dynamic> cadastraComEmail() {
    return _$cadastraComEmailAsyncAction.run(() => super.cadastraComEmail());
  }

  final _$_CadastroControllerBaseActionController =
      ActionController(name: '_CadastroControllerBase');

  @override
  String validaNome(dynamic valor) {
    final _$actionInfo = _$_CadastroControllerBaseActionController.startAction(
        name: '_CadastroControllerBase.validaNome');
    try {
      return super.validaNome(valor);
    } finally {
      _$_CadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaEmail(dynamic valor) {
    final _$actionInfo = _$_CadastroControllerBaseActionController.startAction(
        name: '_CadastroControllerBase.validaEmail');
    try {
      return super.validaEmail(valor);
    } finally {
      _$_CadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaSenha(dynamic valor) {
    final _$actionInfo = _$_CadastroControllerBaseActionController.startAction(
        name: '_CadastroControllerBase.validaSenha');
    try {
      return super.validaSenha(valor);
    } finally {
      _$_CadastroControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titulo: ${titulo},
conteudo: ${conteudo},
loading: ${loading},
erro: ${erro}
    ''';
  }
}
