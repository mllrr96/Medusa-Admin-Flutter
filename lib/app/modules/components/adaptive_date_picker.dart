import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'adaptive_button.dart';

Future<DateTime?> adaptiveDateTimePicker({DateTime? date, required BuildContext context}) async {
  DateTime? selectedDate;
  if (Platform.isIOS) {
    return await showCupertinoModalBottomSheet(
      // isDismissible: false,
        context: context,
        builder: (context) {
          return SizedBox(
            height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AdaptiveButton(onPressed: () => Get.back(), child: const Text('Cancel')),
                    AdaptiveButton(
                        onPressed: () => Get.back(
                          result: selectedDate ?? date ?? DateTime.now(),
                        ),
                        child: const Text('Done')),
                  ],
                ),
                Flexible(
                  child: CupertinoDatePicker(
                    initialDateTime: date,
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
    return await showDatePicker(
        context: context,
        initialDate: date ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)))
        .then((value) async {
      if (value != null) {
        final time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay(hour: date?.hour ?? value.hour, minute: date?.minute ?? value.minute));
        if (time != null) {
          return DateTime(value.year, value.month, value.day, time.hour, time.minute);
        }
      }
      return null;
    });
  }
}
