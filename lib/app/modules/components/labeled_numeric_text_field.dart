import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class LabeledNumericTextField extends StatelessWidget {
  const LabeledNumericTextField({
    Key? key,
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
    this.onChanged, this.keyboardType,  this.noEndSpace = false, this.addOrSubtractValue = 1,
  }) : super(key: key);
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
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(label !=null)
        Row(
          children: [
            Flexible(child: Text(label!, style: mediumTextStyle!)),
            if (required) Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
          ],
        ),
        if(label !=null)
          halfSpace,
        SizedBox(
          width: width,
          child: TextFormField(
            style: smallTextStyle,
            validator: validator,
            controller: controller,

            onTapOutside: onTapOutside,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            keyboardType:keyboardType?? TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TODO: see if InkWell or GestureDetector is better than IconButton (too much padding, looks bad on small phones e.g. iPhone X)
                  IconButton(
                      onPressed: onMinusPressed ??
                              () {
                            int? stock = int.tryParse(controller.text.removeAllWhitespace);
                            if (stock != null && stock != addOrSubtractValue) {
                              controller.text = (stock - addOrSubtractValue).toString();
                            }
                          },
                      icon: const Icon(Icons.remove)),
                  IconButton(
                    // padding: EdgeInsets.zero,
                      onPressed: onPlusPressed ??
                              () {
                            int? stock = int.tryParse(controller.text.removeAllWhitespace);
                            if (stock != null) {
                              controller.text = (stock + addOrSubtractValue).toString();
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
              prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
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
        if(!noEndSpace)
        space,
      ],
    );
  }
}
