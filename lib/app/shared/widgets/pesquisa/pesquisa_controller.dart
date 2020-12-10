import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'pesquisa_controller.g.dart';

class PesquisaController = _PesquisaControllerBase with _$PesquisaController;

abstract class _PesquisaControllerBase with Store {
  TextEditingController get pesquisaQueryController => TextEditingController();
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
  }

  @action
  void iniciaPesquisa(context) {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _pararPesquisa));
    _estaPesquisando = true;
  }
}
