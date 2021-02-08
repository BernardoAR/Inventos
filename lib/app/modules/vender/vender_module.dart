import 'package:inventos/app/modules/vender/novo/novo_module.dart';

import 'vender_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'vender_page.dart';

class VenderModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $VenderController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => VenderPage(mensagem: args.data['mensagem'])),
        ModularRouter('/novo', module: NovoModule()),
      ];

  static Inject get to => Inject<VenderModule>.of();
}
