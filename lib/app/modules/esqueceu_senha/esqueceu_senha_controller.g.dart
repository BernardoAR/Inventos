// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esqueceu_senha_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EsqueceuSenhaController = BindInject(
  (i) => EsqueceuSenhaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EsqueceuSenhaController on _EsqueceuSenhaControllerBase, Store {
  final _$tituloAtom = Atom(name: '_EsqueceuSenhaControllerBase.titulo');

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

  final _$conteudoAtom = Atom(name: '_EsqueceuSenhaControllerBase.conteudo');

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

  final _$loadingAtom = Atom(name: '_EsqueceuSenhaControllerBase.loading');

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

  final _$erroAtom = Atom(name: '_EsqueceuSenhaControllerBase.erro');

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

  final _$enviaPedidoRecuperacaoAsyncAction =
      AsyncAction('_EsqueceuSenhaControllerBase.enviaPedidoRecuperacao');

  @override
  Future<dynamic> enviaPedidoRecuperacao() {
    return _$enviaPedidoRecuperacaoAsyncAction
        .run(() => super.enviaPedidoRecuperacao());
  }

  final _$_EsqueceuSenhaControllerBaseActionController =
      ActionController(name: '_EsqueceuSenhaControllerBase');

  @override
  String validaEmail(dynamic valor) {
    final _$actionInfo = _$_EsqueceuSenhaControllerBaseActionController
        .startAction(name: '_EsqueceuSenhaControllerBase.validaEmail');
    try {
      return super.validaEmail(valor);
    } finally {
      _$_EsqueceuSenhaControllerBaseActionController.endAction(_$actionInfo);
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
