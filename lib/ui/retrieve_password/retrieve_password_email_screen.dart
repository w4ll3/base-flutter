// import 'package:baseproject/core/injection_container.dart' as di;
// import 'package:baseproject/core/localizations/app_localizations.dart';
// import 'package:baseproject/core/state/state_handler.dart';
// import 'package:baseproject/core/util/validator.dart';
// import 'package:baseproject/ui/Retrieve_password/screens/Retrieve_password_verification_code_screen.dart';
// import 'package:baseproject/ui/Retrieve_password/states/Retrieve_password_state_manager.dart';
// import 'package:baseproject/ui/app_style.dart';
// import 'package:baseproject/ui/shared/app_filled_button.dart';
// import 'package:baseproject/ui/shared/interpolated_text.dart';
// import 'package:baseproject/ui/shared/step_app_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class RetrievePasswordEmailScreen extends StatefulWidget {
//   const RetrievePasswordEmailScreen({
//     @required this.document,
//   });

//   final String document;

//   @override
//   _RetrievePasswordEmailScreenState createState() =>
//       _RetrievePasswordEmailScreenState();
// }

// class _RetrievePasswordEmailScreenState
//     extends State<RetrievePasswordEmailScreen> {
//   final _stateHandler = di.sl<StateHandler>();
//   final _stateManager = di.sl<RetrievePasswordStateManager>();

//   final _inputController = TextEditingController();

//   var _email = '';

//   bool _isEmailValid() => Validator.email(_email) && _email.length <= 100;

//   @override
//   Widget build(final BuildContext context) {
//     final translator = AppLocalizations.of(context);

//     return Container(
//       color: Theme.of(context).primaryColor,
//       child: SafeArea(
//         child: Scaffold(
//           appBar: StepAppBar(
//             title: translator.trans('RetrievePassword.title'),
//             goBackLeading: true,
//           ),
//           body: Padding(
//             padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 InterpolatedText(
//                   key: const Key('RetrievePasswordEmailKey'),
//                   texts: [
//                     translator.trans('RetrievePassword.email.first'),
//                     translator.trans('RetrievePassword.email.second'),
//                     translator.trans('RetrievePassword.email.third'),
//                   ],
//                   textSize: 24,
//                   interpolationRule: (index) => index != 1,
//                   colorRule: (index) => AppStyle.secondary400,
//                 ),
//                 const SizedBox(height: 36),
//                 TextField(
//                   inputFormatters: [
//                     BlacklistingTextInputFormatter(
//                       Validator.blockEmoji(),
//                     )
//                   ],
//                   key: const Key('RetrievePasswordEmailScreenInputKey'),
//                   autofocus: true,
//                   enabled: true,
//                   controller: _inputController,
//                   keyboardType: TextInputType.emailAddress,
//                   onChanged: (text) => setState(() => _email = text),
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     enabledBorder: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     hintText:
//                         translator.trans('RetrievePassword.email.inputHint'),
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
//                 )
//               ],
//             ),
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//           floatingActionButton: Padding(
//             padding: const EdgeInsets.only(bottom: 24, left: 32, right: 32),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 AppFilledButton(
//                   hasDefaultPadding: false,
//                   widget: Text(
//                     translator.trans('generics.continue'),
//                     style: TextStyle(
//                       color: _isEmailValid()
//                           ? AppStyle.primary100
//                           : AppStyle.secondary200,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   action: _isEmailValid()
//                       ? () => _sendVerificationCode(context)
//                       : null,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _sendVerificationCode(final BuildContext context) {
//     _stateHandler.showLoading(context);

//     _stateManager
//         .sendVerificationCode(widget.arguments.document, _email)
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

//       Navigator.pushNamed(
//         context,
//         foldedResult,
//         arguments: RetrievePasswordVerificationCodeArguments(
//           email: _email,
//           document: widget.arguments.document,
//         ),
//       );
//     });
//   }
// }
