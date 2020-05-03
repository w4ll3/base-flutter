// import 'dart:async';

// import 'package:baseproject/core/injection_container.dart' as di;
// import 'package:baseproject/core/localizations/app_localizations.dart';
// import 'package:baseproject/core/state/state_handler.dart';
// import 'package:baseproject/ui/app_style.dart';
// import 'package:baseproject/ui/recover_password/screens/recover_password_new_password_screen.dart';
// import 'package:baseproject/ui/recover_password/states/recover_password_state_manager.dart';
// import 'package:baseproject/ui/shared/interpolated_text.dart';
// import 'package:baseproject/ui/shared/numpad.dart';
// import 'package:baseproject/ui/shared/step_app_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class RetrievePasswordTokenScreen extends StatefulWidget {
//   const RetrievePasswordTokenScreen({
//     @required this.email,
//     @required this.document,
//   });

//   final String email;
//   final String document;

//   @override
//   _RetrievePasswordTokenScreenState createState() =>
//       _RetrievePasswordTokenScreenState();
// }

// class _RetrievePasswordTokenScreenState
//     extends State<RetrievePasswordTokenScreen> {
//   final _stateManager = di.sl<RecoverPasswordStateManager>();
//   final _stateHandler = di.sl<StateHandler>();

//   final _maxLength = 5;
//   final _hintText = '•••••';

//   var _timeLeftToResend;
//   var _canResend = true;
//   Timer _resendTimer;
//   final _resendDelay = 120;

//   TextEditingController _inputController;

//   void _setInput(final String input) {
//     setState(() {
//       _inputController.text = input;
//     });
//   }

//   bool _isInputValid(final String input) {
//     if (input.length == _maxLength) {
//       return true;
//     }

//     return false;
//   }

//   String _getTranslatedText(
//     final AppLocalizations translator,
//     final String pathAfterPrefix,
//   ) {
//     return translator
//         .trans('recoverPassword.verificationCode.$pathAfterPrefix');
//   }

//   @override
//   void initState() {
//     _startResendTimer();
//     _inputController = TextEditingController(text: '');
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _resendTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(final BuildContext context) {
//     final translator = AppLocalizations.of(context);

//     return Container(
//       color: Theme.of(context).primaryColor,
//       child: SafeArea(
//         child: Scaffold(
//           appBar: StepAppBar(
//             title: translator.trans('recoverPassword.title'),
//             goBackLeading: true,
//           ),
//           body: Padding(
//             padding: const EdgeInsets.only(left: 32, right: 32),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 InterpolatedText(
//                 key: const Key('recoverPasswordVerificationCodeSubtitleKey'),
//                   texts: [
//                     _getTranslatedText(translator, 'subtitle.first'),
//                     _getTranslatedText(translator, 'subtitle.second'),
//                     _getTranslatedText(translator, 'subtitle.third'),
//                   ],
//                   textSize: 24,
//                   interpolationRule: (index) => index % 2 == 0,
//                   colorRule: (index) => AppStyle.secondary400,
//                 ),
//                 const SizedBox(height: 8),
//                 InterpolatedText(
//                   key: const Key('recoverPasswordVerificationCodeSentToKey'),
//                   texts: [
//                     translator
//                         .trans('recoverPassword.verificationCode.sentCode'),
//                     widget.arguments.email,
//                   ],
//                   textSize: 14,
//                   interpolationRule: (index) => index != 1,
//                   colorRule: (index) => AppStyle.secondary400,
//                 ),
//                 TextField(
//                   key: const Key('verificationCodeScreenInputKey'),
//                   controller: _inputController,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     hintText: _hintText,
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
//                   enabled: false,
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//           floatingActionButton: Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 8),
//                   child: _canResend
//                       ? GestureDetector(
//                           onTap: () => _resendCode(context, translator),
//                           child: Text(
//                             _getTranslatedText(translator, 'resend.label'),
//                           ),
//                         )
//                       : InterpolatedText(
//                           texts: [
//                             _getTranslatedText(
//                                 translator, 'resend.request.first'),
//                             '$_timeLeftToResend ',
//                             _timeLeftToResend == 1
//                                 ? _getTranslatedText(
//                                 translator, 'resend.request.secondSingular')
//                                 : _getTranslatedText(
//                                 translator, 'resend.request.secondPlural'),
//                           ],
//                           interpolationRule: (index) => index % 2 == 0,
//                           textSize: 14,
//                         ),
//                 ),
//                 Numpad(
//                   key: const Key('recoverPasswordVerificationCodeNumpadKey'),
//                   maxLength: _maxLength,
//                   onInputChanged: _setInput,
//                   isInputValid: _isInputValid,
//                   onConfirmPressed: (input) => _confirmVerificationCode(
//                     context,
//                     translator,
//                     verificationCode: input,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _confirmVerificationCode(
//     final BuildContext context,
//     final AppLocalizations translator, {
//     final String verificationCode,
//   }) {
//     _stateHandler.showLoading(context);

//     _stateManager
//         .confirmVerificationToken(verificationCode: verificationCode)
//         .then((result) async {
//       _stateHandler.hideLoading();

//       final foldedResult = result.fold((error) => error, (data) => data);

//       if (result.isLeft()) {
//         _stateHandler.showAppDialog(
//           context: context,
//           description: foldedResult,
//         );
//         return;
//       }

//       final data = foldedResult as RecoverPasswordData;

//       Navigator.pushNamed(
//         context,
//         data.routeName,
//         arguments: RecoverPasswordNewPasswordArguments(
//           temporaryToken: data.temporaryToken,
//         ),
//       );
//     });
//   }

//   void _resendCode(
//     final BuildContext context,
//     final AppLocalizations translator,
//   ) {
//     _stateHandler.showLoading(context);

//     _stateManager
//      .sendVerificationCode(widget.arguments.document, widget.arguments.email)
//         .then((result) async {
//       _stateHandler.hideLoading();

//       final foldedResult =
//           result.fold((error) => error, (routeName) => routeName);

//       if (result.isLeft()) {
//         _stateHandler.showAppDialog(
//           context: context,
//           description: foldedResult,
//         );
//         return;
//       }

//       _startResendTimer();
//       _stateHandler.showAppDialog(
//         context: context,
//         title:
//           translator.trans('recoverPassword.verificationCode.dialog.title'),
//         description:
//             translator.trans('recoverPassword.verificationCode.dialog.desc'),
//         rightButtonText: translator.trans('default.dialog.neutralButton'),
//       );
//     });
//   }

//   void _startResendTimer() {
//     setState(() {
//       _timeLeftToResend = _resendDelay;
//       _canResend = false;
//     });

//     _resendTimer = Timer.periodic(
//       const Duration(seconds: 1),
//       (final Timer timer) => setState(() {
//         if (_timeLeftToResend < 1) {
//           _timeLeftToResend = _resendDelay;
//           _canResend = true;
//           timer.cancel();
//         } else {
//           _timeLeftToResend--;
//         }
//       }),
//     );
//   }
// }
