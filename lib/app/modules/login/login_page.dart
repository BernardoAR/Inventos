import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
import 'package:inventos/app/shared/Constants/constants_gradient.dart'
    as constantsGradient;
import 'package:inventos/app/shared/widgets/alerta/alerta_widget.dart';

class LoginPage extends StatefulWidget {
  final String mensagem;

  const LoginPage({Key key, this.mensagem}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
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
            Form(
                key: form,
                child: Column(children: [
                  TextFormField(
                    controller: controller.emailController,
                    validator: controller.validaEmail,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'E-mail',
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.01),
                  TextFormField(
                    controller: controller.senhaController,
                    validator: controller.validaSenha,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Senha',
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(color: Colors.white)),
                    obscureText: true,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (form.currentState.validate()) {
                        await controller.loginWithEmail();
                        if (controller.erro) {
                          controller.erro = false;
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertaWidget(
                                  titulo: controller.titulo,
                                  conteudo: controller.conteudo,
                                );
                              });
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          child: Icon(
                            Icons.send,
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
                ])),
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
          Modular.to.pushNamed('/cadastro');
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
