import 'package:baseproject/core/error/dialog_info.dart';
import 'package:baseproject/ui/shared/scalable_logo_animation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

mixin LoadingMixin {
  OverlayState _overlayState;
  OverlayEntry _overlayEntry;

  void handleFuture<T>(
    BuildContext context,
    Future<Either<DialogInfo, T>> future,
    Function(T) onComplete,
    Function(DialogInfo) ifLeft,
  ) async {
    FocusScope.of(context).requestFocus(FocusNode());
    show(context);

    await future.then((result) async {
      hide();

      final value = result.fold(
        (info) => info,
        (result) => result,
      );

      if (result.isLeft()) {
        ifLeft(value);
        return;
      }

      onComplete(value);
    });
  }

  void _dismissOverlay() {
    _overlayEntry?.remove();
  }

  void show(context) async {
    _overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Container(
        color: Colors.white.withOpacity(0.8),
        child: Container(
          padding: const EdgeInsets.only(bottom: 200),
          child: const Center(
            child: ScalableLogoAnimation(),
          ),
        ),
      ),
    );
    _overlayState.insert(_overlayEntry);
  }

  void hide() async {
    _dismissOverlay();
  }
}
