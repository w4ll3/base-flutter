import 'package:baseproject/ui/app_style.dart';
import 'package:flutter/material.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({
    Key key,
    @required this.current,
    @required this.maximum,
  })  : assert(
          current <= maximum,
          '''Progresso atual {$current} não pode ser maior que progresso máximo {$maximum}.''',
        ),
        super(key: key);

  final int current;
  final int maximum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child: LinearProgressIndicator(
        valueColor: const AlwaysStoppedAnimation<Color>(AppStyle.primary500),
        backgroundColor: Colors.transparent,
        value: current / maximum,
      ),
    );
  }
}
