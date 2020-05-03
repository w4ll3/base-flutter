import 'package:auto_route/auto_route.dart';
import 'package:baseproject/core/bloc/base_bloc.dart';
import 'package:baseproject/core/injection_container.dart';
import 'package:baseproject/core/router/router.gr.dart';
import 'package:baseproject/core/util/mixins/dialog_mixin.dart';
import 'package:baseproject/core/util/mixins/loading_mixin.dart';
import 'package:baseproject/core/util/mixins/validator_mixin.dart';
import 'package:baseproject/features/auth/data/entities/login_response.dart';
import 'package:baseproject/features/auth/domain/usecases/login.dart';
import 'package:baseproject/features/auth/domain/usecases/logout.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc
    with ValidatorMixin, LoadingMixin, DialogMixin
    implements BaseBloc {
  final Login _login = sl();
  final Logout _logout = sl();

  //Value getters
  String get username => _username.value;
  String get password => _password.value;

  //StreamsControllers
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //StreamsModifiers
  Function(String) get usernameChanged => _username.sink.add;
  Function(String) get passwordChanged => _password.sink.add;

  //StreamsValues
  Stream<String> get outUsername => _username.transform(emailValidator);
  Stream<String> get outPassword => _password.transform(
        lenghtValidator(
            min: ValidatorMixin.MIN_PW_LENGTH,
            max: ValidatorMixin.MAX_PW_LENGTH),
      );
  Stream<Function> outButton(BuildContext context) =>
      Rx.combineLatest2(outUsername, outPassword, (u, p) => true)
          .transform(actionValidator(finishLogin(context)));

  Function finishLogin(BuildContext context) {
    return () => handleFuture<LoginResponse>(
          context,
          _login(
            username: username,
            password: password,
          ),
          (result) => ExtendedNavigator.ofRouter<Router>().pushHomeScreen(),
          (info) => showAppDialog(context, info),
        );
  }

  void passwordPage() {
    ExtendedNavigator.ofRouter<Router>().pushLoginPasswordScreen();
  }

  void logout() => _logout();

  @override
  void dispose() {
    _username.close();
    _password.close();
  }
}
