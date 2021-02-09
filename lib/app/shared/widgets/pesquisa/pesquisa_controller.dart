import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/modules/home/home_controller.dart';
import 'package:mobx/mobx.dart';
part 'pesquisa_controller.g.dart';

class PesquisaController = _PesquisaControllerBase with _$PesquisaController;

abstract class _PesquisaControllerBase with Store {
  TextEditingController get pesquisaQueryController => TextEditingController();
  HomeController homeController = Modular.get();
  @observable
  bool _estaPesquisando = false;

  @observable
  String _pesquisa;

  @computed
  bool get estaPesquisando => _estaPesquisando;
  @computed
  String get getPesquisa => _pesquisa;

  @action
  void _pararPesquisa() {
    limparPesquisa();
    this._estaPesquisando = false;
  }

  @action
  void limparPesquisa() {
    this.pesquisaQueryController.clear();
    atualizaPesquisa('');
  }

  @action
  void atualizaPesquisa(String novaPesquisa) {
    _pesquisa = novaPesquisa;
    homeController.listarProdutosWhere(novaPesquisa);
  }

  @action
  void iniciaPesquisa(context) {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _pararPesquisa));
    _estaPesquisando = true;
  }
}
