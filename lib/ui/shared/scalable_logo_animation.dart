import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScalableLogoAnimation extends StatefulWidget {
  const ScalableLogoAnimation();
  @override
  _ScalableLogoAnimationState createState() => _ScalableLogoAnimationState();
}

class _ScalableLogoAnimationState extends State<ScalableLogoAnimation>
    with TickerProviderStateMixin {
  AnimationController scaleController;
  Animation<double> scaleAnimation;

  Tween<double> sizeTween = Tween<double>(begin: 0.4, end: 0.6);

  @override
  void initState() {
    super.initState();
    scaleController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    scaleAnimation =
        CurvedAnimation(parent: scaleController, curve: Curves.easeIn);

    scaleController.addListener(() {
      if (scaleController.status == AnimationStatus.completed) {
        sizeTween = Tween<double>(begin: 0.5, end: 0.6);
        scaleController.reverse();
      }

      if (scaleController.status == AnimationStatus.dismissed) {
        scaleController.forward();
      }
    });

    scaleController.forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) => Transform.scale(
        scale: sizeTween.evaluate(scaleAnimation),
        child: child,
      ),
      child: Image.asset(
        'assets/logo.png',
        scale: MediaQuery.of(context).devicePixelRatio,
      ),
    );
  }
}
