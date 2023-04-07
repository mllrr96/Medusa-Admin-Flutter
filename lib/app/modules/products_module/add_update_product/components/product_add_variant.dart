import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:medusa_admin/app/modules/products_module/add_update_product/components/product_general_info.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/utils/colors.dart';
import '../../../components/custom_text_field.dart';

class ProductAddVariant extends GetView<ProductAddVariantController> {
  const ProductAddVariant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final largeBodyTextStyle = Theme.of(context).textTheme.bodyLarge;
    final options = controller.product.options;
    const space = SizedBox(height: 12.0);
    const borderRadius = BorderRadius.all(Radius.circular(12.0));
    return Material(
      child: WillPopScope(
        onWillPop: () async {
          if (controller.editMode) {
            Get.back();
            return false;
          }

          if (!controller.shouldShowWarning()) {
            Get.back();
            return false;
          }
          final result = await showOkCancelAlertDialog(
              context: context,
              title: 'Discard changes?',
              message: 'Are you sure you want to discard changes?',
              isDestructiveAction: true);
          switch (result) {
            case OkCancelResult.ok:
              return true;
            case OkCancelResult.cancel:
              return false;
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const AdaptiveCloseButton(),
              title: Text(controller.editMode ? 'Update Attributes' : 'Create Variant'),
              actions: [
                AdaptiveButton(onPressed: () async => await controller.save(), child: const Text('Save')),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                controller: ModalScrollController.of(context),
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      if (!controller.editMode)
                        Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ClipRRect(
                            borderRadius: borderRadius,
                            child: ExpansionTile(
                              maintainState: true,
                              initiallyExpanded: true,
                              expandedAlignment: Alignment.centerLeft,
                              childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                              title: Row(
                                children: [
                                  Text('General', style: largeBodyTextStyle),
                                  const Text(' *', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                              children: [
                                Text('Configure the general information for this variant.',
                                    style: smallTextStyle!.copyWith(color: lightWhite)),
                                space,
                                CustomTextField(
                                  label: 'Custom title',
                                  controller: controller.customTitleCtrl,
                                  hintText: 'Green / XL',
                                ),
                                CustomTextField(
                                  label: 'Material',
                                  controller: controller.materialCtrl,
                                  hintText: '80% wool, 20% cotton',
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    Text('Options', style: largeTextStyle),
                                  ],
                                ),
                                space,
                                if (options != null)
                                  ListView.separated(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        final currentOption = options[index];
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(currentOption.title!, style: mediumTextStyle!),
                                                Text(' *', style: mediumTextStyle.copyWith(color: Colors.red)),
                                              ],
                                            ),
                                            const SizedBox(height: 6.0),
                                            DropdownButtonFormField(
                                              validator: (val) {
                                                if (val == null) {
                                                  return 'Field is required';
                                                }
                                                return null;
                                              },
                                              items: currentOption.values!
                                                  .map((e) => DropdownMenuItem(value: e, child: Text(e.value!)))
                                                  .toList(),
                                              hint: const Text('Choose an option'),
                                              onChanged: (value) {
                                                if (value != null) {
                                                  controller.selectedOptionsValue[index] = value;
                                                }
                                              },
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder: (_, __) => space,
                                      itemCount: options.length)
                              ],
                            ),
                          ),
                        ),
                      if (!controller.editMode) space,
                      if (!controller.editMode)
                        Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ClipRRect(
                            borderRadius: borderRadius,
                            child: ExpansionTile(
                              expandedAlignment: Alignment.centerLeft,
                              childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                              title: Text('Pricing', style: largeBodyTextStyle),
                              children: [
                                Text('Configure the pricing for this variant.',
                                    style: smallTextStyle!.copyWith(color: lightWhite)),
                                space,
                                ...controller.currencies.map((currency) {
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                          color: Theme.of(context).scaffoldBackgroundColor,
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Text(currency.code?.toUpperCase() ?? '', style: mediumTextStyle),
                                                  const SizedBox(width: 12.0),
                                                  Expanded(
                                                      child: Text(currency.name ?? '',
                                                          style: mediumTextStyle!.copyWith(color: lightWhite)))
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width / 3,
                                              child: TextField(
                                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                                decoration: InputDecoration(
                                                  suffixIcon: Padding(
                                                      padding: const EdgeInsets.only(right: 10),
                                                      child: Text(currency.symbol ?? '',
                                                          style: mediumTextStyle.copyWith(color: lightWhite))),
                                                  suffixIconConstraints:
                                                      const BoxConstraints(minWidth: 0, minHeight: 0),
                                                  hintText: '-',
                                                  border: const OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                                  ),
                                                ),
                                                style: smallTextStyle,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      space,
                                    ],
                                  );
                                }).toList()
                              ],
                            ),
                          ),
                        ),
                      if (!controller.editMode) space,
                      if (!controller.editMode)
                        Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ClipRRect(
                            borderRadius: borderRadius,
                            child: ExpansionTile(
                              maintainState: true,
                              expandedAlignment: Alignment.centerLeft,
                              childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                              title: Text('Stock & Inventory', style: largeBodyTextStyle),
                              children: [
                                Text('Configure the inventory and stock for this variant.',
                                    style: smallTextStyle!.copyWith(color: lightWhite)),
                                space,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Manage inventory', style: largeTextStyle),
                                    Obx(() {
                                      return Switch.adaptive(
                                        value: controller.manageInventory.value,
                                        onChanged: (val) {
                                          controller.manageInventory.value = val;
                                        },
                                        activeColor: ColorManager.primary,
                                      );
                                    })
                                  ],
                                ),
                                Text(
                                    'When checked Medusa will regulate the inventory when orders and returns are made.',
                                    style: smallTextStyle.copyWith(color: lightWhite)),
                                space,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Allow backorders', style: largeTextStyle),
                                    Obx(() {
                                      return Switch.adaptive(
                                          value: controller.allowBackorder.value,
                                          onChanged: (val) {
                                            controller.allowBackorder.value = val;
                                          },
                                          activeColor: ColorManager.primary);
                                    })
                                  ],
                                ),
                                Text(
                                    'When checked the product will be available for purchase despite the product being sold out',
                                    style: smallTextStyle.copyWith(color: lightWhite)),
                                space,
                                CustomTextField(
                                  label: 'Stock keeping unit (SKU)',
                                  controller: TextEditingController(),
                                  hintText: 'SUN-G, JK1234...',
                                ),
                                NumericTextField(
                                  controller: controller.quantityCtrl,
                                  label: 'Quantity in stock',
                                ),
                                space,
                                CustomTextField(
                                  label: 'EAN (Barcode)',
                                  controller: controller.eanCtrl,
                                  hintText: '123456789123...',
                                ),
                                CustomTextField(
                                  label: 'UPC (Barcode)',
                                  controller: controller.upcCtrl,
                                  hintText: '023456789104',
                                ),
                                CustomTextField(
                                  label: 'Barcode',
                                  controller: controller.barcodeCtrl,
                                  hintText: '123456789104...',
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (!controller.editMode) space,
                      EditCard(
                          label: controller.editMode ? 'Edit Attributes' : 'Shipping',
                          editMode: controller.editMode,
                          children: [
                            if (!controller.editMode)
                              Text(
                                  'Shipping information can be required depending on your shipping provider, and whether or not you are shipping internationally.',
                                  style: smallTextStyle!.copyWith(color: lightWhite)),
                            if (!controller.editMode) space,
                            Row(
                              children: [
                                Text('Dimensions', style: largeTextStyle),
                              ],
                            ),
                            space,
                            Text('Configure to calculate the most accurate shipping rates.',
                                style: smallTextStyle!.copyWith(color: lightWhite)),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NumericTextField(
                                    controller: controller.widthCtrl, label: 'Width', width: (Get.width - 55) / 2),
                                NumericTextField(
                                    controller: controller.lengthCtrl, label: 'Length', width: (Get.width - 55) / 2),
                              ],
                            ),
                            space,
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                NumericTextField(
                                    controller: controller.heightCtrl, label: 'Height', width: (Get.width - 55) / 2),
                                NumericTextField(
                                    controller: controller.weightCtrl, label: 'Weight', width: (Get.width - 55) / 2),
                              ],
                            ),
                            space,
                            space,
                            Row(
                              children: [
                                Text('Customs', style: largeTextStyle),
                              ],
                            ),
                            space,
                            Text('Configure if you are shipping internationally.',
                                style: smallTextStyle.copyWith(color: lightWhite)),
                            space,
                            CustomTextField(
                              label: 'MID Code',
                              controller: controller.midCtrl,
                              hintText: 'XDSKLAD9999...',
                            ),
                            CustomTextField(
                              label: 'HS Code',
                              controller: controller.hsCtrl,
                              hintText: 'BDJSK39277W...',
                            ),
                            CustomTextField(
                              label: 'Country of origin',
                              controller: controller.countryOfOriginCtrl,
                              hintText: 'Country of origin',
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductAddVariantController extends GetxController {
  ProductAddVariantController({required this.productsRepo});
  final ProductsRepo productsRepo;
  late Product product;
  late bool editMode;
  final quantityCtrl = TextEditingController();
  final customTitleCtrl = TextEditingController();
  final materialCtrl = TextEditingController();
  final heightCtrl = TextEditingController();
  final widthCtrl = TextEditingController();
  final weightCtrl = TextEditingController();
  final lengthCtrl = TextEditingController();
  final midCtrl = TextEditingController();
  final hsCtrl = TextEditingController();
  final countryOfOriginCtrl = TextEditingController();
  final skuCtrl = TextEditingController();
  final eanCtrl = TextEditingController();
  final upcCtrl = TextEditingController();
  final barcodeCtrl = TextEditingController();

  Map<int, ProductOptionValue> selectedOptionsValue = {};
  RxBool manageInventory = true.obs;
  RxBool allowBackorder = false.obs;
  final formKey = GlobalKey<FormState>();
  final List<Currency> currencies = StoreService.store.currencies ?? [];

  @override
  void onInit() {
    product = Get.arguments[0];
    editMode = Get.arguments[1] ?? false;
    if (editMode) {
      widthCtrl.text = product.width?.toString() ?? '';
      lengthCtrl.text = product.length?.toString() ?? '';
      heightCtrl.text = product.height?.toString() ?? '';
      weightCtrl.text = product.weight?.toString() ?? '';
      midCtrl.text = product.midCode ?? '';
      hsCtrl.text = product.hsCode ?? '';
      countryOfOriginCtrl.text = product.originCountry ?? '';
    }
    super.onInit();
  }

  bool shouldShowWarning() {
    if (customTitleCtrl.text.removeAllWhitespace.isNotEmpty ||
        materialCtrl.text.removeAllWhitespace.isNotEmpty ||
        selectedOptionsValue.isNotEmpty ||
        skuCtrl.text.removeAllWhitespace.isNotEmpty ||
        quantityCtrl.text.removeAllWhitespace.isNotEmpty ||
        eanCtrl.text.removeAllWhitespace.isNotEmpty ||
        upcCtrl.text.removeAllWhitespace.isNotEmpty ||
        barcodeCtrl.text.removeAllWhitespace.isNotEmpty ||
        widthCtrl.text.removeAllWhitespace.isNotEmpty ||
        lengthCtrl.text.removeAllWhitespace.isNotEmpty ||
        heightCtrl.text.removeAllWhitespace.isNotEmpty ||
        weightCtrl.text.removeAllWhitespace.isNotEmpty ||
        midCtrl.text.removeAllWhitespace.isNotEmpty ||
        hsCtrl.text.removeAllWhitespace.isNotEmpty ||
        countryOfOriginCtrl.text.removeAllWhitespace.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> save() async {
    if (editMode) {
      loading();
      final result = await productsRepo.update(
          product: Product(
        id: product.id!,
        status: product.status,
        discountable: product.discountable,
        weight: int.tryParse(weightCtrl.text),
        length: int.tryParse(lengthCtrl.text),
        height: int.tryParse(heightCtrl.text),
        width: int.tryParse(widthCtrl.text),
        midCode: midCtrl.text.removeAllWhitespace.isEmpty ? null : midCtrl.text,
        hsCode: hsCtrl.text.removeAllWhitespace.isEmpty ? null : hsCtrl.text,
        originCountry: countryOfOriginCtrl.text.removeAllWhitespace.isEmpty ? null : countryOfOriginCtrl.text,
      ));
      result.when((success) {
        EasyLoading.showSuccess('Attributes updated');
        Get.back(result: true);
      }, (error) => EasyLoading.showError('Error updating attributes'));
    } else {
      if (!formKey.currentState!.validate()) {
        return;
      }
      String variantTitle = '';
      List<ProductOptionValue> variantOptions = [];
      if (customTitleCtrl.text.removeAllWhitespace.isNotEmpty) {
        variantTitle = customTitleCtrl.text;
      } else {
        selectedOptionsValue.forEach((key, value) {
          variantOptions.add(value);
          if (variantTitle.isEmpty) {
            variantTitle = value.value!;
          } else {
            variantTitle = '$variantTitle / ${value.value!}';
          }
        });
      }
      Get.back(
        result: ProductVariant(
          prices: [],
          title: variantTitle,
          options: variantOptions,
          manageInventory: manageInventory.value,
          allowBackorder: allowBackorder.value,
          inventoryQuantity: int.tryParse(quantityCtrl.text),
          weight: int.tryParse(weightCtrl.text),
          length: int.tryParse(lengthCtrl.text),
          height: int.tryParse(heightCtrl.text),
          width: int.tryParse(widthCtrl.text),
          hsCode: hsCtrl.text.removeAllWhitespace.isEmpty ? null : hsCtrl.text,
          material: materialCtrl.text.removeAllWhitespace.isEmpty ? null : materialCtrl.text,
          sku: skuCtrl.text.removeAllWhitespace.isEmpty ? null : skuCtrl.text,
          ean: eanCtrl.text.removeAllWhitespace.isEmpty ? null : eanCtrl.text,
          upc: upcCtrl.text.removeAllWhitespace.isEmpty ? null : upcCtrl.text,
          barcode: barcodeCtrl.text.removeAllWhitespace.isEmpty ? null : barcodeCtrl.text,
          midCode: midCtrl.text.removeAllWhitespace.isEmpty ? null : midCtrl.text,
          originCountry: countryOfOriginCtrl.text.removeAllWhitespace.isEmpty ? null : countryOfOriginCtrl.text,
        ),
      );
    }
  }
}

class ProductAddVariantBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductAddVariantController(productsRepo: ProductsRepo()));
  }
}

class NumericTextField extends StatelessWidget {
  const NumericTextField({
    Key? key,
    required this.controller,
    this.onPlusPressed,
    this.onMinusPressed,
    required this.label,
    this.validator,
    this.hintText,
    this.width,
    this.required = false,
    this.prefixText,
    this.onTapOutside,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);
  final TextEditingController controller;
  final void Function()? onPlusPressed;
  final void Function()? onMinusPressed;
  final double? width;
  final String label;
  final String? hintText;
  final String? prefixText;
  final String? Function(String?)? validator;
  final bool required;
  final void Function(PointerDownEvent)? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(label, style: mediumTextStyle!),
            if (required) Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 6.0),
        SizedBox(
          width: width,
          child: TextFormField(
            style: smallTextStyle,
            validator: validator,
            controller: controller,
            onTapOutside: onTapOutside,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TODO: see if InkWell or GestureDetector is better than IconButton (too much padding, looks bad on small phones e.g. iPhone X)
                  IconButton(
                      onPressed: onMinusPressed ??
                          () {
                            int? stock = int.tryParse(controller.text.removeAllWhitespace);
                            if (stock != null && stock != 0) {
                              controller.text = (stock - 1).toString();
                            }
                          },
                      icon: const Icon(Icons.remove)),
                  IconButton(
                      // padding: EdgeInsets.zero,
                      onPressed: onPlusPressed ??
                          () {
                            int? stock = int.tryParse(controller.text.removeAllWhitespace);
                            if (stock != null) {
                              controller.text = (stock + 1).toString();
                            } else {
                              controller.text = 1.toString();
                            }
                          },
                      icon: const Icon(Icons.add)),
                ],
              ),
              hintText: hintText ?? '100...',
              prefixIcon: prefixText != null
                  ? Text(
                      prefixText!,
                      style: smallTextStyle?.copyWith(color: lightWhite),
                    )
                  : null,
              prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ),
      ],
    );
  }
}
