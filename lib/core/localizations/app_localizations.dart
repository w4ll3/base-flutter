import 'dart:convert';

import 'package:baseproject/core/util/nested_json_parser.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale, this.localizedValues);

  final Map<String, Map<String, dynamic>> localizedValues;
  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String trans(
    String key, {
    Map<String, String> params,
    String defaultValue,
  }) {
    if (key == null) return null;

    if (key[0] == '^') {
      params = Map<String, String>.from(jsonDecode(key.split('|').last));
      key = key.substring(1).split('|')[0];
    }

    String languageCode = locale.languageCode;
    String localizedValue = NestedJsonParser.resolve<String>(
      json: localizedValues[languageCode],
      path: key,
      defaultValue: defaultValue,
    );

    if (localizedValue == null) {
      return throw ArgumentError(
          '''A chave: $key não foi encontrada no arquivo $languageCode.json''');
    }

    if (params != null) {
      params.forEach((key, value) {
        localizedValue = localizedValue.replaceAll('{{$key}}', value);
      });
    }

    return localizedValue;
  }
}
