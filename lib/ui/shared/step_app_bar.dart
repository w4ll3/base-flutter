import 'package:auto_route/auto_route.dart';
import 'package:baseproject/core/router/router.gr.dart';
import 'package:baseproject/core/util/app_icons.dart';
import 'package:baseproject/ui/app_style.dart';
import 'package:flutter/material.dart';

class StepAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StepAppBar({
    @required this.title,
    this.actions = const [],
  });

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('stepAppBarKey'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: ExtendedNavigator.ofRouter<Router>().canPop()
                ? buildGoBackLeading(context)
                : null,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(children: actions),
            )
          ],
          title: Text(
            title,
            style: const TextStyle(
              color: AppStyle.secondary500,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);

  Widget buildGoBackLeading(context) {
    return IconButton(
      key: const Key('mainProfileScreenBackButton'),
      icon: const AppIconWidget(
        AppIcons.arrowLeft,
        color: AppStyle.secondary500,
        width: 32,
        height: 32,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
