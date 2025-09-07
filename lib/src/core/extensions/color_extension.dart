import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ColorContextEntension<T> on BuildContext {
// Color
// ===================================================================//
  Color getAlphaBlend(Color color) {
    final surfaceTint = Theme
        .of(this)
        .colorScheme
        .surfaceTint;
    final isLight = Theme
        .of(this)
        .brightness == Brightness.light;
    return Color.alphaBlend(surfaceTint.withAlpha(isLight ? 10 : 16), color);
  }
}