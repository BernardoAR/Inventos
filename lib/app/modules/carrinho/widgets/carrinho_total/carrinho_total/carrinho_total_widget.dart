import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/modules/carrinho/widgets/carrinho_total/carrinho_total/carrinho_total_controller.dart';

class CarrinhoTotalWidget extends StatefulWidget {
  @override
  _CarrinhoTotalWidgetState createState() => _CarrinhoTotalWidgetState();
}

class _CarrinhoTotalWidgetState
    extends ModularState<CarrinhoTotalWidget, CarrinhoTotalController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Carrinho: '),
              Observer(builder: (BuildContext context) {
                return Text(
                    'R\$ ${controller.total.toStringAsFixed(2).replaceAll(".", ",")}');
              })
            ],
          )
        ],
      ),
    );
  }
}
