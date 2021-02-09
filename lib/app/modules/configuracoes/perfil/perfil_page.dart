import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:inventos/app/shared/widgets/imagem/imagem_widget.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;
import 'package:inventos/app/shared/widgets/menu/menu_widget.dart';
import 'perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  final String title;
  const PerfilPage({Key key, this.title = "Perfil"}) : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilController> {
  //use 'controller' variable to access controller
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    controller.atualizaLogadoGoogle();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBarWidget(
          titulo: 'Meu Perfil',
        ),
        drawer: MenuWidget(
          tile: 4,
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: form,
                    child: Observer(builder: (_) {
                      return Column(children: [
                        ImagemWidget(
                            imagemController: controller.imagemController),
                        SizedBox(height: mediaQuery.size.height * 0.02),
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
                        Visibility(
                          child:
                              SizedBox(height: mediaQuery.size.height * 0.01),
                          visible: !controller.logadoGoogle,
                        ),
                        Visibility(
                          child: TextFormField(
                            controller: controller.emailController,
                            validator: controller.validaEmail,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                labelText: 'E-mail',
                                filled: true,
                                fillColor: Colors.white,
                                errorStyle: TextStyle(color: Colors.white)),
                          ),
                          visible: !controller.logadoGoogle,
                        ),
                        Visibility(
                          child:
                              SizedBox(height: mediaQuery.size.height * 0.01),
                          visible: !controller.logadoGoogle,
                        ),
                        Visibility(
                          child: TextFormField(
                            controller: controller.senhaController,
                            validator: controller.validaSenha,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                labelText: 'Senha Nova',
                                filled: true,
                                fillColor: Colors.white,
                                errorStyle: TextStyle(color: Colors.white)),
                            obscureText: true,
                          ),
                          visible: !controller.logadoGoogle,
                        ),
                        Visibility(
                          child:
                              SizedBox(height: mediaQuery.size.height * 0.01),
                          visible: !controller.logadoGoogle,
                        ),
                        Visibility(
                          child: TextFormField(
                            controller: controller.senhaController,
                            validator: controller.validaSenha,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                labelText: 'Senha Atual',
                                filled: true,
                                fillColor: Colors.white,
                                errorStyle: TextStyle(color: Colors.white)),
                            obscureText: true,
                          ),
                          visible: !controller.logadoGoogle,
                        ),
                        SizedBox(height: mediaQuery.size.height * 0.02),
                        RaisedButton(
                          onPressed: () async {
                            if (form.currentState.validate()) {
                              await controller.imagemController
                                  .enviarImagemFirebase();
                              controller.atualizaDados();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ATUALIZAR PERFIL",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          color: constants.buttonColor,
                        ),
                      ]);
                    })))));
  }
}
