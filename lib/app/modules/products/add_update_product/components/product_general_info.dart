import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/colors.dart';

class ProductGeneralInformation extends StatelessWidget {
  const ProductGeneralInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text('General Information', style: Theme.of(context).textTheme.bodyLarge),
        initiallyExpanded: true,
        expandedAlignment: Alignment.centerLeft,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        children: [
          Text('To start selling, all you need is a name and a price.',
              style: smallTextStyle!.copyWith(color: lightWhite)),
          space,
          ProductTextField(
              label: 'Title', hintText: 'Winter Jacket', controller: TextEditingController(), required: true),
          ProductTextField(label: 'Subtitle', hintText: 'Warm and cozy...', controller: TextEditingController()),
          Text(
              'Give your product a short and clear title.\n50-60 characters is the recommended length for search engines.',
              style: smallTextStyle.copyWith(color: lightWhite)),
          space,
          ProductTextField(label: 'Handle', hintText: '/winter-jacket', controller: TextEditingController()),
          ProductTextField(label: 'Material', hintText: '100% cotton', controller: TextEditingController()),
          ProductTextField(
              label: 'Description',
              hintText: 'A warm and cozy jacket...',
              maxLines: null,
              controller: TextEditingController()),
          Text(
              'Give your product a short and clear description.\n120-160 characters is the recommended length for search engines.',
              style: smallTextStyle.copyWith(color: lightWhite)),
          space,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discountable', style: largeTextStyle),
              Switch.adaptive(activeColor: ColorManager.primary, value: true, onChanged: (val) {})
            ],
          ),
          Text('When unchecked discounts will not be applied to this product.',
              style: smallTextStyle.copyWith(color: lightWhite)),
        ],
      ),
    );
  }
}

class ProductTextField extends StatelessWidget {
  const ProductTextField({
    super.key,
    this.required = false,
    required this.label,
    required this.controller,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.hintText,
    this.maxLines = 1,
    this.onChanged,
    this.width,
    this.lightLabelColor = false,
    this.validator,
  });
  final bool required;
  final String label;
  final String? hintText;
  final int? maxLines;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  final double? width;
  final bool lightLabelColor;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    return Column(
      children: [
        Row(
          children: [
            Text(label, style: mediumTextStyle!.copyWith(color: lightLabelColor ? lightWhite : null)),
            if (required) Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 6.0),
        SizedBox(
          width: width,
          child: TextFormField(
            controller: controller,
            textInputAction: textInputAction,
            onChanged: onChanged,
            textCapitalization: textCapitalization,
            validator: validator,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: mediumTextStyle,
            decoration: InputDecoration(
              hintText: hintText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
