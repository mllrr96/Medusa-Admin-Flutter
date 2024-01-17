import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextEntension<T> on BuildContext? {
  /// Scroll to current widget
  Future<void> ensureVisibility({Duration? delay}) async {
    if (this == null) return;
    await Future.delayed(delay ?? const Duration(milliseconds: 240))
        .then((value) async {
      await Scrollable.ensureVisible(this!,
          alignment: 0.04, duration: const Duration(milliseconds: 300));
    });
  }
}

extension BuildContextEntension<T> on BuildContext {
  // media query
  // ===================================================================//
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  double get bottomViewPadding => MediaQuery.of(this).viewPadding.bottom;
  double get bottomViewInsetPadding => MediaQuery.of(this).viewInsets.bottom;
  double get topViewPadding => MediaQuery.of(this).viewPadding.top;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  // ===================================================================//

  // TabsRouter get tabsRouter => AutoTabsRouter.of(this);
  // ===================================================================//
  int get activeIndex => AutoTabsRouter.of(this).activeIndex;

  // app localization
  // ===================================================================//
  AppLocalizations get tr => AppLocalizations.of(this)!;

  // Directionality
  // ===================================================================//
  bool get isRTL => Directionality.of(this) == TextDirection.rtl;

  /// Unfocus (Hides keyboard)
  // ===================================================================//
  void unfocus() => FocusScope.of(this).unfocus();

  // Drawer
  // ===================================================================//
  void openDrawer() => Scaffold.of(this).openDrawer();
  void closeDrawer() => Scaffold.of(this).closeDrawer();
  void openEndDrawer() => Scaffold.of(this).openEndDrawer();
  void closeEndDrawer() => Scaffold.of(this).closeEndDrawer();

  double get drawerEdgeDragWidth => MediaQuery.of(this).size.width / 2;
  // ===================================================================//

  // copy to clipboard
  // ===================================================================//
  Future<void> copyToClipboard(String data) async =>
      await Clipboard.setData(ClipboardData(text: data));
  // ===================================================================//


// ===================================================================//
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => Theme.of(this).brightness == Brightness.light;

  // System Ui overlay
  // ===================================================================//
  SystemUiOverlayStyle get defaultSystemUiOverlayStyle =>
      FlexColorScheme.themedSystemNavigationBar(
        this,
        systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground,
      );

  SystemUiOverlayStyle get systemUiOverlayNoAppBarStyle =>
      FlexColorScheme.themedSystemNavigationBar(
        this,
        noAppBar: true,
        systemNavBarStyle: FlexSystemNavBarStyle.scaffoldBackground,
      );
  // ===================================================================//

}






