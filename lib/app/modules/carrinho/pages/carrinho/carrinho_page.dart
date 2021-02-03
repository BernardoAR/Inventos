import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/modules/carrinho/widgets/carrinho_lista_produtos/carrinho_lista_produtos/carrinho_lista_produtos_widget.dart';
import 'package:inventos/app/modules/carrinho/widgets/carrinho_total/carrinho_total/carrinho_total_widget.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:inventos/app/shared/widgets/menu/menu_widget.dart';
import 'carrinho_controller.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({Key key}) : super(key: key);

  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState
    extends ModularState<CarrinhoPage, CarrinhoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        titulo: 'Carrinho de Compras',
      ),
      drawer: MenuWidget(
        tile: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            CarrinhoListaProdutosWidget(),
            Divider(),
            CarrinhoTotalWidget(),
            Divider(),
            Container(
              height: 40,
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Modular.to.pushNamed("/pagamento");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ir para o Pagamento",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                color: constants.buttonColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
