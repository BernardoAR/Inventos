// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  Computed<dynamic> _$getUserProfileComputed;

  @override
  dynamic get getUserProfile => (_$getUserProfileComputed ??= Computed<dynamic>(
          () => super.getUserProfile,
          name: '_AuthControllerBase.getUserProfile'))
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

  final _$loginWithGoogleAsyncAction =
      AsyncAction('_AuthControllerBase.loginWithGoogle');

  @override
  Future<dynamic> loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
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
getUserProfile: ${getUserProfile}
    ''';
  }
}
