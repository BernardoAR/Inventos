import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/Constants/constants_gradient.dart'
    as constantsGradient;

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  final String titulo;

  const AppBarWidget({Key key, @required this.titulo}) : super(key: key);
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(widget.titulo),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Modular.link.popAndPushNamed('/carrinho');
            })
      ],
      flexibleSpace: Container(
        decoration:
            BoxDecoration(gradient: constantsGradient.gradienteEsquerdaDireita),
      ),
    );
  }
}
