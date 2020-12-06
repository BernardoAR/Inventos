import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/models/produto_model.dart';
import 'detalhes_produto_controller.dart';

class DetalhesProdutoPage extends StatefulWidget {
  final ProdutoModel produtoModel;
  final String title;
  const DetalhesProdutoPage(
      {Key key,
      this.title = "Detalhes do Produto",
      @required this.produtoModel})
      : super(key: key);

  @override
  _DetalhesProdutoPageState createState() => _DetalhesProdutoPageState();
}

class _DetalhesProdutoPageState
    extends ModularState<DetalhesProdutoPage, DetalhesProdutoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.produtoModel.titulo), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              controller.adicionaProdutoNoCarrinho(widget.produtoModel);
              Modular.link.popAndPushNamed('/carrinho/vindodosdetalhes');
            })
      ]),
      body: Column(
        children: <Widget>[
          Card(
              child: Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(
                  child: Text('Oe'),
                ),
                Row(children: [
                  Expanded(child: Text('Código: 0000${widget.produtoModel.id}'))
                ]),
                SizedBox(height: 20)
              ],
            ),
          )),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            height: 40,
            child: RaisedButton(
                onPressed: () {
                  controller.adicionaProdutoNoCarrinho(widget.produtoModel);
                  Modular.to.popAndPushNamed('/carrinho/vindodacompra');
                },
                child: Text('Adicionar ao carrinho'.toUpperCase(),
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
