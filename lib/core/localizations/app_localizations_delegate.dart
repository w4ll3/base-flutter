import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'app_localizations.dart';
import 'i18n.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  AppLocalizationsDelegate(this.localizedValues);

  Map<String, Map<String, dynamic>> localizedValues;

  @override
  bool isSupported(Locale locale) =>
      I18n.availableLanguages.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(
      AppLocalizations(locale, localizedValues),
    );
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
