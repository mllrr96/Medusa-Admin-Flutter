import 'package:flutter/material.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';

extension ThemeModeIcon on ThemeMode{
  IconData get icon{
    switch(this){
      case ThemeMode.system:
        return Icons.brightness_auto;
      case ThemeMode.light:
        return MedusaIcons.sun;
      case ThemeMode.dark:
        return MedusaIcons.moon;
    }
  }
}