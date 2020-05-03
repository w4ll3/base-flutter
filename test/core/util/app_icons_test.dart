import 'package:baseproject/core/util/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('all icons rendered', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.redAccent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                AppIconWidget(
                  AppIcons.arrowDown,
                  key: Key('arrowDown'),
                ),
                AppIconWidget(
                  AppIcons.arrowLeft,
                  key: Key('arrowLeft'),
                ),
                AppIconWidget(
                  AppIcons.arrowRight,
                  key: Key('arrowRight'),
                ),
                AppIconWidget(
                  AppIcons.arrowUp,
                  key: Key('arrowUp'),
                ),
                AppIconWidget(
                  AppIcons.calendar,
                  key: Key('calendar'),
                ),
                AppIconWidget(
                  AppIcons.close,
                  key: Key('close'),
                ),
                AppIconWidget(
                  AppIcons.eyeHide,
                  key: Key('eyeHide'),
                ),
                AppIconWidget(
                  AppIcons.eyeShow,
                  key: Key('eyeShow'),
                ),
                AppIconWidget(
                  AppIcons.logout,
                  key: Key('logout'),
                ),
                AppIconWidget(
                  AppIcons.profileIcon,
                  key: Key('profileIcon'),
                ),
              ],
            ),
          ),
        ),
      ),
    ));

    var arrowDown = find.byKey(const Key('arrowDown'));
    var arrowLeft = find.byKey(const Key('arrowLeft'));
    var arrowRight = find.byKey(const Key('arrowRight'));
    var arrowUp = find.byKey(const Key('arrowUp'));
    var calendar = find.byKey(const Key('calendar'));
    var close = find.byKey(const Key('close'));
    var eyeHide = find.byKey(const Key('eyeHide'));
    var eyeShow = find.byKey(const Key('eyeShow'));
    var logout = find.byKey(const Key('logout'));
    var profileIcon = find.byKey(const Key('profileIcon'));
    expect(arrowDown, findsOneWidget);
    expect(arrowLeft, findsOneWidget);
    expect(arrowRight, findsOneWidget);
    expect(arrowUp, findsOneWidget);
    expect(calendar, findsOneWidget);
    expect(close, findsOneWidget);
    expect(eyeHide, findsOneWidget);
    expect(eyeShow, findsOneWidget);
    expect(logout, findsOneWidget);
    expect(profileIcon, findsOneWidget);
  });
}
