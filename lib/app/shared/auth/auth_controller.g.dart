// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  Computed<dynamic> _$userProfileComputed;

  @override
  dynamic get userProfile =>
      (_$userProfileComputed ??= Computed<dynamic>(() => super.userProfile,
              name: '_AuthControllerBase.userProfile'))
          .value;

  final _$statusAtom = Atom(name: '_AuthControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$userAtom = Atom(name: '_AuthControllerBase.user');

  @override
  dynamic get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(dynamic value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$cadastraComEmailAsyncAction =
      AsyncAction('_AuthControllerBase.cadastraComEmail');

  @override
  Future<dynamic> cadastraComEmail(
      {dynamic email, dynamic senha, dynamic nome}) {
    return _$cadastraComEmailAsyncAction.run(
        () => super.cadastraComEmail(email: email, senha: senha, nome: nome));
  }

  final _$resetaSenhaAsyncAction =
      AsyncAction('_AuthControllerBase.resetaSenha');

  @override
  Future<dynamic> resetaSenha({dynamic email}) {
    return _$resetaSenhaAsyncAction.run(() => super.resetaSenha(email: email));
  }

  final _$loginWithEmailAsyncAction =
      AsyncAction('_AuthControllerBase.loginWithEmail');

  @override
  Future<dynamic> loginWithEmail({dynamic email, dynamic senha}) {
    return _$loginWithEmailAsyncAction
        .run(() => super.loginWithEmail(email: email, senha: senha));
  }

  final _$estaLogadoGoogleAsyncAction =
      AsyncAction('_AuthControllerBase.estaLogadoGoogle');

  @override
  Future<dynamic> estaLogadoGoogle() {
    return _$estaLogadoGoogleAsyncAction.run(() => super.estaLogadoGoogle());
  }

  final _$loginWithGoogleAsyncAction =
      AsyncAction('_AuthControllerBase.loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$atualizaPerfilAsyncAction =
      AsyncAction('_AuthControllerBase.atualizaPerfil');

  @override
  Future<dynamic> atualizaPerfil(
      {dynamic url,
      dynamic nome,
      dynamic email,
      dynamic senha,
      dynamic novaSenha}) {
    return _$atualizaPerfilAsyncAction.run(() => super.atualizaPerfil(
        url: url,
        nome: nome,
        email: email,
        senha: senha,
        novaSenha: novaSenha));
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  dynamic setUser(dynamic value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> logOut() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.logOut');
    try {
      return super.logOut();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
user: ${user},
userProfile: ${userProfile}
    ''';
  }
}
