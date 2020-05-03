import 'package:baseproject/core/util/mixins/intl_mixin.dart';
import 'package:baseproject/ui/app_style.dart';
import 'package:baseproject/ui/shared/app_filled_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatefulWidget {
  const AppDialog({
    Key key,
    @required this.title,
    @required this.description,
    @required this.rightButtonText,
    this.leftButtonText,
    this.rightButtonAction,
    this.leftButtonAction,
    this.buttonWidth = 67.0,
  }) : super(key: key);

  final String title;
  final String description;
  final String rightButtonText;
  final String leftButtonText;
  final Function rightButtonAction;
  final Function leftButtonAction;
  final double buttonWidth;

  @override
  _AppDialogState createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> with IntlMixin {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 8.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            const BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 24.0,
                left: 24.0,
                right: 24.0,
                bottom: 16.0,
              ),
              child: Text(
                translate(widget.title),
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF121212),
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              child: Text(
                translate(widget.description),
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.body2.copyWith(
                      fontSize: 16.0,
                      color: const Color(0xFF9E9E9E),
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  if (widget.leftButtonText != null &&
                      widget.leftButtonAction != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        onPressed: widget.leftButtonAction,
                        child: Text(
                          translate(widget.leftButtonText),
                          style: const TextStyle(
                            color: AppStyle.secondary300,
                          ),
                        ),
                      ),
                    ),
                  AppFilledButton(
                    width: widget.buttonWidth,
                    widget: Text(
                      translate(widget.rightButtonText),
                      style: const TextStyle(
                        color: AppStyle.primary100,
                      ),
                    ),
                    action: widget.rightButtonAction,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
