import 'package:auto_route/auto_route.dart';
import 'package:baseproject/core/error/failures.dart';
import 'package:baseproject/core/router/router.gr.dart';

class DialogInfo<T> {
  DialogInfo({
    String description,
    String title,
    String rightButtonText,
    Function rightButtonAction,
    String leftButtonText,
    Function leftButtonAction,
    this.doAfterPop,
    this.barrierDismissible = true,
  })  : title = title ?? _getTitle<T>(),
        description = description ?? _getDescription<T>(),
        rightButtonText = rightButtonText ?? _getRightText<T>(),
        rightButtonAction = rightButtonAction ?? _getRightAction<T>(),
        leftButtonText = leftButtonText ?? _getLeftText<T>(),
        leftButtonAction = leftButtonAction ?? _getLeftAction<T>();
  final String description;
  final String title;
  final String rightButtonText;
  final Function rightButtonAction;
  final String leftButtonText;
  final Function leftButtonAction;
  final Function doAfterPop;
  final bool barrierDismissible;

  static String _getTitle<T>() {
    switch (T) {
      case RequestTimeout:
        return 'dialog.timeout.title';
      case NoConnectionFailure:
        return 'dialog.connection.title';
      default:
        return 'dialog.generic.title';
    }
  }

  static String _getDescription<T>() {
    switch (T) {
      case RequestTimeout:
        return 'dialog.timeout.description';
      case NoConnectionFailure:
        return 'dialog.connection.description';
      default:
        return 'dialog.generic.description';
    }
  }

  static Function _getRightAction<T>() {
    switch (T) {
      case NoConnectionFailure:
      case RequestTimeout:
      default:
        return () => ExtendedNavigator.ofRouter<Router>().pop();
    }
  }

  static Function _getLeftAction<T>() {
    switch (T) {
      case NoConnectionFailure:
      case RequestTimeout:
        return () => ExtendedNavigator.ofRouter<Router>().pop();
      default:
        return null;
    }
  }

  static String _getRightText<T>() {
    switch (T) {
      case RequestTimeout:
      case NoConnectionFailure:
        return 'dialog.generic.actions.retry.right';
      default:
        return 'dialog.generic.actions.default';
    }
  }

  static String _getLeftText<T>() {
    switch (T) {
      case RequestTimeout:
      case NoConnectionFailure:
        return 'dialog.generic.actions.retry.left';
      default:
        return null;
    }
  }

  static DialogInfo handleFailure(Failure failure) {
    switch (failure.runtimeType) {
      case RequestTimeout:
        return DialogInfo<RequestTimeout>();
      case NoConnectionFailure:
        return DialogInfo<NoConnectionFailure>();
      default:
        return DialogInfo();
    }
  }
}
