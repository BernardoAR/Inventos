import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'E-mail'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Senha'),
          ),
          SignInButton(
            Buttons.Email,
            text: "Entrar com o email",
            onPressed: controller.loginWithGoogle,
          ),
          SignInButton(
            Buttons.Google,
            text: "Entrar com o Google",
            onPressed: controller.loginWithGoogle,
          )
        ],
      ),
    );
  }
}
