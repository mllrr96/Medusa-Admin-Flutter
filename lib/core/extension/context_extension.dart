import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
  ThemeData get theme => Theme.of(this);
  // ===================================================================//

  // media query
  // ===================================================================//
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  double get bottomViewPadding => MediaQuery.of(this).viewPadding.bottom;
  double get bottomViewInsetPadding => MediaQuery.of(this).viewInsets.bottom;
  double get topViewPadding => MediaQuery.of(this).viewPadding.top;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
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

extension DateTimePickerExtension on BuildContext {
  Future<DateTime?> adaptiveDateTimePicker(
      {DateTime? date,
      CupertinoDatePickerMode pickerMode = CupertinoDatePickerMode.dateAndTime,
      bool? forceAndroidPicker}) async {
    DateTime? selectedDate;
    final useAndroidPicker = forceAndroidPicker ??
        PreferenceService.appSettingsGetter.useAndroidPicker;
    if (Platform.isIOS && !useAndroidPicker) {
      return await showCupertinoModalBottomSheet(
          context: this,
          builder: (context) {
            return SizedBox(
              height: 300,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () => context.maybePop(),
                          child: const Text('Cancel')),
                      TextButton(
                          onPressed: () => context
                              .maybePop(selectedDate ?? date ?? DateTime.now()),
                          child: const Text('Done')),
                    ],
                  ),
                  Flexible(
                    child: CupertinoDatePicker(
                      initialDateTime: date,
                      mode: pickerMode,
                      onDateTimeChanged: (DateTime value) {
                        selectedDate = value;
                      },
                    ),
                  ),
                ],
              ),
            );
          });
    } else {
      Future<DateTime?> datePicker() async => await showDatePicker(
          context: this,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 360)),
          lastDate: DateTime.now().add(const Duration(days: 365)));
      Future<TimeOfDay?> timePicker(DateTime dateTime) async =>
          await showTimePicker(
              context: this, initialTime: TimeOfDay.fromDateTime(dateTime));

      switch (pickerMode) {
        case CupertinoDatePickerMode.dateAndTime:
          await datePicker().then((dateTime) async {
            if (dateTime == null) {
              return null;
            }
            await timePicker(dateTime).then((timeOfDay) {
              if (timeOfDay == null) {
                return;
              }

              selectedDate = DateTime(dateTime.year, dateTime.month,
                  dateTime.day, timeOfDay.hour, timeOfDay.minute);
            });
          });
          return selectedDate;
        case CupertinoDatePickerMode.date:
          await datePicker().then((dateTime) {
            if (dateTime == null) {
              return null;
            }
            selectedDate = dateTime;
          });
          return selectedDate;
        case CupertinoDatePickerMode.time:
          await timePicker(DateTime.now()).then((timeOfDay) {
            if (timeOfDay == null) {
              return null;
            }
            final now = DateTime.now();
            selectedDate = DateTime(
                now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
          });
          return selectedDate;
        case CupertinoDatePickerMode.monthYear:
          return null;
      }
    }
  }
}
