import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarrinhoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          Modular.to.pushNamedAndRemoveUntil(
              '/carrinho', ModalRoute.withName('/home'));
        });
  }
}
