import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
import 'package:inventos/app/shared/widgets/alerta/alerta_widget.dart';
import 'cadastro_controller.dart';
import 'package:inventos/app/shared/Constants/constants_gradient.dart'
    as constantsGradient;

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        shadowColor: Colors.transparent,
        backgroundColor: constants.primaryColor,
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: constantsGradient.gradienteCimaBaixo,
          ),
          padding: EdgeInsets.all(20),
          child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Cadastro',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: mediaQuery.size.width * 0.1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: mediaQuery.size.height * 0.04),
                TextFormField(
                  controller: controller.nomeController,
                  validator: controller.validaNome,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'Nome Completo',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: mediaQuery.size.height * 0.01),
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
                SizedBox(height: mediaQuery.size.height * 0.02),
                RaisedButton(
                  onPressed: () async {
                    // Se estiver tudo certo, vai para o cadastro
                    if (form.currentState.validate()) {
                      // Cadastra como email
                      await controller.cadastraComEmail();
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
                      Text(
                        'CADASTRE-SE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  color: constants.buttonColor,
                ),
              ],
            ),
          )),
    );
  }
}
