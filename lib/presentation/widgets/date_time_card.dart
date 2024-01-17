import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard(
      {super.key,
      required this.dateTime,
      this.onTap,
      required this.dateText,
      this.dateTimeTextStyle,
      this.dateTextStyle,
      this.borderColor,
      this.validator});
  final DateTime? dateTime;
  final void Function()? onTap;
  final String? dateText;
  final TextStyle? dateTimeTextStyle;
  final TextStyle? dateTextStyle;
  final Color? borderColor;
  final String? Function(DateTime?)? validator;
  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const halfSpace = Gap(6);
    return FormField<DateTime>(
      initialValue: dateTime,
      validator: validator,
      builder: (FormFieldState<DateTime> field) {
        final color = field.hasError ? Colors.red : manatee;
        return InkWell(
          onTap: onTap,
          child: Container(
              width: double.maxFinite,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  color: context.theme.scaffoldBackgroundColor,
                  border: Border.all(
                      color: borderColor ??
                          (dateTime != null
                              ? Colors.grey
                              : field.hasError
                                  ? Colors.red
                                  : Colors.transparent))),
              child: dateTime == null
                  ? Center(
                      child: Text(
                        'Tap to select date',
                        style: largeTextStyle?.copyWith(color: color),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                dateText == null
                                    ? 'Date'
                                    : '${dateText!.capitalize!} Date',
                                style: dateTextStyle ??
                                    mediumTextStyle?.copyWith(color: manatee)),
                            halfSpace,
                            Text(dateTime.formatDate(),
                                style: dateTimeTextStyle),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                dateText == null
                                    ? 'Time'
                                    : '${dateText!.capitalize!} Time',
                                style: dateTextStyle ??
                                    mediumTextStyle?.copyWith(color: manatee)),
                            halfSpace,
                            Text(dateTime.formatTime(),
                                style: dateTimeTextStyle),
                          ],
                        ),
                      ],
                    )),
        );
      },
    );
  }
}

class DateCard extends StatelessWidget {
  const DateCard(
      {super.key,
      required this.dateTime,
      this.onTap,
      required this.dateText,
      this.dateTimeTextStyle,
      this.dateTextStyle,
      this.borderColor,
      this.validator});
  final DateTime? dateTime;
  final void Function()? onTap;
  final String? dateText;
  final TextStyle? dateTimeTextStyle;
  final TextStyle? dateTextStyle;
  final Color? borderColor;
  final String? Function(DateTime?)? validator;

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final largeTextStyle = context.bodyLarge;
    return FormField<DateTime>(
      validator: validator,
      initialValue: dateTime,
      builder: (FormFieldState<DateTime> field) {
        final color = field.hasError ? Colors.red : manatee;
        return InkWell(
          onTap: onTap,
          child: Container(
              width: double.maxFinite,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  color: context.theme.scaffoldBackgroundColor,
                  border: Border.all(
                      color: borderColor ??
                          (dateTime != null
                              ? Colors.grey
                              : field.hasError
                                  ? Colors.red
                                  : Colors.transparent))),
              child: dateTime == null
                  ? Center(
                      child: Text(
                      'Tap to select date',
                      style: largeTextStyle?.copyWith(color: color),
                    ))
                  : Text(dateTime.formatDate(), style: dateTimeTextStyle)),
        );
      },
    );
  }
}
//
// String formatDate(DateTime? datetime) {
//   final format = StorageService.appSettings.dateFormatOptions;
//   if (datetime == null) {
//     return '';
//   }
//   return DateFormat(format.format()).format(datetime);
// }
//
// String formatTime(DateTime? datetime) {
//   final format = StorageService.appSettings.timeFormatOptions;
//   if (datetime == null) {
//     return '';
//   }
//   return DateFormat(format.format()).format(datetime);
// }
