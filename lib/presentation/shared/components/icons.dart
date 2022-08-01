import 'dart:ui';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  // svg
  static String get category => "assets/svg/dashboard.svg";
  static String get search => "assets/svg/search.svg";
  // png
  // static String get logo => "assets/logo.png";
  static String get profile => "assets/profile.png";
  static String get home => "assets/home.png";
  static String get bag => "assets/bag.png";

  static svgAsset(
    String path, {
    double? width,
    double? height,
    Color? color,
  }) {
    return SvgPicture.asset(
      path,
      width: width ?? 24,
      height: height ?? 24,
      color: color,
    );
  }
}
