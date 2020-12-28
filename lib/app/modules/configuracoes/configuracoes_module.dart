import 'configuracoes_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'configuracoes_page.dart';

class ConfiguracoesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ConfiguracoesController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ConfiguracoesPage()),
      ];

  static Inject get to => Inject<ConfiguracoesModule>.of();
}
