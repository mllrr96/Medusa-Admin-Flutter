import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

class ProductGeneralInformation extends StatefulWidget {
  const ProductGeneralInformation({
    super.key,
    this.onSaved,
    this.controller,
    this.product,
  });
  final void Function(Product product)? onSaved;
  final FlexExpansionTileController? controller;
  final Product? product;

  @override
  State<ProductGeneralInformation> createState() =>
      _ProductGeneralInformationState();
}

class _ProductGeneralInformationState extends State<ProductGeneralInformation> {
  final titleCtrl = TextEditingController();
  final subtitleCtrl = TextEditingController();
  final handleCtrl = TextEditingController();
  final materialCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  bool discountable = false;
  final key = GlobalKey();

  @override
  void initState() {
    if (widget.product != null) {
      titleCtrl.text = widget.product!.title;
      subtitleCtrl.text = widget.product!.subtitle ?? '';
      handleCtrl.text = widget.product!.handle;
      materialCtrl.text = widget.product!.material ?? '';
      descriptionCtrl.text = widget.product!.description ?? '';
      discountable = widget.product!.discountable;
    }
    super.initState();
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    subtitleCtrl.dispose();
    handleCtrl.dispose();
    materialCtrl.dispose();
    descriptionCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return FlexExpansionTile(
      controller: widget.controller,
      key: key,
      title: const Text('General Information'),
      maintainState: true,
      onExpansionChanged: (expanded) async {
        if (expanded) {
          await key.currentContext.ensureVisibility();
        }
      },
      child: Column(
        children: [
          Text('To start selling, all you need is a name and a price.',
              style: smallTextStyle!.copyWith(color: manatee)),
          space,
          LabeledTextField(
            label: 'Title',
            hintText: 'Winter Jacket',
            controller: titleCtrl,
            onSaved: (title) {
              widget.onSaved?.call(Product(
                title: titleCtrl.text,
                subtitle: subtitleCtrl.text.isEmpty ? null : subtitleCtrl.text,
                handle: handleCtrl.text ?? '',
                material: materialCtrl.text.isEmpty ? null : materialCtrl.text,
                description:
                    descriptionCtrl.text.isEmpty ? null : descriptionCtrl.text,
                discountable: discountable,
                id: '',
                isGiftcard: false,
                status: ProductStatus.draft,
              ));
            },
            required: true,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Title is required';
              }
              return null;
            },
          ),
          LabeledTextField(
              label: 'Subtitle',
              hintText: 'Warm and cozy...',
              controller: subtitleCtrl),
          Text(
              'Give your product a short and clear title.\n50-60 characters is the recommended length for search engines.',
              style: smallTextStyle.copyWith(color: manatee)),
          space,
          LabeledTextField(
              label: 'Handle',
              hintText: '/winter-jacket',
              controller: handleCtrl),
          LabeledTextField(
              label: 'Material',
              hintText: '100% cotton',
              controller: materialCtrl),
          LabeledTextField(
            label: 'Description',
            hintText: 'A warm and cozy jacket...',
            minLines: 4,
            maxLines: null,
            controller: descriptionCtrl,
            textInputAction: TextInputAction.done,
          ),
          Text(
              'Give your product a short and clear description.\n120-160 characters is the recommended length for search engines.',
              style: smallTextStyle.copyWith(color: manatee)),
          space,
          SwitchListTile.adaptive(
            value: discountable,
            activeColor: Platform.isIOS ? ColorManager.primary : null,
            onChanged: (val) {
              setState(() => discountable = val);
            },
            contentPadding: EdgeInsets.zero,
            title: Text('Discountable', style: largeTextStyle),
            subtitle: Text(
                'When unchecked discounts will not be applied to this product.',
                style: smallTextStyle.copyWith(color: manatee)),
          ),
        ],
      ),
    );
  }
}
