import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget_pesquisa.dart';
import 'package:inventos/app/shared/widgets/menu/menu_widget.dart';
import 'detalhes_produto_controller.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;

class DetalhesProdutoPage extends StatefulWidget {
  final ProdutoModel produtoModel;
  const DetalhesProdutoPage({Key key, @required this.produtoModel})
      : super(key: key);

  @override
  _DetalhesProdutoPageState createState() => _DetalhesProdutoPageState();
}

class _DetalhesProdutoPageState
    extends ModularState<DetalhesProdutoPage, DetalhesProdutoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    var possuiDesconto = widget.produtoModel.desconto > 0.0;
    return Scaffold(
      appBar: AppBarWidgetPesquisa(),
      drawer: MenuWidget(
        tile: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '${widget.produtoModel.titulo}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Container(
            height: mediaQuery.height * 0.45,
            width: mediaQuery.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage("${widget.produtoModel.url}"),
                  fit: BoxFit.cover),
            ),
          ),
          Card(
              child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                      child: Text(
                    possuiDesconto
                        ? "R\$ ${widget.produtoModel.precoUnitario - widget.produtoModel.desconto}"
                        : "R\$ ${widget.produtoModel.precoUnitario}",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ))
                ]),
              ],
            ),
          )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            height: 40,
            child: RaisedButton(
              onPressed: () {
                controller.adicionaProdutoNoCarrinho(widget.produtoModel);
                Modular.link.popAndPushNamed("/carrinho");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ADICIONAR AO CARRINHO (${widget.produtoModel.tipoProduto.titulo.toUpperCase()})",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              color: constants.buttonColor,
            ),
          ),
          SizedBox(height: 20),
          Card(
              child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                      child: Text('Descrição: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)))
                ]),
                Row(children: [
                  Expanded(
                      child: Text(widget.produtoModel.descricao,
                          style: TextStyle(fontSize: 14)))
                ]),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
