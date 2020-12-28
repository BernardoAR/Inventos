import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'configuracoes_controller.g.dart';

@Injectable()
class ConfiguracoesController = _ConfiguracoesControllerBase
    with _$ConfiguracoesController;

abstract class _ConfiguracoesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
