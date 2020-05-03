import 'package:baseproject/core/localizations/app_localizations.dart';
import 'package:flutter/material.dart';

mixin IntlMixin<T extends StatefulWidget> on State<T> {
  Function(String) translate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    translate = AppLocalizations.of(context).trans;
  }
}
