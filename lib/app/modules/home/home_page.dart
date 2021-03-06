import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget_pesquisa.dart';
import 'package:inventos/app/shared/widgets/menu/menu_widget.dart';
import 'package:mobx/mobx.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
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
      drawer: MenuWidget(
        tile: 1,
      ),
      appBar: AppBarWidgetPesquisa(),
      body: Observer(
        builder: (_) {
          return GridView.builder(
            itemCount: controller.produtos?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7),
            itemBuilder: (_, index) {
              var current = controller.produtos[index];
              var possuiDesconto = current.desconto > 0.0;

              return InkWell(
                onTap: () {
                  Modular.to.pushNamed("/detalhes_produto", arguments: current);
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 5.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage("${current.url}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    current.titulo,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  possuiDesconto
                                      ? "R\$ ${current.precoUnitario - current.desconto}"
                                      : "R\$ ${current.precoUnitario}",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  possuiDesconto
                                      ? "R\$ ${current.precoUnitario}"
                                      : "",
                                  style: TextStyle(
                                    color: Colors.red[300],
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${current.descricao}",
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
