import 'package:flutter/material.dart';
import 'package:inventos/app/shared/Constants/constants_gradient.dart'
    as constantsGradient;

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  final String titulo;

  const AppBarWidget({Key key, this.titulo = ''}) : super(key: key);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}

class _AppBarWidgetState extends State<AppBarWidget> {
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
