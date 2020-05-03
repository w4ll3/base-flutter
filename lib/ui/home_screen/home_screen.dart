import 'package:baseproject/core/localizations/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppLocalizations _translator;

  @override
  Widget build(final BuildContext context) {
    _translator = AppLocalizations.of(context);
    return Scaffold(
      body: Container(
        color: Colors.green,
        child: Center(child: Text(_translator.trans('login.title'))),
      ),
    );
  }
}
