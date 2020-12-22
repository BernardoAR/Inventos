import 'package:flutter/material.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
import 'package:inventos/app/shared/Constants/constants_gradient.dart'
    as constantsGradient;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/alerta/alerta_widget.dart';
import 'esqueceu_senha_controller.dart';

class EsqueceuSenhaPage extends StatefulWidget {
  @override
  _EsqueceuSenhaPageState createState() => _EsqueceuSenhaPageState();
}

class _EsqueceuSenhaPageState
    extends ModularState<EsqueceuSenhaPage, EsqueceuSenhaController> {
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
                  'Esqueceu a Senha',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: mediaQuery.size.width * 0.1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: mediaQuery.size.height * 0.04),
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
                SizedBox(height: mediaQuery.size.height * 0.02),
                RaisedButton(
                  onPressed: () async {
                    // Se estiver tudo certo, vai para o cadastro
                    if (form.currentState.validate()) {
                      // Cadastra como email
                      await controller.enviaPedidoRecuperacao();
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
                        'RESETAR SENHA',
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
