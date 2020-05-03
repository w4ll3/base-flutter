import 'dart:async' show Future;
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show ByteData, CachingAssetBundle, rootBundle;

class I18n {
  I18n(this.filePath);

  final String filePath;

  static List<String> get availableLanguages => ['pt'];

  static Locale get defaultLocale => const Locale('pt');

  static Iterable<Locale> get supportedLocales =>
      I18n.availableLanguages.map((language) => Locale(language, ''));

  Future<Map<String, Map<String, dynamic>>> initializeI18n() async {
    Map<String, Map<String, dynamic>> values = {};
    for (String language in availableLanguages) {
      Map<String, dynamic> translation =
          json.decode(await _loadJsonFromAsset(language));
      values[language] = _convertValueToString(translation);
    }
    return values;
  }

  Future<String> _loadJsonFromAsset(language) async {
    try {
      final bundle = _AssetBundle();
      return await bundle.loadString(filePath + language + '.json');
    } catch (e) {
      throw Exception(
          'Arquivo de tradução "$language" não encontrado na pasta $filePath');
    }
  }

  Map<String, dynamic> _convertValueToString(obj) {
    Map<String, dynamic> result = {};
    obj.forEach((key, value) {
      result[key] = value;
    });
    return result;
  }
}

class _AssetBundle extends CachingAssetBundle {
  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    final ByteData data = await load(key);
    if (data == null) {
      throw FlutterError('Não foi possível carregar arquivo de tradução');
    }
    return utf8.decode(data.buffer.asUint8List());
  }

  @override
  Future<ByteData> load(String key) async => rootBundle.load(key);
}
