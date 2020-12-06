import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'carrinho_lista_produtos_controller.dart';

// Widget com a lista de todos os produtos
class CarrinhoListaProdutosWidget extends StatefulWidget {
  @override
  _CarrinhoListaProdutosWidgetState createState() =>
      _CarrinhoListaProdutosWidgetState();
}

class _CarrinhoListaProdutosWidgetState extends ModularState<
    CarrinhoListaProdutosWidget, CarrinhoListaProdutosController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.listaProdutos?.length ?? 0,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var current = controller.listaProdutos[index];
        return Card(
          margin: EdgeInsets.all(5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(current.produto.url),
              child: Text('P$index'),
            ),
            title: Row(
              children: [
                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        '${current.produto.titulo}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('R\$ ${current.produto.precoUnitario}',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey)),
                    ])),
                IconButton(
                    icon: Icon(Icons.remove), onPressed: current.remover),
                Observer(builder: (BuildContext context) {
                  return Text('R\$ ${current.quantidade}',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.grey));
                }),
                IconButton(icon: Icon(Icons.add), onPressed: current.adicionar),
              ],
            ),
          ),
        );
      },
    );
  }
}
