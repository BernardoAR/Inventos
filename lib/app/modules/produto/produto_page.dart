import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'produto_controller.dart';

class ProdutoPage extends StatefulWidget {
  final String nomeDaLoja;
  const ProdutoPage({Key key, @required this.nomeDaLoja}) : super(key: key);

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends ModularState<ProdutoPage, ProdutoController> {
  ReactionDisposer disposer;
  //use 'controller' variable to access controller
  void initState() {
    super.initState();
    disposer = autorun((_) {
      controller.listarProdutos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20,
            ),
            Text(widget.nomeDaLoja)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushReplacementNamed('/compra/carrinho/vindodaloja');
        },
        child: Icon(Icons.shopping_cart),
      ),
      body: Observer(builder: (_) {
        return GridView.builder(
          itemCount: controller.produtos?.length ?? 0,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 7),
          itemBuilder: (BuildContext context, int index) {
            return Text(controller.produtos[index].descricao);
          },
        );
      }),
    );
  }
}
