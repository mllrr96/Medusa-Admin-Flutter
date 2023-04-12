import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/colors.dart';

class ConfigSwitchTile extends StatelessWidget {
  const ConfigSwitchTile(
      {Key? key,
      this.onChanged,
      required this.title,
      required this.subtitle,
      required this.tileValue,
      this.titleStyle,
      this.subtitleStyle})
      : super(key: key);
  final String title, subtitle;
  final void Function(bool)? onChanged;
  final bool tileValue;
  final TextStyle? titleStyle, subtitleStyle;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: titleStyle ?? mediumTextStyle),
              Text(
                subtitle,
                style: subtitleStyle ?? smallTextStyle?.copyWith(color: lightWhite),
              ),
            ],
          ),
        ),
        Switch.adaptive(
          activeColor: ColorManager.primary,
          value: tileValue,
          onChanged: onChanged,
        )
      ],
    );
  }
}
