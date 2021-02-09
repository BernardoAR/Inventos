import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/pesquisa/pesquisa_controller.dart';

class CampoPesquisaWidget extends StatefulWidget {
  @override
  _CampoPesquisaWidgetState createState() => _CampoPesquisaWidgetState();
}

class _CampoPesquisaWidgetState
    extends ModularState<CampoPesquisaWidget, PesquisaController> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      controller: controller.pesquisaQueryController,
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide()),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[800])),
          labelText: 'Pesquisar...',
          labelStyle: TextStyle(color: Colors.grey[800]),
          isDense: true, // Added this
          contentPadding: EdgeInsets.all(11),
          filled: true,
          fillColor: Colors.white), // Added this
      style: TextStyle(color: Colors.grey[800], fontSize: 16.0, height: 1),
      onSubmitted: (query) => controller.atualizaPesquisa(query),
    );
  }
}
