import 'package:baseproject/core/injection_container.dart';
import 'package:baseproject/core/util/mixins/intl_mixin.dart';
import 'package:baseproject/features/auth/domain/blocs/auth_bloc.dart';
import 'package:baseproject/ui/app_style.dart';
import 'package:baseproject/ui/shared/interpolated_text.dart';
import 'package:baseproject/ui/shared/step_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginDocumentScreen extends StatefulWidget {
  const LoginDocumentScreen();

  @override
  _LoginDocumentScreenState createState() => _LoginDocumentScreenState();
}

class _LoginDocumentScreenState extends State<LoginDocumentScreen>
    with IntlMixin {
  final AuthBloc _authBloc = sl();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: StepAppBar(
        title: translate('login.title'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InterpolatedText(
              texts: [
                translate('login.hello.first'),
                translate('login.hello.second'),
              ],
              textSize: 20,
              interpolationRule: (index) => index == 1,
              colorRule: (index) => AppStyle.secondary400,
            ),
            Container(padding: const EdgeInsets.only(top: 12)),
            InterpolatedText(
              texts: [
                translate('login.document.typeDocument.first'),
                translate('login.document.typeDocument.second'),
              ],
              textSize: 24,
              interpolationRule: (index) => index % 2 == 0,
              colorRule: (index) => AppStyle.secondary400,
            ),
            Container(padding: const EdgeInsets.only(top: 16)),
            StreamBuilder(
              stream: _authBloc.outUsername,
              builder: (context, snapshot) {
                return TextField(
                  key: const Key('loginDocumentScreenInputKey'),
                  onChanged: _authBloc.usernameChanged,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: translate('login.document.inputHint'),
                    errorText: translate(snapshot.error),
                    alignLabelWithHint: true,
                    hintStyle: const TextStyle(
                      fontSize: 24,
                      color: AppStyle.secondary200,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 24,
                    color: AppStyle.secondary500,
                    fontWeight: FontWeight.w800,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: StreamBuilder<String>(
        stream: _authBloc.outUsername,
        builder: (context, snapshot) {
          return FloatingActionButton(
            onPressed:
                (snapshot.hasError || (_authBloc.username?.length ?? 0) < 3)
                    ? null
                    : _authBloc.passwordPage,
            child: Icon(Icons.arrow_forward),
          );
        },
      ),
    );
  }
}
