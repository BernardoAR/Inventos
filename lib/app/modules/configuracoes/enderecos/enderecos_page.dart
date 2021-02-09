import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:inventos/app/shared/widgets/imagem/imagem_widget.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
import 'enderecos_controller.dart';

class EnderecosPage extends StatefulWidget {
  final String title;
  const EnderecosPage({Key key, this.title = "Enderecos"}) : super(key: key);

  @override
  _EnderecosPageState createState() => _EnderecosPageState();
}

class _EnderecosPageState
    extends ModularState<EnderecosPage, EnderecosController> {
  //use 'controller' variable to access controller
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBarWidget(
          titulo: 'Meu Perfil',
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
              key: form,
              child: Column(children: [
                ImagemWidget(),
                SizedBox(height: mediaQuery.size.height * 0.02),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'Nome Completo',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: mediaQuery.size.height * 0.01),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'E-mail',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: mediaQuery.size.height * 0.01),
                TextFormField(
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
                    if (form.currentState.validate()) {}
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Atualizar Endereço",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  color: constants.buttonColor,
                ),
              ])),
        )));
  }
}
