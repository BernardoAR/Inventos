import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/Constants/constants_gradient.dart'
    as constantsGradient;
import 'package:inventos/app/shared/widgets/pesquisa/pesquisa_controller.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  final String titulo;

  const AppBarWidget({Key key, this.titulo = ''}) : super(key: key);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}

class _AppBarWidgetState
    extends ModularState<AppBarWidget, PesquisaController> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.titulo),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      flexibleSpace: Container(
        decoration:
            BoxDecoration(gradient: constantsGradient.gradienteEsquerdaDireita),
      ),
    );
  }
}
