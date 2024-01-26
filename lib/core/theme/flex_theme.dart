import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';


class FlexTheme {
  static ThemeData  light (
      FlexScheme colorScheme,
      bool useMaterial3,
      ) => FlexThemeData.light(
    useMaterial3: useMaterial3,
    scheme: colorScheme,
    subThemesData: const FlexSubThemesData(
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 4.0,
      inputDecoratorFocusedHasBorder: true,
      inputDecoratorUnfocusedHasBorder: true,
    ),
    blendLevel: 14,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.cabin().fontFamily,
    textTheme: GoogleFonts.cabinTextTheme().copyWith(
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
    ),
    typography: Typography.material2021(platform: defaultTargetPlatform),
  );

  // ========================================================================================== //
  static ThemeData dark (
      FlexScheme colorScheme,
      bool useMaterial3,
      ) => FlexThemeData.dark(
    useMaterial3: useMaterial3,
    // colors: FlexColor.schemes[colorScheme]?.light,
    scheme: colorScheme,
    subThemesData: const FlexSubThemesData(
      inputDecoratorBorderType: FlexInputBorderType.outline,
      inputDecoratorRadius: 4.0,
      inputDecoratorFocusedHasBorder: true,
      inputDecoratorUnfocusedHasBorder: true,
    ),
    blendLevel: 14,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    fontFamily: GoogleFonts.cabin().fontFamily,
    textTheme: GoogleFonts.cabinTextTheme().copyWith(
      headlineLarge: headlineLarge.dark(),
      headlineMedium: headlineMedium.dark(),
      headlineSmall: headlineSmall.dark(),
      bodyLarge: bodyLarge.dark(),
      bodyMedium: bodyMedium.dark(),
      bodySmall: bodySmall.dark(),
    ),
    typography: Typography.material2021(platform: defaultTargetPlatform),
  );

  // ========================================================================================== //

  // Headline 1
  // 34px Bold
  static final headlineLarge = GoogleFonts.cabin(fontSize: 34, color: Colors.black);

  // Headline 2
  // 28px Semi-bold
  static final headlineMedium = GoogleFonts.cabin(fontSize: 28, color: Colors.black);
  // Headline 3
  // 22px Medium
  static final headlineSmall = GoogleFonts.cabin(fontSize: 22, color: Colors.black);

  // Body 1
  // 17px Medium
  static final bodyLarge = GoogleFonts.cabin(fontSize: 17, color: Colors.black);

  // Body 2
  // 15px Medium
  static final bodyMedium = GoogleFonts.cabin(fontSize: 15, color: Colors.black);

  // Body 3
  // 13px Medium
  static final bodySmall = GoogleFonts.cabin(fontSize: 13, color: Colors.black);

}