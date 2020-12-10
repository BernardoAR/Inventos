import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'login_controller.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
import 'package:inventos/app/shared/Constants/constants_gradient.dart'
    as constantsGradient;

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
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: constantsGradient.gradienteCimaBaixo,
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: mediaQuery.size.height * 0.2,
              width: mediaQuery.size.width * 0.8,
              fit: BoxFit.contain,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'E-mail', filled: true, fillColor: Colors.white),
            ),
            SizedBox(height: mediaQuery.size.height * 0.01),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Senha', filled: true, fillColor: Colors.white),
            ),

            GestureDetector(
              onTap: () {
                Modular.to.pushReplacementNamed('/esqueceuasenha');
              },
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text("Esqueceu a Senha?", style: TextStyle(color: Colors.blue))
              ]),
            ),
            SizedBox(height: mediaQuery.size.height * 0.05),
            // Logar com e-mail
            RaisedButton(
              onPressed: controller.loginWithEmail,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    child: Icon(
                      Icons.email,
                      size: 20,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: mediaQuery.size.width * 0.03,
                    ),
                  ),
                  Text(
                    'Entrar com o e-mail',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              color: Colors.grey[700],
            ),
            // Logar com Google
            RaisedButton(
              onPressed: controller.loginWithGoogle,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        image: AssetImage(
                          'assets/logos/google_light.png',
                          package: 'flutter_signin_button',
                        ),
                        height: mediaQuery.size.height * 0.05,
                      ),
                    ),
                  ),
                  Text(
                    'Entrar com o Google',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
              color: Colors.white,
            ),
          ],
        ),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {
          Modular.to.pushReplacementNamed('/cadastro');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CADASTRE-SE',
              style: TextStyle(color: constants.buttonColor),
            ),
          ],
        ),
        color: Colors.white,
      ),
    );
  }
}
