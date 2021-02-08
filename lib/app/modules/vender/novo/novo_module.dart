import 'novo_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'novo_page.dart';

class NovoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $NovoController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => NovoPage()),
      ];

  static Inject get to => Inject<NovoModule>.of();
}
