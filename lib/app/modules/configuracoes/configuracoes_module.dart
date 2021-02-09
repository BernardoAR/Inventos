import 'package:inventos/app/modules/configuracoes/enderecos/enderecos_module.dart';
import 'package:inventos/app/modules/configuracoes/perfil/perfil_module.dart';

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
            child: (_, args) =>
                ConfiguracoesPage(mensagem: args.data['mensagem'])),
        ModularRouter('/enderecos', module: EnderecosModule()),
        ModularRouter('/perfil', module: PerfilModule()),
      ];

  static Inject get to => Inject<ConfiguracoesModule>.of();
}
