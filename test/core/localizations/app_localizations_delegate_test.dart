import 'package:baseproject/core/localizations/app_localizations_delegate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'should return false on try reload the de delegate',
    () async {
      AppLocalizationsDelegate delegate = AppLocalizationsDelegate({});

      expect(delegate.shouldReload(delegate), false);
    },
  );
}
