// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vender_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $VenderController = BindInject(
  (i) => VenderController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VenderController on _VenderControllerBase, Store {
  final _$produtosAtom = Atom(name: '_VenderControllerBase.produtos');

  @override
  List<dynamic> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(List<dynamic> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  final _$listarProdutosAsyncAction =
      AsyncAction('_VenderControllerBase.listarProdutos');

  @override
  Future<dynamic> listarProdutos() {
    return _$listarProdutosAsyncAction.run(() => super.listarProdutos());
  }

  @override
  String toString() {
    return '''
produtos: ${produtos}
    ''';
  }
}
