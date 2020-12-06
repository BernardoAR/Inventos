import 'package:inventos/app/modules/carrinho/pages/carrinho/carrinho_module.dart';
import 'package:inventos/app/shared/store/carrinho_store.dart';

import 'detalhes_produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'detalhes_produto_page.dart';

class DetalhesProdutoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DetalhesProdutoController(i.get<CarrinhoStore>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => DetalhesProdutoPage(
                  produtoModel: args.data,
                )),
        ModularRouter('/carrinho', module: CarrinhoModule())
      ];

  static Inject get to => Inject<DetalhesProdutoModule>.of();
}
