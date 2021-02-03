import 'produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'produto_page.dart';

class ProdutoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ProdutoController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ProdutoPage()),
      ];

  static Inject get to => Inject<ProdutoModule>.of();
}
