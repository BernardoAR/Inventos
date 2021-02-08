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
        ModularRouter(Modular.initialRoute, child: (_, args) => VenderPage()),
      ];

  static Inject get to => Inject<VenderModule>.of();
}
