import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class LabeledNumericTextField extends StatelessWidget {
  const LabeledNumericTextField({
    super.key,
    required this.label,
    required this.controller,
    this.onPlusPressed,
    this.onMinusPressed,
    this.validator,
    this.hintText,
    this.width,
    this.required = false,
    this.prefixText,
    this.onTapOutside,
    this.inputFormatters,
    this.onChanged,
    this.keyboardType,
    this.noEndSpace = false,
    this.addOrSubtractValue = 1,
  });
  final TextEditingController controller;
  final void Function()? onPlusPressed;
  final void Function()? onMinusPressed;
  final double? width;
  final String? label;
  final String? hintText;
  final String? prefixText;
  final String? Function(String?)? validator;
  final bool required;
  final void Function(PointerDownEvent)? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final int addOrSubtractValue;
  final bool noEndSpace;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Row(
            children: [
              Flexible(child: Text(label!, style: mediumTextStyle!)),
              if (required)
                Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
            ],
          ),
        if (label != null) halfSpace,
        SizedBox(
          width: width,
          child: TextFormField(
            style: smallTextStyle,
            validator: validator,
            controller: controller,
            onTapOutside: onTapOutside,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType ?? TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (onMinusPressed != null)
                    IconButton(
                        onPressed: onMinusPressed ??
                            () {
                              int? stock = int.tryParse(
                                  controller.text.removeAllWhitespace);
                              if (stock != null &&
                                  stock != addOrSubtractValue) {
                                controller.text =
                                    (stock - addOrSubtractValue).toString();
                              }
                            },
                        icon: const Icon(Icons.remove)),
                  if (onPlusPressed != null)
                    IconButton(
                        // padding: EdgeInsets.zero,
                        onPressed: onPlusPressed ??
                            () {
                              int? stock = int.tryParse(
                                  controller.text.removeAllWhitespace);
                              if (stock != null) {
                                controller.text =
                                    (stock + addOrSubtractValue).toString();
                              } else {
                                controller.text = addOrSubtractValue.toString();
                              }
                            },
                        icon: const Icon(Icons.add)),
                ],
              ),
              hintText: hintText ?? '100...',
              prefixIcon: prefixText != null
                  ? Text(
                      prefixText!,
                      style: smallTextStyle?.copyWith(color: manatee),
                    )
                  : null,
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 0, minHeight: 0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
        if (!noEndSpace) space,
      ],
    );
  }
}
