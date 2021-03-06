import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/alerta/alerta_widget.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:inventos/app/shared/widgets/menu/menu_widget.dart';
import 'configuracoes_controller.dart';

class ConfiguracoesPage extends StatefulWidget {
  final String title;
  final String mensagem;
  const ConfiguracoesPage(
      {Key key, this.title = "Configuracoes", this.mensagem = ''})
      : super(key: key);

  @override
  _ConfiguracoesPageState createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState
    extends ModularState<ConfiguracoesPage, ConfiguracoesController> {
  @override
  void initState() {
    super.initState();
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
                Modular.to.pushNamed('/configuracoes/perfil');
              },
            ),
            ListTile(
              leading: Icon(Icons.apartment),
              title: Text('Meu Endereço'),
              onTap: () {
                Modular.to.pushNamed('/configuracoes/enderecos');
              },
            ),
          ],
        )));
  }
}
