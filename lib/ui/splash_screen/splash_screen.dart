import 'package:auto_route/auto_route.dart';
import 'package:baseproject/core/router/router.gr.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((_) =>
        ExtendedNavigator.ofRouter<Router>()
            .pushReplacementNamed(Routes.loginDocumentScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCBCBCB),
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/logo.png',
            scale: MediaQuery.of(context).devicePixelRatio,
          ),
        ),
      ),
    );
  }
}
