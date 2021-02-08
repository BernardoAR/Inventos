import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:inventos/app/shared/widgets/imagem/imagem_widget.dart';
import 'novo_controller.dart';
import 'package:inventos/app/shared/Constants/constants.dart' as constants;

class NovoPage extends StatefulWidget {
  final String title;
  const NovoPage({Key key, this.title = "Novo"}) : super(key: key);

  @override
  _NovoPageState createState() => _NovoPageState();
}

class _NovoPageState extends ModularState<NovoPage, NovoController> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBarWidget(
          titulo: 'Novo Produto/Serviço',
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
                  controller: controller.tituloController,
                  validator: controller.validaTitulo,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'Título',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                TextFormField(
                  controller: controller.descricaoController,
                  validator: controller.validaDescricao,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.text_fields),
                      labelText: 'Descrição',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                TextFormField(
                  controller: controller.quantidadeController,
                  validator: controller.validaQuantidade,
                  decoration: InputDecoration(
                      labelText: 'Quantidade em Estoque',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                TextFormField(
                  controller: controller.precoUnitarioController,
                  validator: controller.validaPrecoUnitario,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: 'Preço Unitário',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                TextFormField(
                  controller: controller.descontoController,
                  validator: controller.validaDesconto,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: 'Desconto por Unidade',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                TextFormField(
                  controller: controller.categoriaController,
                  validator: controller.validaCategoria,
                  decoration: InputDecoration(
                      labelText: 'Categoria',
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: mediaQuery.size.height * 0.02),
                DropdownButton<String>(
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    isExpanded: true,
                    items: controller.tiposProduto.entries
                        .map<DropdownMenuItem<String>>(
                            (MapEntry<String, String> e) =>
                                DropdownMenuItem<String>(
                                  value: e.key,
                                  child: Text(e.value),
                                ))
                        .toList(),
                    onChanged: controller.atualizaItemSelecionado,
                    value: controller.itemSelecionado),
                RaisedButton(
                  onPressed: () async {
                    if (form.currentState.validate()) {
                      await controller.imagemController.enviarImagemFirebase();
                      controller.insereProduto();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cadastrar Produto/Serviço",
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
