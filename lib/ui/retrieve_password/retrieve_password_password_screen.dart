// import 'package:baseproject/core/localizations/app_localizations.dart';
// import 'package:baseproject/core/util/validator.dart';
// import 'package:baseproject/ui/app_style.dart';
// import 'package:baseproject/ui/recover_password/screens/recover_password_new_password_confirmation_screen.dart';
// import 'package:baseproject/ui/shared/app_filled_button.dart';
// import 'package:baseproject/ui/shared/interpolated_text.dart';
// import 'package:baseproject/ui/shared/step_app_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class RetrievePasswordPasswordScreen extends StatefulWidget {
//   const RetrievePasswordPasswordScreen({
//     @required this.temporaryToken,
//   });

//   final String temporaryToken;

//   @override
//   State<StatefulWidget> createState() =>
//_RetrievePasswordPasswordScreenState();
// }

// class _RetrievePasswordPasswordScreenState
//     extends State<RetrievePasswordPasswordScreen> {
//   TextEditingController _inputController;
//   final _hintText = '••••••';

//   var _password = '';

//   bool _isPasswordValid() => Validator.password(_password);

//   Future<Object> get nextRoute => Navigator.pushNamed(
//         context,
//         RecoverPasswordNewPasswordConfirmationScreen.routeName,
//         arguments: RecoverPasswordNewPasswordConfirmationArguments(
//           verificationCode: widget.arguments.temporaryToken,
//           password: _password,
//         ),
//       );

//   @override
//   void initState() {
//     _inputController = TextEditingController(text: '');
//     super.initState();
//   }

//   @override
//   Widget build(final BuildContext context) {
//     final translator = AppLocalizations.of(context);
//     return Container(
//       color: Theme.of(context).primaryColor,
//       child: SafeArea(
//         child: Scaffold(
//           appBar: StepAppBar(
//             title: translator.trans('recoverPassword.newPasswordTitle'),
//             goBackLeading: true,
//           ),
//           body: SingleChildScrollView(
//             padding: const EdgeInsets.only(left: 32, right: 32),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Container(padding: const EdgeInsets.only(top: 6)),
//                 InterpolatedText(
//                   key: const Key('recoverPasswordNewPasswordSubtitleKey'),
//                   texts: [
//                     translator.trans('recoverPassword.new.subtitle.first'),
//                     translator.trans('recoverPassword.new.subtitle.second'),
//                     translator.trans('recoverPassword.new.subtitle.third'),
//                   ],
//                   textSize: 24,
//                   interpolationRule: (index) => index == 0,
//                   colorRule: (index) => AppStyle.secondary400,
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   translator.trans('recoverPassword.new.hint'),
//                   key: const Key('recoverPasswordNewPasswordHintKey'),
//                   style: const TextStyle(
//                       color: AppStyle.secondary300, fontSize: 20),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   key: const Key('recoverPasswordEmailScreenInputKey'),
//                   autofocus: true,
//                   enabled: true,
//                   controller: _inputController,
//                   obscureText: true,
//                   keyboardType: TextInputType.visiblePassword,
//                   onChanged: (text) => setState(() => _password = text),
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     hintText: _hintText,
//                     counterText: '',
//                     alignLabelWithHint: true,
//                     hintStyle: const TextStyle(
//                       fontSize: 24,
//                       color: AppStyle.secondary200,
//                       fontWeight: FontWeight.normal,
//                     ),
//                   ),
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     fontSize: 24,
//                     color: AppStyle.secondary500,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 Container(
//                   padding:
//                       const EdgeInsets.only(bottom: 24, left: 32, right: 32),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       AppFilledButton(
//                         hasDefaultPadding: false,
//                         widget: Text(
//                           translator.trans('generics.continue'),
//                           style: TextStyle(
//                             color: _isPasswordValid()
//                                 ? AppStyle.primary100
//                                 : AppStyle.secondary200,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         action: _isPasswordValid() ? () => nextRoute : null,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
