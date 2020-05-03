import 'package:baseproject/core/injection_container.dart';
import 'package:baseproject/core/util/mixins/intl_mixin.dart';
import 'package:baseproject/features/auth/domain/blocs/auth_bloc.dart';
import 'package:baseproject/ui/app_style.dart';
import 'package:baseproject/ui/shared/app_filled_button.dart';
import 'package:baseproject/ui/shared/interpolated_text.dart';
import 'package:baseproject/ui/shared/step_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPasswordScreen extends StatefulWidget {
  const LoginPasswordScreen();

  @override
  _LoginPasswordScreenState createState() => _LoginPasswordScreenState();
}

class _LoginPasswordScreenState extends State<LoginPasswordScreen>
    with IntlMixin {
  final AuthBloc _authBloc = sl();

  @override
  Widget build(final BuildContext context) {
    const _hintText = '••••••••••••';

    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: StepAppBar(
            title: translate('login.title'),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
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
                Container(padding: const EdgeInsets.only(top: 8)),
                InterpolatedText(
                  texts: [
                    translate('login.password.typePassword.first'),
                    translate('login.password.typePassword.second'),
                    translate('login.password.typePassword.third'),
                  ],
                  textSize: 24,
                  interpolationRule: (index) => index != 1,
                  colorRule: (index) => AppStyle.secondary400,
                ),
                Container(padding: const EdgeInsets.only(top: 0)),
                StreamBuilder(
                    stream: _authBloc.outPassword,
                    builder: (context, snapshot) {
                      return TextField(
                        key: const Key('loginPasswordScreenInputKey'),
                        onChanged: _authBloc.passwordChanged,
                        autofocus: true,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: _hintText,
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
                    })
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // InkWell(
                //   onTap: _authBloc.pushRetrievePassword,
                //   child: Center(
                //     child: Text(
                //       translate('login.password.retrievePassword'),
                //     ),
                //   ),
                // ),
                Container(padding: const EdgeInsets.only(top: 16)),
                StreamBuilder<Function>(
                    stream: _authBloc.outButton(context),
                    builder: (context, snapshot) {
                      return AppFilledButton(
                        widget: Text(
                          translate('login.password.enter'),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        action: snapshot.data,
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
