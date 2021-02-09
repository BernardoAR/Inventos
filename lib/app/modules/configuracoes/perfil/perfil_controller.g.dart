// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PerfilController = BindInject(
  (i) => PerfilController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PerfilController on _PerfilControllerBase, Store {
  final _$logadoGoogleAtom = Atom(name: '_PerfilControllerBase.logadoGoogle');

  @override
  bool get logadoGoogle {
    _$logadoGoogleAtom.reportRead();
    return super.logadoGoogle;
  }

  @override
  set logadoGoogle(bool value) {
    _$logadoGoogleAtom.reportWrite(value, super.logadoGoogle, () {
      super.logadoGoogle = value;
    });
  }

  final _$atualizaDadosAsyncAction =
      AsyncAction('_PerfilControllerBase.atualizaDados');

  @override
  Future<dynamic> atualizaDados() {
    return _$atualizaDadosAsyncAction.run(() => super.atualizaDados());
  }

  final _$atualizaLogadoGoogleAsyncAction =
      AsyncAction('_PerfilControllerBase.atualizaLogadoGoogle');

  @override
  Future<dynamic> atualizaLogadoGoogle() {
    return _$atualizaLogadoGoogleAsyncAction
        .run(() => super.atualizaLogadoGoogle());
  }

  final _$_PerfilControllerBaseActionController =
      ActionController(name: '_PerfilControllerBase');

  @override
  String validaNome(dynamic valor) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.validaNome');
    try {
      return super.validaNome(valor);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaEmail(dynamic valor) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.validaEmail');
    try {
      return super.validaEmail(valor);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String validaSenha(dynamic valor) {
    final _$actionInfo = _$_PerfilControllerBaseActionController.startAction(
        name: '_PerfilControllerBase.validaSenha');
    try {
      return super.validaSenha(valor);
    } finally {
      _$_PerfilControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
logadoGoogle: ${logadoGoogle}
    ''';
  }
}
