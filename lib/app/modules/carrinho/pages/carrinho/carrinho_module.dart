import 'package:inventos/app/modules/carrinho/widgets/carrinho_lista_produtos/carrinho_lista_produtos/carrinho_lista_produtos_controller.dart';
import 'package:inventos/app/modules/carrinho/widgets/carrinho_total/carrinho_total/carrinho_total_controller.dart';
import 'package:inventos/app/shared/store/carrinho_store.dart';

import 'carrinho_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'carrinho_page.dart';

class CarrinhoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CarrinhoListaProdutosController(i.get<CarrinhoStore>())),
        Bind((i) => CarrinhoTotalController(i.get<CarrinhoStore>())),
        $CarrinhoController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/:title',
            child: (_, args) => CarrinhoPage(
                  title: args.params['title'],
                )),
      ];

  static Inject get to => Inject<CarrinhoModule>.of();
}
