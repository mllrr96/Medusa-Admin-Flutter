import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<DateTime?> adaptiveDateTimePicker(
    {DateTime? date,
    required BuildContext context,
    CupertinoDatePickerMode pickerMode = CupertinoDatePickerMode.dateAndTime,
    bool? forceAndroidPicker}) async {
  DateTime? selectedDate;
  final useAndroidPicker =
      forceAndroidPicker ?? PreferenceService.appSettingsGetter.useAndroidPicker;
  if (Platform.isIOS && !useAndroidPicker) {
    return await showCupertinoModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () => context.popRoute(),
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () => context
                            .popRoute(selectedDate ?? date ?? DateTime.now()),
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
        context: context,
        initialDate: date ?? DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 360)),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    Future<TimeOfDay?> timePicker(DateTime dateTime) async =>
        await showTimePicker(
            context: context, initialTime: TimeOfDay.fromDateTime(dateTime));

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

            selectedDate = DateTime(dateTime.year, dateTime.month, dateTime.day,
                timeOfDay.hour, timeOfDay.minute);
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
