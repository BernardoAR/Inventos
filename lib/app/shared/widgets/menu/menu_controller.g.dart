// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MenuController = BindInject(
  (i) => MenuController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuController on _MenuControllerBase, Store {
  Computed<dynamic> _$usuarioComputed;

  @override
  dynamic get usuario =>
      (_$usuarioComputed ??= Computed<dynamic>(() => super.usuario,
              name: '_MenuControllerBase.usuario'))
          .value;

  final _$_MenuControllerBaseActionController =
      ActionController(name: '_MenuControllerBase');

  @override
  dynamic deslogar() {
    final _$actionInfo = _$_MenuControllerBaseActionController.startAction(
        name: '_MenuControllerBase.deslogar');
    try {
      return super.deslogar();
    } finally {
      _$_MenuControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario}
    ''';
  }
}
