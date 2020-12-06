import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'loja_controller.dart';

class LojaPage extends StatefulWidget {
  final String title;
  const LojaPage({Key key, this.title = "Loja"}) : super(key: key);

  @override
  _LojaPageState createState() => _LojaPageState();
}

class _LojaPageState extends ModularState<LojaPage, LojaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.highlight_off),
              onPressed: controller.logOff,
            ),
            title: Text(widget.title),
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Modular.to
                        .pushNamed('/detalhes_produto/carrinho/Vindo da Loja');
                  })
            ]),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Modular.to.pushNamed('/produto/Loja $index');
              },
              title: Text('Loja $index'),
              subtitle: Text('Melhor Loja'),
            );
          },
        ));
  }
}
