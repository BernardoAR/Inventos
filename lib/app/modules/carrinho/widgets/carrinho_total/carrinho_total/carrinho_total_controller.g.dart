// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrinho_total_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CarrinhoTotalController = BindInject(
  (i) => CarrinhoTotalController(i<CarrinhoStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CarrinhoTotalController on _CarrinhoTotalControllerBase, Store {
  Computed<double> _$totalComputed;

  @override
  double get total => (_$totalComputed ??= Computed<double>(() => super.total,
          name: '_CarrinhoTotalControllerBase.total'))
      .value;

  @override
  String toString() {
    return '''
total: ${total}
    ''';
  }
}
