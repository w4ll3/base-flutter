import 'package:baseproject/core/environment/flavor.dart';
import 'package:baseproject/core/injection_container.dart' as di;
import 'package:baseproject/core/localizations/i18n.dart';
import 'package:baseproject/core/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  const BuildEnvironment environment = BuildEnvironment(
    baseUrl: 'http://api.base.prod.uds.com.br/app',
    flavor: BuildFlavor.prod,
  );

  WidgetsFlutterBinding.ensureInitialized();
  await di.init(
    environment: environment,
  );

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(MyApp(
    localizedValues: await I18n('assets/i18n/').initializeI18n(),
    supportedLocales: I18n.supportedLocales,
  ));
}
