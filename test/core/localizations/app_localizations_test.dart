import 'dart:ui';

import 'package:baseproject/core/localizations/app_localizations.dart';
import 'package:baseproject/core/localizations/app_localizations_delegate.dart';
import 'package:baseproject/core/localizations/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AppLocalizations appLocalizations = AppLocalizations(const Locale('pt'), {
    'pt': {
      'hello': 'Oi!',
      'greetings': 'Oi! {{name}}',
      'buttons': {'login': 'Entrar'}
    },
    'en': {
      'hello': 'Hi!',
      'buttons': {'login': 'Login'}
    },
  });

  test(
    'should return a translated string',
    () async {
      expect(appLocalizations.trans('hello'), 'Oi!');
    },
  );

  test(
    'should return a translated string when there are more than one language',
    () async {
      expect(appLocalizations.trans('hello'), 'Oi!');
    },
  );

  test(
    'should return a translated string using dot notation',
    () async {
      expect(appLocalizations.trans('buttons.login'), 'Entrar');
    },
  );

  test(
    'should return a translated string replacing parameters',
    () async {
      expect(
        appLocalizations.trans('greetings', params: {'name': 'Tester'}),
        'Oi! Tester',
      );
    },
  );

  test(
    'Should throw exception if key is null',
    () async {
      expect(
        () => appLocalizations.trans(null),
        throwsA(
          predicate((e) => e is ArgumentError && e.message == 'key is null'),
        ),
      );
    },
  );

  test(
    'Should throw exception if key is not found',
    () async {
      expect(
        () => appLocalizations.trans('NOT_FOUND'),
        throwsA(
          predicate((e) =>
              e is ArgumentError &&
              e.message == 'key: NOT_FOUND not found in pt.json'),
        ),
      );
    },
  );

  testWidgets('should return a instance using context',
      (WidgetTester tester) async {
    var localizedValues = await I18n('assets/i18n/').initializeI18n();
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(localizedValues),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: I18n.supportedLocales,
      locale: I18n.defaultLocale,
      home: Builder(builder: (BuildContext context) {
        AppLocalizations i18n = AppLocalizations.of(context);
        expect(i18n is AppLocalizations, true);
        return Container();
      }),
    ));
  });
}
