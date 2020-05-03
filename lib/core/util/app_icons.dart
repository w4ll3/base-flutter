import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const arrowUp = 'assets/icons/arrow_up.svg';
  static const arrowDown = 'assets/icons/arrow_down.svg';
  static const arrowLeft = 'assets/icons/arrow_left.svg';
  static const arrowRight = 'assets/icons/arrow_right.svg';
  static const arrowRightSimple = 'assets/icons/arrow_right_simple.svg';
  static const arrowRightUseTerms = 'assets/icons/arrow_right_use_terms.svg';
  static const calendar = 'assets/icons/calendar.svg';
  static const close = 'assets/icons/close.svg';
  static const eyeHide = 'assets/icons/eye_hide.svg';
  static const eyeShow = 'assets/icons/eye_show.svg';
  static const logout = 'assets/icons/logout.svg';
  static const info = 'assets/icons/info.svg';
  static const contacts = 'assets/icons/contacts.svg';
  static const marker = 'assets/icons/marker.svg';
  static const lock = 'assets/icons/lock.svg';
  static const user = 'assets/icons/user.svg';
  static const backspaceArrow = 'assets/icons/backspace_arrow.svg';
  static const profileIcon = 'assets/icons/profile_icon.svg';
  static const logo = 'assets/logo.svg';
  static const availableDiscounts = 'assets/icons/available_discounts.svg';
  static const myPostpones = 'assets/icons/my_postpones.svg';
  static const otherOptions = 'assets/icons/other_options.svg';
  static const renegotiation = 'assets/icons/renegotiation.svg';
  static const substract = 'assets/icons/substract.svg';
  static const changePassword = 'assets/icons/changePassword.svg';
  static const changeSafetyPin = 'assets/icons/changeSafetyPin.svg';
}

class AppIconWidget extends StatelessWidget {
  const AppIconWidget(
    this.icon, {
    this.key,
    this.fit,
    this.color,
    this.width = 18.0,
    this.height = 18.0,
  }) : super(key: key);

  @override
  final Key key;
  final String icon;
  final BoxFit fit;
  final Color color;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: fit ?? BoxFit.cover,
      color: color,
      width: width,
      height: height,
    );
  }
}
