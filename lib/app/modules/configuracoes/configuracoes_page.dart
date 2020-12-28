import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget_pesquisa.dart';
import 'package:inventos/app/shared/widgets/menu/menu_widget.dart';
import 'configuracoes_controller.dart';

class ConfiguracoesPage extends StatefulWidget {
  final String title;
  const ConfiguracoesPage({Key key, this.title = "Configuracoes"})
      : super(key: key);

  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState
    extends ModularState<ConfiguracoesPage, ConfiguracoesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBarWidget(
          titulo: 'Configurações',
        ),
        drawer: MenuWidget(
          tile: 4,
        ),
        body: Container(
            child: Column(
          children: [
            Divider(),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Meu Perfil'),
              onTap: () {
                Modular.to.pushNamed('/perfil');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Meus Endereços'),
              onTap: () {
                Modular.to.pushNamed('/enderecos');
              },
            ),
          ],
        )));
  }
}
