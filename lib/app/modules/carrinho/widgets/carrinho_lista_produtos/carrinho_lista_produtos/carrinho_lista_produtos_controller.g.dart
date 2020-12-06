// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_lista_produtos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CarrinhoListaProdutosController = BindInject(
  (i) => CarrinhoListaProdutosController(i<CarrinhoStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoListaProdutosController
    on _CarrinhoListaProdutosControllerBase, Store {
  Computed<ObservableList<CarrinhoModel>> _$listaProdutosComputed;

  @override
  ObservableList<CarrinhoModel> get listaProdutos =>
      (_$listaProdutosComputed ??= Computed<ObservableList<CarrinhoModel>>(
              () => super.listaProdutos,
              name: '_CarrinhoListaProdutosControllerBase.listaProdutos'))
          .value;

  @override
  String toString() {
    return '''
listaProdutos: ${listaProdutos}
    ''';
  }
}
