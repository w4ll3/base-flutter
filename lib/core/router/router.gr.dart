// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:baseproject/ui/splash_screen/splash_screen.dart';
import 'package:baseproject/ui/login_screen/login_document_screen.dart';
import 'package:baseproject/ui/login_screen/login_password_screen.dart';
import 'package:baseproject/ui/home_screen/home_screen.dart';
import 'package:baseproject/core/router/guards/auth_guard.dart';

abstract class Routes {
  static const splashScreen = '/';
  static const loginDocumentScreen = '/login-document-screen';
  static const loginPasswordScreen = '/login-password-screen';
  static const homeScreen = '/home-screen';
}

class Router extends RouterBase {
  @override
  Map<String, List<Type>> get guardedRoutes => {
        Routes.homeScreen: [AuthGuard],
      };

  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        if (hasInvalidArgs<SplashScreenArguments>(args)) {
          return misTypedArgsRoute<SplashScreenArguments>(args);
        }
        final typedArgs =
            args as SplashScreenArguments ?? SplashScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashScreen(key: typedArgs.key),
          settings: settings,
        );
      case Routes.loginDocumentScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginDocumentScreen(),
          settings: settings,
        );
      case Routes.loginPasswordScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginPasswordScreen(),
          settings: settings,
        );
      case Routes.homeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//SplashScreen arguments holder class
class SplashScreenArguments {
  final Key key;
  SplashScreenArguments({this.key});
}

//**************************************************************************
// Navigation helper methods extension
//***************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushSplashScreen({
    Key key,
  }) =>
      pushNamed(Routes.splashScreen,
          arguments: SplashScreenArguments(key: key));
  Future pushLoginDocumentScreen() => pushNamed(Routes.loginDocumentScreen);
  Future pushLoginPasswordScreen() => pushNamed(Routes.loginPasswordScreen);
  Future pushHomeScreen() => pushNamed(Routes.homeScreen);
}
