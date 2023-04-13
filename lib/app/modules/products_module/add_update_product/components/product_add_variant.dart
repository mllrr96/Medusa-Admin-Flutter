import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/data/repository/product/products_repo.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../../core/utils/colors.dart';
import '../../../components/countries/view/country_view.dart';
import '../../../components/currency_formatter.dart';
import '../../../components/custom_expansion_tile.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/labeled_numeric_text_field.dart';

class ProductAddVariant extends GetView<ProductAddVariantController> {
  const ProductAddVariant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final options = controller.product.options;
    const space = SizedBox(height: 12.0);

    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then((value) async {
        final yPosition =
            (globalKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero).dy ?? 0.0;
        var topPadding = context.mediaQueryPadding.top + kToolbarHeight;
        final scrollPoint = controller.scrollController.offset + yPosition - topPadding;
        if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
          await controller.scrollController
              .animateTo(scrollPoint - 10, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        } else {
          await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
        }
      });
    }

    return WillPopScope(
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
              controller: controller.scrollController,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    if (!controller.editMode)
                      CustomExpansionTile(
                        initiallyExpanded: true,
                        required: true,
                        label: 'General',
                        children: [
                          Text('Configure the general information for this variant.',
                              style: smallTextStyle!.copyWith(color: lightWhite)),
                          space,
                          LabeledTextField(
                            label: 'Custom title',
                            controller: controller.customTitleCtrl,
                            hintText: 'Green / XL',
                          ),
                          LabeledTextField(
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
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                          ),
                                          filled: true,
                                          isDense: true,
                                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (_, __) => space,
                                itemCount: options.length),
                          space,
                        ],
                      ),
                    if (!controller.editMode) space,
                    if (!controller.editMode)
                      CustomExpansionTile(
                        key: controller.pricingKey,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.pricingKey);
                          }
                        },
                        label: 'Pricing',
                        childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                        children: [
                          Text('Configure the pricing for this variant.',
                              style: smallTextStyle!.copyWith(color: lightWhite)),
                          space,
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.currencies.length,
                              itemBuilder: (context, index) {
                                final currency = controller.currencies[index];
                                final currencyCtrl = controller.currencyCtrlMap[currency];
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
                                          Flexible(
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
                                          Flexible(
                                            child: TextField(
                                              controller: currencyCtrl,
                                              textDirection: TextDirection.rtl,
                                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                              inputFormatters: [CurrencyTextInputFormatter(name: currency.code)],
                                              decoration: InputDecoration(
                                                hintTextDirection: TextDirection.rtl,
                                                prefixIcon: Padding(
                                                    padding: const EdgeInsets.only(left: 10),
                                                    child: Text(currency.symbolNative ?? '',
                                                        style: mediumTextStyle.copyWith(color: lightWhite))),
                                                prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                                                hintText: '-',
                                                isDense: true,
                                                border: const OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
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
                              }),
                        ],
                      ),
                    if (!controller.editMode) space,
                    if (!controller.editMode)
                      CustomExpansionTile(
                        label: 'Stock & Inventory',
                        key: controller.stockKey,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await scrollToSelectedContent(globalKey: controller.stockKey);
                          }
                        },
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
                          Text('When checked Medusa will regulate the inventory when orders and returns are made.',
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
                          LabeledTextField(
                            label: 'Stock keeping unit (SKU)',
                            controller: TextEditingController(),
                            hintText: 'SUN-G, JK1234...',
                          ),
                          LabeledNumericTextField(
                            controller: controller.quantityCtrl,
                            label: 'Quantity in stock',
                          ),
                          space,
                          LabeledTextField(
                            label: 'EAN (Barcode)',
                            controller: controller.eanCtrl,
                            hintText: '123456789123...',
                          ),
                          LabeledTextField(
                            label: 'UPC (Barcode)',
                            controller: controller.upcCtrl,
                            hintText: '023456789104',
                          ),
                          LabeledTextField(
                            label: 'Barcode',
                            controller: controller.barcodeCtrl,
                            hintText: '123456789104...',
                          ),
                        ],
                      ),
                    if (!controller.editMode) space,
                    CustomExpansionTile(
                      label: 'Shipping',
                      key: controller.shippingKey,
                      onExpansionChanged: (expanded) async {
                        if (expanded) {
                          await scrollToSelectedContent(globalKey: controller.shippingKey);
                        }
                      },
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
                            LabeledNumericTextField(
                                controller: controller.widthCtrl, label: 'Width', width: (Get.width - 55) / 2),
                            LabeledNumericTextField(
                                controller: controller.lengthCtrl, label: 'Length', width: (Get.width - 55) / 2),
                          ],
                        ),
                        space,
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LabeledNumericTextField(
                                controller: controller.heightCtrl, label: 'Height', width: (Get.width - 55) / 2),
                            LabeledNumericTextField(
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
                        LabeledTextField(
                          label: 'MID Code',
                          controller: controller.midCtrl,
                          hintText: 'XDSKLAD9999...',
                        ),
                        LabeledTextField(
                          label: 'HS Code',
                          controller: controller.hsCtrl,
                          hintText: 'BDJSK39277W...',
                        ),
                        LabeledTextField(
                          readOnly: true,
                          onTap: () async {
                            final result = await showBarModalBottomSheet(
                                context: context, builder: (context) => const SelectCountryView());
                            if (result is List<Country>) {
                              controller.countryCtrl.text = result.first.displayName!;
                              controller.update([3]);
                            }
                          },
                          label: 'Country of origin',
                          controller: controller.countryCtrl,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: 'Choose a country',
                            suffixIcon: controller.countryCtrl.text.isEmpty
                                ? const Icon(Icons.keyboard_arrow_down_outlined)
                                : IconButton(
                                    onPressed: () {
                                      controller.countryCtrl.clear();
                                      controller.update([3]);
                                    },
                                    icon: const Icon(CupertinoIcons.clear_circled_solid)),
                            filled: true,
                            fillColor: Theme.of(context).scaffoldBackgroundColor,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
  final countryCtrl = TextEditingController();
  final skuCtrl = TextEditingController();
  final eanCtrl = TextEditingController();
  final upcCtrl = TextEditingController();
  final barcodeCtrl = TextEditingController();
  final scrollController = ScrollController();

  final generalKey = GlobalKey();
  final pricingKey = GlobalKey();
  final stockKey = GlobalKey();
  final shippingKey = GlobalKey();

  Map<int, ProductOptionValue> selectedOptionsValue = {};
  RxBool manageInventory = true.obs;
  RxBool allowBackorder = false.obs;
  final formKey = GlobalKey<FormState>();
  final List<Currency> currencies = StoreService.store.currencies ?? [];
  Map<Currency, TextEditingController> currencyCtrlMap = <Currency, TextEditingController>{};

  @override
  void onInit() {
    for (Currency currency in currencies) {
      currencyCtrlMap.addAll({currency: TextEditingController()});
    }
    product = Get.arguments[0];
    editMode = Get.arguments[1] ?? false;
    if (editMode) {
      widthCtrl.text = product.width?.toString() ?? '';
      lengthCtrl.text = product.length?.toString() ?? '';
      heightCtrl.text = product.height?.toString() ?? '';
      weightCtrl.text = product.weight?.toString() ?? '';
      midCtrl.text = product.midCode ?? '';
      hsCtrl.text = product.hsCode ?? '';
      countryCtrl.text = product.originCountry ?? '';
    }
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
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
        countryCtrl.text.removeAllWhitespace.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> save() async {
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
    List<MoneyAmount> prices = [];

    currencyCtrlMap.forEach((key, value) {
      prices.add(MoneyAmount(
        amount: int.tryParse(value.text.replaceAll(',', '').replaceAll('.', '')),
        currencyCode: key.code,
      ));
    });
    currencyCtrlMap.forEach((key, value) {
      prices.add(MoneyAmount(
        amount: int.tryParse(value.text.replaceAll(',', '').replaceAll('.', '')),
        currencyCode: key.code,
      ));
    });
    Get.back(
      result: ProductVariant(
        prices: prices,
        title: variantTitle,
        options: variantOptions,
        manageInventory: manageInventory.value,
        allowBackorder: allowBackorder.value,
        inventoryQuantity: int.tryParse(quantityCtrl.text) ?? 0,
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
        originCountry: countryCtrl.text.removeAllWhitespace.isEmpty ? null : countryCtrl.text,
      ),
    );
  }

  Future<void> updateVariant() async {
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
      originCountry: countryCtrl.text.removeAllWhitespace.isEmpty ? null : countryCtrl.text,
    ));
    result.when((success) {
      EasyLoading.showSuccess('Attributes updated');
      Get.back(result: true);
    }, (error) => EasyLoading.showError('Error updating attributes'));
  }
}

class ProductAddVariantBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductAddVariantController(productsRepo: ProductsRepo()));
  }
}
