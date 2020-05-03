import 'package:baseproject/core/error/dialog_info.dart';
import 'package:baseproject/ui/shared/app_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin DialogMixin {
  Future showAppDialog(
    BuildContext context,
    DialogInfo dialogInfo,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: dialogInfo.barrierDismissible,
      builder: (BuildContext context) => AppDialog(
        title: dialogInfo.title,
        description: dialogInfo.description,
        rightButtonText: dialogInfo.rightButtonText,
        rightButtonAction: dialogInfo.rightButtonAction,
        leftButtonText: dialogInfo.leftButtonText,
        leftButtonAction: dialogInfo.leftButtonAction,
      ),
    );
  }
}
