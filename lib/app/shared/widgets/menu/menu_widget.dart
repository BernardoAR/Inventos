import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/Constants/constants.dart';
import 'package:inventos/app/shared/widgets/menu/menu_controller.dart';

class MenuWidget extends StatefulWidget {
  final int tile;

  const MenuWidget({Key key, @required this.tile}) : super(key: key);
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends ModularState<MenuWidget, MenuController> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              accountName: Text(controller.usuario.user.displayName),
              accountEmail: Text(controller.usuario.user.email),
              currentAccountPicture: CircularProfileAvatar(
                controller.usuario.user.photoURL ??
                    '', //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                radius: 200, // sets radius, default 50.0
                backgroundColor: Colors
                    .transparent, // sets background color, default Colors.white
                initialsText: Text(
                  controller.usuario.user.displayName[0],
                  style: TextStyle(fontSize: 40, color: Colors.blueAccent),
                ), // sets initials text, set your own style, default Text('')
                borderColor:
                    Colors.white, // sets border color, default Colors.white
                cacheImage:
                    true, // allow widget to cache image against provided url
                onTap: () {
                  print('Clicando no nome do usuário');
                }, // sets on tap
              )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            onTap: () {
              Modular.to.pushReplacementNamed('/home');
            },
            selected: widget.tile == 1,
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Comprados/Alugados'),
            onTap: () {
              Modular.to.pushNamedAndRemoveUntil(
                  '/compras', ModalRoute.withName('/home'));
            },
            selected: widget.tile == 2,
          ),
          ListTile(
            leading: Icon(Icons.request_page),
            title: Text('Vender/Alugar'),
            onTap: () {
              Modular.to.pushNamedAndRemoveUntil(
                  '/vendas', ModalRoute.withName('/home'));
            },
            selected: widget.tile == 3,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {
              Modular.to.pushNamedAndRemoveUntil(
                  '/configuracoes', ModalRoute.withName('/home'));
            },
            selected: widget.tile == 4,
          ),
          Divider(
            color: Colors.grey[600],
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {
              controller.deslogar();
            },
          ),
        ],
      ),
    );
  }
}
