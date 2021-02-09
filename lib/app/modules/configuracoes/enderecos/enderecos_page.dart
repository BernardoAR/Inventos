import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget.dart';
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
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    controller.atualizaValores();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBarWidget(
          titulo: 'Endereço',
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
              key: form,
              child: Column(children: [
                SizedBox(height: mediaQuery.size.height * 0.02),
                TextFormField(
                  controller: controller.cidadeController,
                  validator: controller.validaCidade,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'Cidade',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                TextFormField(
                  controller: controller.enderecoController,
                  validator: controller.validaEndereco,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'Endereço',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: mediaQuery.size.height * 0.01),
                TextFormField(
                  controller: controller.bairroController,
                  validator: controller.validaBairro,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'Bairro',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(2)],
                  controller: controller.ufController,
                  validator: controller.validaUf,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'UF',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: mediaQuery.size.height * 0.01),
                TextFormField(
                  controller: controller.referenciaController,
                  validator: controller.validaReferencia,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'Referência',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: mediaQuery.size.height * 0.01),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(8),
                  ],
                  controller: controller.cepController,
                  validator: controller.validaCep,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'CEP',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.red)),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                RaisedButton(
                  onPressed: () async {
                    if (form.currentState.validate()) {
                      controller.atualizaEndereco();
                    }
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
