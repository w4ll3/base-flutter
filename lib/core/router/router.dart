import 'package:auto_route/auto_route_annotations.dart';
import 'package:baseproject/core/router/guards/auth_guard.dart';
import 'package:baseproject/ui/home_screen/home_screen.dart';
import 'package:baseproject/ui/login_screen/login_document_screen.dart';
import 'package:baseproject/ui/login_screen/login_password_screen.dart';
import 'package:baseproject/ui/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
)
class $Router {
  @initial
  SplashScreen splashScreen;

  LoginDocumentScreen loginDocumentScreen;

  LoginPasswordScreen loginPasswordScreen;

  @GuardedBy([AuthGuard])
  HomeScreen homeScreen;
}
