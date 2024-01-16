import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ColorManager {
  static Color primary = const Color(0xFF8B5DF6);
  // static Color primaryAlt = const Color(0xFF7C3AED);
  static Color primaryDark = const Color(0xFF7C3AED);
  // static Color primary = const Color(0xFF4A3298);
  static Color primaryOpacity = const Color(0xffDED6FF);
  static Color darkGrey = const Color(0xff4F4F4F);
  static Color white = const Color(0xffFFFFFF);
  static Color red = const Color(0xffFF7272);
  static Color background = const Color(0xffF2F2F2);
  static Color manatee = const Color(0xff8F959E);
  static Color lightGrey = const Color(0xff9E9E9E);
  static Color black = const Color(0xff000000);
  static Color blue = const Color(0xFF2196F3);

  // color whit opacity
  static Color grey1 = const Color(0xff707070);
  static Color grey2 = const Color(0xff797979);

  static Color getAvatarColor(String? email) {
    if (email == null || email.removeAllWhitespace.isEmpty) {
      return manatee;
    }
    var firstLetter = '';
    if (email.length > 1) {
      firstLetter = email.removeAllWhitespace[0];
    } else {
      firstLetter = email.removeAllWhitespace;
    }
    firstLetter = firstLetter.toLowerCase();
    switch (firstLetter) {
      case 'a' || '1':
        return Colors.redAccent;
      case 'b' || '2':
        return Colors.amber;
      case 'c' || '3':
        return Colors.orange;
      case 'd' || '4':
        return Colors.brown;
      case 'e' || '5':
        return Colors.teal;
      case 'f' || '6':
        return Colors.blue;
      case 'g' || '7':
        return Colors.black26;

      case 'h' || '8':
        return Colors.lime;

      case 'i' || '9':
        return Colors.yellowAccent;

      case 'j':
        return Colors.yellow;
      case 'k':
        return Colors.tealAccent;
      case 'l':
        return Colors.lightGreenAccent;
      case 'm':
        return Colors.lightGreen;
      case 'n':
        return Colors.pink;
      case 'o':
        return Colors.deepOrange;
      case 'p':
        return Colors.deepPurple;
      case 'q':
        return Colors.deepPurpleAccent;
      case 'r':
        return Colors.red;
      case 's':
        return Colors.cyan;
      case 't':
        return Colors.cyanAccent;
      case 'w':
        return Colors.grey;
      case 'x':
        return const Color(0xffFF7272);
      case 'y':
        return Colors.blueGrey;
      case 'z':
        return Colors.lightBlue;

      default:
        return manatee;
    }
  }
}

