import 'esqueceu_senha_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'esqueceu_senha_page.dart';

class EsqueceuSenhaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $EsqueceuSenhaController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => EsqueceuSenhaPage()),
      ];

  static Inject get to => Inject<EsqueceuSenhaModule>.of();
}
