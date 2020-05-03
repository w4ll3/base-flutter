import 'package:baseproject/ui/app_style.dart';
import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    @required this.widget,
    this.action,
    this.width = double.infinity,
    this.color,
    this.borderRadius,
    key,
  }) : super(key: key);

  final Function action;
  final Widget widget;
  final double width;
  final Color color;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      key: const Key('appFilledButtonKey'),
      onPressed: action,
      color: color ?? AppStyle.primary500,
      textColor: AppStyle.primary100,
      disabledColor: AppStyle.secondary100,
      disabledTextColor: AppStyle.secondary200,
      child: Center(child: widget),
    );
  }
}
