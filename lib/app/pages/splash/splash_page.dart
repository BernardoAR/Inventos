import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inventos/app/shared/Constants/constants_gradient.dart'
    as constantsGradient;
import 'package:inventos/app/shared/auth/auth_controller.dart';
import 'package:mobx/mobx.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) {
      final auth = Modular.get<AuthController>();
      if (auth.status == AuthStatus.login) {
        Modular.to.pushReplacementNamed('/home');
      } else if (auth.status == AuthStatus.logoff) {
        Modular.to.pushReplacementNamed('/login');
      }
    });
    Firebase.initializeApp();
    Future.delayed(Duration(seconds: 2)).then((v) {
      Modular.to.pushReplacementNamed('/login', arguments: {'mensagem': ''});
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: mediaQuery.size.height * 0.2,
            width: mediaQuery.size.width * 0.8,
            fit: BoxFit.contain,
          ),
          CircularProgressIndicator()
        ],
      ),
      decoration: BoxDecoration(
        gradient: constantsGradient.gradienteCimaBaixo,
      ),
    );
  }
}
