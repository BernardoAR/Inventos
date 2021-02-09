import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/alerta/alerta_widget.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:inventos/app/shared/widgets/menu/menu_widget.dart';
import 'package:mobx/mobx.dart';
import 'vender_controller.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;

class VenderPage extends StatefulWidget {
  final String mensagem;
  const VenderPage({Key key, this.mensagem = ''}) : super(key: key);

  @override
  _VenderPageState createState() => _VenderPageState();
}

class _VenderPageState extends ModularState<VenderPage, VenderController> {
  ReactionDisposer disposer;
  //use 'controller' variable to access controller
  void initState() {
    super.initState();

    disposer = autorun((_) {
      controller.listarProdutos();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.mensagem != null && widget.mensagem.isNotEmpty) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertaWidget(
                titulo: 'Aviso',
                conteudo: widget.mensagem,
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(
          tile: 3,
        ),
        appBar: AppBarWidget(
          titulo: 'Painel de Venda',
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Observer(builder: (context) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.produtos?.length ?? 0,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var current = controller.produtos[index];
                    return InkWell(
                        onTap: () {
                          Modular.to.pushNamed("/detalhes_produto",
                              arguments: current);
                        },
                        child: Card(
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(current.url),
                              child: Text('P$index'),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      Text(
                                        '${current.titulo}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('R\$ ${current.precoUnitario}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey)),
                                    ])),
                                Icon(Icons.arrow_right),
                                Divider(),
                              ],
                            ),
                          ),
                        ));
                  },
                );
              }),
              Container(
                height: 40,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    Modular.to.pushNamed("/vender/novo");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Novo Produto",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  color: constants.buttonColor,
                ),
              )
            ])));
  }
}
