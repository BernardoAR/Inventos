// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuarios_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $UsuariosStore = BindInject(
  (i) => UsuariosStore(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsuariosStore on _UsuariosStoreBase, Store {
  final _$_usuarioAtom = Atom(name: '_UsuariosStoreBase._usuario');

  @override
  UsuarioModel get _usuario {
    _$_usuarioAtom.reportRead();
    return super._usuario;
  }

  @override
  set _usuario(UsuarioModel value) {
    _$_usuarioAtom.reportWrite(value, super._usuario, () {
      super._usuario = value;
    });
  }

  final _$_UsuariosStoreBaseActionController =
      ActionController(name: '_UsuariosStoreBase');

  @override
  dynamic setUsuario(dynamic value) {
    final _$actionInfo = _$_UsuariosStoreBaseActionController.startAction(
        name: '_UsuariosStoreBase.setUsuario');
    try {
      return super.setUsuario(value);
    } finally {
      _$_UsuariosStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
