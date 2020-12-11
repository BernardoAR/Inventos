import 'shared/widgets/menu/menu_controller.dart';
import 'shared/widgets/carrinho/carrinho_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/app_widget.dart';
import 'package:inventos/app/modules/carrinho/pages/carrinho/carrinho_module.dart';
import 'package:inventos/app/modules/detalhes_produto/detalhes_produto_module.dart';
import 'package:inventos/app/modules/home/home_module.dart';
import 'package:inventos/app/modules/login/login_module.dart';
import 'package:inventos/app/modules/produto/produto_module.dart';
import 'package:inventos/app/pages/splash/splash_page.dart';
import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:inventos/app/shared/produto_lista/produto_lista_controller.dart';
import 'package:inventos/app/shared/produto_lista/repositories/produto_lista_repository.dart';
import 'package:inventos/app/shared/produto_lista/repositories/produto_lista_repository_interface.dart';
import 'package:inventos/app/shared/store/carrinho_store.dart';
import 'package:inventos/app/shared/widgets/pesquisa/pesquisa_controller.dart';

import 'app_controller.dart';
import 'modules/carrinho/widgets/carrinho_lista_produtos/carrinho_lista_produtos/carrinho_lista_produtos_controller.dart';
import 'modules/carrinho/widgets/carrinho_total/carrinho_total/carrinho_total_controller.dart';
import 'modules/produto/produto_controller.dart';
import 'pages/splash/splash_controller.dart';
import 'shared/auth/repositories/auth_repository.dart';
import 'shared/auth/repositories/auth_repository_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $MenuController,
        $CarrinhoController,
        $CarrinhoTotalController,
        $CarrinhoListaProdutosController,
        $CarrinhoListaProdutosController,
        $SplashController,
        $AppController,
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind<IProdutoListaRepository>((i) => ProdutoListaRepository()),
        Bind((i) => AuthController()),
        Bind((i) => ProdutoController()),
        Bind((i) => ProdutoListaController()),
        Bind((i) => CarrinhoStore()),
        Bind((i) => PesquisaController())
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SplashPage()),
        ModularRouter('/login',
            module: LoginModule(), transition: TransitionType.noTransition),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/carrinho', module: CarrinhoModule()),
        ModularRouter('/detalhes_produto', module: DetalhesProdutoModule()),
        ModularRouter('/produto', module: ProdutoModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
