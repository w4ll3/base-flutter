import 'dart:ui';

import 'package:baseproject/core/localizations/i18n.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should return Locale(pt) as default locale',
    () async {
      expect(I18n.defaultLocale, equals(const Locale('pt')));
    },
  );

  test(
    'List of available languages should have at least one language',
    () async {
      expect(I18n.availableLanguages.length, greaterThanOrEqualTo(1));
      expect(I18n.supportedLocales.length, greaterThanOrEqualTo(1));
      expect(I18n.supportedLocales is Iterable<Locale>, true);
    },
  );

  test(
    'Should throw exception if  language file not found',
    () async {
      expect(
        () async => await I18n('path/not/exists').initializeI18n(),
        throwsA(isInstanceOf<Exception>()),
      );
    },
  );

  testWidgets(
    'Should return a map with at least one language',
    (WidgetTester tester) async {
      var result = await I18n('assets/i18n/').initializeI18n();
      bool isMap = result is Map;
      expect(isMap, true);
      expect(result.keys.length, greaterThanOrEqualTo(1));
    },
  );
}
