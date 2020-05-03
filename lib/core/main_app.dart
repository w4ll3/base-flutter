import 'package:auto_route/auto_route.dart';
import 'package:baseproject/core/localizations/app_localizations_delegate.dart';
import 'package:baseproject/core/localizations/i18n.dart';
import 'package:baseproject/core/router/guards/auth_guard.dart';
import 'package:baseproject/core/router/router.gr.dart';
import 'package:baseproject/ui/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({this.localizedValues, this.supportedLocales});

  final Iterable<Locale> supportedLocales;
  final Map<String, Map<String, dynamic>> localizedValues;

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'base',
      localizationsDelegates: [
        AppLocalizationsDelegate(localizedValues),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: supportedLocales,
      locale: I18n.defaultLocale,
      theme: AppStyle.theme,
      builder: ExtendedNavigator<Router>(
        router: Router(),
        guards: [AuthGuard()],
      ),
    );
  }
}
