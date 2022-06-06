import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: kBlack),
            centerTitle: false,
            elevation: 0,
            backgroundColor: kWhite,
            titleTextStyle: TextStyle(color: kText2Color, fontSize: 14)),
        scaffoldBackgroundColor: kScaffoldBgColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedItemColor: kText1Color,
          selectedItemColor: kPrimaryColor,
          type: BottomNavigationBarType.fixed,
        ),);
  }
}
