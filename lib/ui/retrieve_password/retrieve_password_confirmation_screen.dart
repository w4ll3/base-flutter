// import 'package:baseproject/core/injection_container.dart' as di;
// import 'package:baseproject/core/localizations/app_localizations.dart';
// import 'package:baseproject/core/state/state_handler.dart';
// import 'package:baseproject/ui/app_style.dart';
// import 'package:baseproject/ui/recover_password/states/recover_password_state_manager.dart';
// import 'package:baseproject/ui/shared/app_filled_button.dart';
// import 'package:baseproject/ui/shared/interpolated_text.dart';
// import 'package:baseproject/ui/shared/step_app_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class RetrievePasswordConfirmationScreen extends StatefulWidget {
//   const RetrievePasswordConfirmationScreen({
//     @required this.verificationCode,
//     @required this.password,
//   });

//   final String verificationCode;
//   final String password;

//   @override
//   _RetrievePasswordConfirmationScreenState createState() =>
//       _RetrievePasswordConfirmationScreenState();
// }

// class _RetrievePasswordConfirmationScreenState
//     extends State<RetrievePasswordConfirmationScreen> {
//   final _stateHandler = di.sl<StateHandler>();
//   final _stateManager = di.sl<RecoverPasswordStateManager>();

//   final _inputController = TextEditingController();
//   final _hintText = '••••••';

//   var _newPasswordConfirmation = '';

//   bool _isPasswordValid() =>
//       _newPasswordConfirmation == widget.arguments.password;

//   @override
//   Widget build(BuildContext context) {
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
//             child: Padding(
//               padding: const EdgeInsets.only(left: 32, right: 32),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Container(padding: const EdgeInsets.only(top: 2)),
//                   InterpolatedText(
//                     key: const Key('recoverPasswordConfirmationSubtitleKey'),
//                     texts: [
//                       translator
//                         .trans('recoverPassword.newConfirm.subtitle.first'),
//                       translator
//                         .trans('recoverPassword.newConfirm.subtitle.second'),
//                       translator
//                         .trans('recoverPassword.newConfirm.subtitle.third'),
//                     ],
//                     textSize: 24,
//                     interpolationRule: (index) => index == 0,
//                     colorRule: (index) => AppStyle.secondary400,
//                   ),
//                   Text(
//                     translator.trans('recoverPassword.newConfirm.hint'),
//                     key: const Key('recoverPasswordConfirmationHintKey'),
//                     style: const TextStyle(
//                         color: AppStyle.secondary300, fontSize: 20),
//                   ),
//                   TextField(
//                     key: const Key('newPasswordConfirmationScreenInputKey'),
//                     autofocus: true,
//                     enabled: true,
//                     controller: _inputController,
//                     obscureText: true,
//                     keyboardType: TextInputType.visiblePassword,
//                     onChanged: (text) =>
//                         setState(() => _newPasswordConfirmation = text),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       hintText: _hintText,
//                       counterText: '',
//                       alignLabelWithHint: true,
//                       hintStyle: const TextStyle(
//                         fontSize: 24,
//                         color: AppStyle.secondary200,
//                         fontWeight: FontWeight.normal,
//                       ),
//                     ),
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       color: AppStyle.secondary500,
//                       fontWeight: FontWeight.w800,
//                     ),
//                   ),
//                   Container(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           bottom: 24, left: 32, right: 32),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           AppFilledButton(
//                             hasDefaultPadding: false,
//                             widget: Text(
//                               translator.trans('generics.finish'),
//                               style: TextStyle(
//                                 color: _isPasswordValid()
//                                     ? AppStyle.primary100
//                                     : AppStyle.secondary200,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             action: _isPasswordValid()
//                                 ? () => _sendNewPassword(context, translator)
//                                 : null,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _sendNewPassword(
//     final BuildContext context,
//     final AppLocalizations translator,
//   ) {
//     _stateHandler.showLoading(context);

//     _stateManager
//         .sendNewPassword(
//             widget.arguments.password, widget.arguments.verificationCode)
//         .then((result) async {
//       _stateHandler.hideLoading();

//       final foldedResult = result.fold(
//         (error) => error,
//         (routeName) => routeName,
//       );

//       if (result.isLeft()) {
//         _stateHandler.showAppDialog(
//           context: context,
//           description: foldedResult,
//         );
//         return;
//       }

//       _stateHandler.showAppDialog(
//         context: context,
//         title: translator.trans('recoverPassword.newConfirm.dialog.title'),
//     description: translator.trans('recoverPassword.newConfirm.dialog.desc'),
//         rightButtonText: translator.trans('default.dialog.neutralButton'),
//         rightButtonAction: () => Navigator.popUntil(
//           context,
//           (route) => route.isFirst,
//         ),
//       );
//     });
//   }
// }
