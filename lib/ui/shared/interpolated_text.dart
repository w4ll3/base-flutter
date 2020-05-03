import 'package:baseproject/ui/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef InterpolationRule = bool Function(int index);
typedef ColorRule = Color Function(int index);

class InterpolatedText extends StatelessWidget {
  const InterpolatedText({
    final Key key,
    @required this.texts,
    @required this.interpolationRule,
    @required this.textSize,
    this.colorRule,
  }) : super(key: key);

  final List<String> texts;
  final InterpolationRule interpolationRule;
  final double textSize;
  final ColorRule colorRule;

  List<TextSpan> _getTextSpans() {
    return texts
        .asMap()
        .map(
          (index, text) => MapEntry(
            index,
            TextSpan(
              text: text,
              style: TextStyle(
                fontWeight: interpolationRule(index)
                    ? FontWeight.normal
                    : FontWeight.bold,
                color: colorRule != null
                    ? colorRule(index)
                    : AppStyle.secondary500,
                fontSize: textSize,
                fontFamily: AppStyle.fontFamily,
              ),
            ),
          ),
        )
        .values
        .toList();
  }

  @override
  Widget build(final BuildContext context) {
    return RichText(
      key: const Key('interpolatedTextKey'),
      text: TextSpan(
        children: _getTextSpans(),
      ),
    );
  }
}
