import 'package:dio/dio.dart';
import 'shared/repositories/usuarios/usuarios_repository.dart';
import 'package:inventos/app/modules/cadastro/cadastro_module.dart';
import 'package:inventos/app/shared/repositories/produtos/produtos_controller.dart';
import 'package:inventos/app/shared/repositories/produtos/produtos_repository.dart';
import 'modules/cadastro/cadastro_controller.dart';
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
import 'package:inventos/app/shared/store/carrinho_store.dart';
import 'package:inventos/app/shared/widgets/pesquisa/pesquisa_controller.dart';
import 'package:inventos/app/shared/custom_dio/custom_dio.dart';

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
        $UsuariosRepository,
        $CadastroController,
        $MenuController,
        $CarrinhoController,
        $CarrinhoTotalController,
        $CarrinhoListaProdutosController,
        $CarrinhoListaProdutosController,
        $SplashController,
        $AppController,
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => ProdutosRepository(i.get<CustomDio>())),
        Bind((i) => AuthController()),
        Bind((i) => ProdutoController()),
        Bind((i) => ProdutosController()),
        Bind((i) => CarrinhoStore()),
        Bind((i) => PesquisaController()),
        Bind((i) => CustomDio(i.get<Dio>())),
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => SplashPage(),
            transition: TransitionType.downToUp),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
        ModularRouter('/carrinho', module: CarrinhoModule()),
        ModularRouter('/detalhes_produto', module: DetalhesProdutoModule()),
        ModularRouter('/produto', module: ProdutoModule()),
        ModularRouter('/cadastro',
            module: CadastroModule(), transition: TransitionType.downToUp),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
