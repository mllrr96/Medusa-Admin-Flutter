import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class AppTheme {
  static final light = ThemeData(
      useMaterial3: true,
      primaryColor: ColorManager.primary,
      cardColor: Colors.white,
      dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(color: Colors.black), contentTextStyle: TextStyle(color: Colors.black)),
      brightness: Brightness.light,
      listTileTheme: ListTileThemeData(
        textColor: Colors.black,
        titleTextStyle: GoogleFonts.cabin(color: Colors.black, fontSize: 16.0),
        subtitleTextStyle: GoogleFonts.cabin(color: Colors.black, fontSize: 14.0),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFFF2F2F7),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFFF2F2F7),
      // scaffoldBackgroundColor: const Color(0xFFF9FAFB),
      checkboxTheme: const CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
      // splashColor: GetPlatform.isIOS ? Colors.transparent : ColorManager.primary,
      splashColor: Colors.transparent,
      highlightColor: GetPlatform.isIOS ? Colors.transparent : ColorManager.primary.withOpacity(0.6),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: CupertinoColors.white,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: const Color(0xFF7D7E7D),
      ),

      appBarTheme: AppBarTheme(
        // elevation: 0.0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: CupertinoColors.white,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white),
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          primaryColor: ColorManager.primary,
        ),
        primaryColor: ColorManager.primary,
      ),

      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFFF2F2F7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      textTheme: GoogleFonts.cabinTextTheme().copyWith(
        displayLarge: GoogleFonts.cabin(color: Colors.black, fontSize: 26.0),
        bodyLarge: GoogleFonts.cabin(color: Colors.black, fontSize: 22.0),
        bodyMedium: GoogleFonts.cabin(color: Colors.black, fontSize: 20.0),

        titleLarge: GoogleFonts.cabin(color: Colors.black, fontSize: 18.0),
        titleMedium: GoogleFonts.cabin(color: Colors.black, fontSize: 16.0),
        titleSmall: GoogleFonts.cabin(color: Colors.black, fontSize: 14.0),
        // Search delegate text field
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorManager.primary, // This is a custom color variable
        ),
      ),
      expansionTileTheme:
          const ExpansionTileThemeData(iconColor: Colors.black, backgroundColor: CupertinoColors.white));

  static final dark = ThemeData(
      useMaterial3: true,
      primaryColor: ColorManager.primary,
      brightness: Brightness.dark,
      listTileTheme: ListTileThemeData(
        textColor: Colors.white,
        titleTextStyle: GoogleFonts.cabin(color: Colors.white, fontSize: 16.0),
        subtitleTextStyle: GoogleFonts.cabin(color: Colors.white, fontSize: 14.0),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xff242527),
      ),
      dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(color: Colors.white), contentTextStyle: TextStyle(color: Colors.white)),
      scaffoldBackgroundColor: const Color(0xFF18191A),
      checkboxTheme: const CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xff242527),
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: const Color(0xFF7D7E7D),
      ),
      cardColor: const Color(0xff242527),
      appBarTheme: AppBarTheme(
        // elevation: 0.0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: const Color(0xff242527),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primary,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.black),
      ),
      cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          primaryColor: ColorManager.primary,
        ),
        brightness: Brightness.dark,
        barBackgroundColor: const Color(0xff242527),
        primaryColor: ColorManager.primary,
      ),
      // splashColor: GetPlatform.isIOS ? Colors.transparent : ColorManager.primary,
      // highlightColor: GetPlatform.isIOS ? Colors.transparent : ColorManager.primary,
      splashColor: Colors.transparent,
      highlightColor: GetPlatform.isIOS ? Colors.transparent : ColorManager.primary.withOpacity(0.6),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Color(0xFF18191A),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      textTheme: GoogleFonts.cabinTextTheme().copyWith(
        displayLarge: GoogleFonts.cabin(color: Colors.white, fontSize: 26.0),
        bodyLarge: GoogleFonts.cabin(color: Colors.white, fontSize: 22.0),
        bodyMedium: GoogleFonts.cabin(color: Colors.white, fontSize: 20.0),
        titleLarge: GoogleFonts.cabin(color: Colors.white, fontSize: 18.0),
        titleMedium: GoogleFonts.cabin(color: Colors.white, fontSize: 16.0),
        titleSmall: GoogleFonts.cabin(color: Colors.white, fontSize: 14.0),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorManager.primary, // This is a custom color variable
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(iconColor: Colors.white, backgroundColor: Color(0xff242527)));
}

ButtonThemeData buttonTheme() {
  return ButtonThemeData(
    shape: const StadiumBorder(),
    disabledColor: ColorManager.grey1,
    buttonColor: ColorManager.primary,
    splashColor: ColorManager.primary,
  );
}

CardTheme cardTheme() {
  return CardTheme(
    color: ColorManager.white,
    shadowColor: ColorManager.white,
    elevation: 0.4,
  );
}
