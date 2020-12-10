import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/widgets/carrinho/carrinho_widget.dart';
import 'package:inventos/app/shared/widgets/pesquisa/pesquisa_controller.dart';

class CampoPesquisaAcoesWidget extends StatefulWidget {
  @override
  _CampoPesquisaAcoesWidgetState createState() =>
      _CampoPesquisaAcoesWidgetState();
}

class _CampoPesquisaAcoesWidgetState
    extends ModularState<CampoPesquisaAcoesWidget, PesquisaController> {
  @override
  Widget build(BuildContext context) {
    // Verifica se está pesquisando, se estiver, retorna nada
    if (controller.estaPesquisando) {
      return Container();
    }
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            controller.iniciaPesquisa(context);
          },
        ),
        CarrinhoWidget(),
      ],
    );
  }
}
