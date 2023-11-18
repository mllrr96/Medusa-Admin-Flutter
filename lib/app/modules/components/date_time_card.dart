import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class DateTimeCard extends StatelessWidget {
  const DateTimeCard(
      {Key? key,
      required this.dateTime,
      this.onTap,
      required this.dateText,
      this.dateTimeTextStyle,
      this.dateTextStyle,
      this.borderColor})
      : super(key: key);
  final DateTime? dateTime;
  final void Function()? onTap;
  final String? dateText;
  final TextStyle? dateTimeTextStyle;
  final TextStyle? dateTextStyle;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const halfSpace = Gap(6);
    return InkWell(
      onTap: onTap,
      child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              color: context.theme.scaffoldBackgroundColor,
              border: Border.all(
                  color: borderColor ??
                      (dateTime != null ? Colors.grey : Colors.transparent))),
          child: dateTime == null
              ? Center(
                  child: Text(
                  dateText == null
                      ? 'Tap to select date'
                      : 'Tap to select ${dateText!.toLowerCase()} date',
                  style: largeTextStyle?.copyWith(color: lightWhite),
                ))
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
                                mediumTextStyle?.copyWith(color: lightWhite)),
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
                                mediumTextStyle?.copyWith(color: lightWhite)),
                        halfSpace,
                        Text(dateTime.formatTime(),
                            style: dateTimeTextStyle),
                      ],
                    ),
                  ],
                )),
    );
  }
}

class DateCard extends StatelessWidget {
  const DateCard(
      {Key? key,
      required this.dateTime,
      this.onTap,
      required this.dateText,
      this.dateTimeTextStyle,
      this.dateTextStyle,
      this.borderColor})
      : super(key: key);
  final DateTime? dateTime;
  final void Function()? onTap;
  final String? dateText;
  final TextStyle? dateTimeTextStyle;
  final TextStyle? dateTextStyle;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final largeTextStyle = context.bodyLarge;
    return InkWell(
      onTap: onTap,
      child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              color: context.theme.scaffoldBackgroundColor,
              border: Border.all(
                  color: borderColor ??
                      (dateTime != null ? Colors.grey : Colors.transparent))),
          child: dateTime == null
              ? Center(
                  child: Text(
                  dateText == null
                      ? 'Tap to select date'
                      : 'Tap to select ${dateText!.toLowerCase()} date',
                  style: largeTextStyle?.copyWith(color: lightWhite),
                ))
              : Text(dateTime.formatDate(),
                  style: dateTimeTextStyle)),
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
