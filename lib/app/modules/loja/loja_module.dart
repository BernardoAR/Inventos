import 'loja_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'loja_page.dart';

class LojaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $LojaController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LojaPage()),
      ];

  static Inject get to => Inject<LojaModule>.of();
}
