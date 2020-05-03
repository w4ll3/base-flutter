import 'package:baseproject/core/util/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class AppAlert extends StatelessWidget {
  const AppAlert({
    @required this.textColor,
    @required this.backgroundColor,
    @required this.text,
    @required this.isVisible,
  });

  final Color textColor;
  final Color backgroundColor;
  final String text;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SizedBox(
        key: const Key('appAlertKey'),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 1,
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 36,
                right: 36,
                top: 16,
                bottom: 16,
              ),
              child: Row(
                children: <Widget>[
                  AppIconWidget(
                    AppIcons.info,
                    color: textColor,
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        text,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
