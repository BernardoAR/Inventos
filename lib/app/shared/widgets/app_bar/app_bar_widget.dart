import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/Constants/constants_gradient.dart'
    as constantsGradient;
import 'package:inventos/app/shared/widgets/pesquisa/campo_pesquisa/campo_pesquisa_widget.dart';
import 'package:inventos/app/shared/widgets/pesquisa/campo_pesquisa_acoes/campo_pesquisa_acoes_widget.dart';
import 'package:inventos/app/shared/widgets/pesquisa/pesquisa_controller.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}

class _AppBarWidgetState
    extends ModularState<AppBarWidget, PesquisaController> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: controller.estaPesquisando ? CampoPesquisaWidget() : Container(),
      leading: controller.estaPesquisando ? const BackButton() : Container(),
      actions: <Widget>[CampoPesquisaAcoesWidget()],
      flexibleSpace: Container(
        decoration:
            BoxDecoration(gradient: constantsGradient.gradienteEsquerdaDireita),
      ),
    );
  }
}
