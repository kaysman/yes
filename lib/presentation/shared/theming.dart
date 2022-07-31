import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          headline1: GoogleFonts.poppins(
            color: kText1Color,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headline2: GoogleFonts.poppins(
            color: kText1Color,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          headline3: GoogleFonts.poppins(
            color: kText1Color,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          headline4: GoogleFonts.poppins(
            color: kText1Color,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          headline5: GoogleFonts.poppins(
            color: kText1Color,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          headline6: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: GoogleFonts.poppins(
            color: kText1Color,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyText2: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kText1Color,
          ),
          button: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
          ),
          subtitle1: GoogleFonts.poppins(
            fontSize: 16, // TextField text style uses this by default
            fontWeight: FontWeight.w400,
            color: kText1Color,
          ),
          subtitle2: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kGrey1Color,
          ),
          caption: GoogleFonts.poppins(
            color: kText1Color,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
