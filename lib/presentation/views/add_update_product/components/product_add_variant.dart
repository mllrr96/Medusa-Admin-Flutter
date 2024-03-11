import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/data/models/product_variant_req.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/presentation/blocs/store/store_bloc.dart';
import 'package:medusa_admin/presentation/widgets/countries/country_view.dart';
import 'package:medusa_admin/presentation/widgets/currency_formatter.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

@RoutePage()
class ProductAddVariantView extends StatefulWidget {
  const ProductAddVariantView(this.productVariantReq, {super.key});
  final ProductVariantReq productVariantReq;

  @override
  State<ProductAddVariantView> createState() => _ProductAddVariantViewState();
}

class _ProductAddVariantViewState extends State<ProductAddVariantView> {
  late Product product;
  late ProductVariant? variant;
  late ProductCrudBloc productCrudBloc;
  List<ProductOption>? get options => product.options;
  ProductVariantReq get productVariantReq => widget.productVariantReq;
  Map<int, ProductOptionValue> selectedOptionsValue = {};
  bool manageInventory = true;
  bool allowBackorder = false;
  final formKey = GlobalKey<FormState>();
  late List<Currency> currencies;
  Map<Currency, TextEditingController> currencyCtrlMap =
      <Currency, TextEditingController>{};
  Map<ProductOption, TextEditingController> productOptionCtrlMap =
      <ProductOption, TextEditingController>{};
  bool get updateMode => productVariantReq.productVariant != null;
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

  final generalTileCtrl = FlexExpansionTileController();

  @override
  void initState() {
    productCrudBloc = ProductCrudBloc.instance;
    currencies = context
            .read<StoreBloc>()
            .state
            .mapOrNull(loaded: (_) => _.store.currencies) ??
        [];
    product = productVariantReq.product;
    variant = productVariantReq.productVariant;
    super.initState();
  }

  @override
  void dispose() {
    productCrudBloc.close();
    scrollController.dispose();
    quantityCtrl.dispose();
    customTitleCtrl.dispose();
    materialCtrl.dispose();
    heightCtrl.dispose();
    widthCtrl.dispose();
    weightCtrl.dispose();
    lengthCtrl.dispose();
    midCtrl.dispose();
    hsCtrl.dispose();
    countryCtrl.dispose();
    skuCtrl.dispose();
    eanCtrl.dispose();
    upcCtrl.dispose();
    barcodeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return BlocListener<ProductCrudBloc, ProductCrudState>(
      bloc: productCrudBloc,
      listener: (context, state) {
        state.maybeWhen(
          loading: (_) => loading(),
          updated: (_) {
            dismissLoading();
            context.showSnackBar('Attributes updated');
            context.router.popForced();
          },
          error: (_) {
            context.showSnackBar('Error updating attributes');
            dismissLoading();
          },
          orElse: () => dismissLoading(),
        );
      },
      child: PopScope(
        canPop: updateMode || !shouldShowWarning(),
        onPopInvoked: (val) async {
          if (val) return;
          await showOkCancelAlertDialog(
            context: context,
            title: 'Discard changes',
            message: 'Are you sure you want to discard changes?',
            okLabel: 'Discard',
            isDestructiveAction: true,
          ).then((result) {
            if (result == OkCancelResult.ok) {
              context.router.popForced();
            }
          });
        },
        child: HideKeyboard(
          child: Scaffold(
            appBar: AppBar(
              leading: const CloseButton(),
              title: Text(updateMode ? 'Update Attributes' : 'Create Variant'),
              actions: [
                TextButton(
                    onPressed: () async => updateMode
                        ? productCrudBloc.add(ProductCrudEvent.update(
                            product.id!,
                            UserPostUpdateProductReq(
                              status: product.status,
                              discountable: product.discountable,
                              weight: int.tryParse(weightCtrl.text),
                              length: int.tryParse(lengthCtrl.text),
                              height: int.tryParse(heightCtrl.text),
                              width: int.tryParse(widthCtrl.text),
                              midCode: midCtrl.text.removeAllWhitespace.isEmpty
                                  ? null
                                  : midCtrl.text,
                              hsCode: hsCtrl.text.removeAllWhitespace.isEmpty
                                  ? null
                                  : hsCtrl.text,
                              originCountry:
                                  countryCtrl.text.removeAllWhitespace.isEmpty
                                      ? null
                                      : countryCtrl.text,
                            )))
                        : await save(context),
                    child: const Text('Save')),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                controller: scrollController,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          FlexExpansionTile(
                            initiallyExpanded: true,
                            controller: generalTileCtrl,
                            title: const Text('General'),
                            child: Column(
                              children: [
                                Text(
                                    'Configure the general information for this variant.',
                                    style: smallTextStyle?.copyWith(
                                        color: manatee)),
                                space,
                                LabeledTextField(
                                  label: 'Custom title',
                                  controller: customTitleCtrl,
                                  hintText: 'Green / XL',
                                ),
                                LabeledTextField(
                                  label: 'Material',
                                  controller: materialCtrl,
                                  hintText: '80% wool, 20% cotton',
                                ),
                                const Divider(),
                                Row(
                                  children: [
                                    Text('Options', style: largeTextStyle),
                                  ],
                                ),
                                space,
                                if (options != null && !updateMode)
                                  ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: options!.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final currentOption = options![index];
                                      return Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(currentOption.title!,
                                                  style: mediumTextStyle),
                                              Text(' *',
                                                  style:
                                                      mediumTextStyle?.copyWith(
                                                          color: Colors.red)),
                                            ],
                                          ),
                                          const Gap(6.0),
                                          if (currentOption.values != null)
                                            DropdownButtonFormField(
                                              style: context.bodyMedium,
                                              validator: (val) {
                                                if (val == null) {
                                                  return 'Field is required';
                                                }
                                                return null;
                                              },
                                              items: currentOption.values!
                                                  .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e.value!)))
                                                  .toList(),
                                              hint: const Text(
                                                  'Choose an option'),
                                              onChanged: (value) {
                                                if (value != null) {
                                                  selectedOptionsValue[index] =
                                                      value;
                                                }
                                              },
                                            ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (_, __) => space,
                                  ),
                                if (options != null && updateMode)
                                  ListView.separated(
                                    shrinkWrap: true,
                                    itemCount: options!.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final currentOption = options![index];
                                      final textCtrl =
                                          productOptionCtrlMap[currentOption];
                                      return LabeledTextField(
                                        label: currentOption.title ?? '',
                                        required: true,
                                        controller: textCtrl,
                                      );
                                    },
                                    separatorBuilder: (_, __) => space,
                                  ),
                                space,
                              ],
                            ),
                          ),
                          space,
                          FlexExpansionTile(
                            key: pricingKey,
                            onExpansionChanged: (expanded) async {
                              if (expanded) {
                                await pricingKey.currentContext
                                    .ensureVisibility();
                              }
                            },
                            title: const Text('Pricing'),
                            childPadding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 4.0),
                            child: Column(
                              children: [
                                Text('Configure the pricing for this variant.',
                                    style: smallTextStyle?.copyWith(
                                        color: manatee)),
                                space,
                                ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: updateMode
                                        ? variant!.prices!.length
                                        : currencies.length,
                                    itemBuilder: (context, index) {
                                      final currency =
                                          currencyCtrlMap.keys.toList()[index];
                                      final currencyCtrl =
                                          currencyCtrlMap[currency];
                                      return Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(12.0)),
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12.0,
                                                vertical: 8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                          currency.code
                                                                  ?.toUpperCase() ??
                                                              '',
                                                          style:
                                                              mediumTextStyle),
                                                      space,
                                                      Expanded(
                                                          child: Text(
                                                              currency.name ??
                                                                  '',
                                                              style: mediumTextStyle
                                                                  ?.copyWith(
                                                                      color:
                                                                          manatee)))
                                                    ],
                                                  ),
                                                ),
                                                Flexible(
                                                  child: TextField(
                                                    controller: currencyCtrl,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(
                                                            decimal: true),
                                                    inputFormatters: [
                                                      CurrencyTextInputFormatter(
                                                          name: currency.code)
                                                    ],
                                                    decoration: InputDecoration(
                                                      hintTextDirection:
                                                          TextDirection.rtl,
                                                      prefixIcon: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                          child: Text(
                                                              currency.symbolNative ??
                                                                  '',
                                                              style: mediumTextStyle
                                                                  ?.copyWith(
                                                                      color:
                                                                          manatee))),
                                                      prefixIconConstraints:
                                                          const BoxConstraints(
                                                              minWidth: 0,
                                                              minHeight: 0),
                                                      hintText: '-',
                                                      isDense: true,
                                                      border:
                                                          const OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4.0)),
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
                          ),
                          space,
                          FlexExpansionTile(
                            title: const Text('Stock & Inventory'),
                            key: stockKey,
                            onExpansionChanged: (expanded) async {
                              if (expanded) {
                                await stockKey.currentContext
                                    .ensureVisibility();
                              }
                            },
                            child: Column(
                              children: [
                                Text(
                                    'Configure the inventory and stock for this variant.',
                                    style: smallTextStyle?.copyWith(
                                        color: manatee)),
                                space,
                                SwitchListTile.adaptive(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text('Manage inventory',
                                      style: largeTextStyle),
                                  subtitle: Text(
                                      'When checked Medusa will regulate the inventory when orders and returns are made.',
                                      style: smallTextStyle?.copyWith(
                                          color: manatee)),
                                  value: manageInventory,
                                  onChanged: (val) =>
                                      setState(() => manageInventory = val),
                                  activeColor: Platform.isIOS
                                      ? ColorManager.primary
                                      : null,
                                ),
                                space,
                                SwitchListTile.adaptive(
                                  contentPadding: EdgeInsets.zero,
                                  title: Text('Allow backorders',
                                      style: largeTextStyle),
                                  subtitle: Text(
                                      'When checked the product will be available for purchase despite the product being sold out',
                                      style: smallTextStyle?.copyWith(
                                          color: manatee)),
                                  value: allowBackorder,
                                  onChanged: (val) =>
                                      setState(() => allowBackorder = val),
                                  activeColor: Platform.isIOS
                                      ? ColorManager.primary
                                      : null,
                                ),
                                space,
                                LabeledTextField(
                                  label: 'Stock keeping unit (SKU)',
                                  controller: TextEditingController(),
                                  hintText: 'SUN-G, JK1234...',
                                ),
                                LabeledNumericTextField(
                                  controller: quantityCtrl,
                                  label: 'Quantity in stock',
                                ),
                                space,
                                LabeledTextField(
                                  label: 'EAN (Barcode)',
                                  controller: eanCtrl,
                                  hintText: '123456789123...',
                                ),
                                LabeledTextField(
                                  label: 'UPC (Barcode)',
                                  controller: upcCtrl,
                                  hintText: '023456789104',
                                ),
                                LabeledTextField(
                                  label: 'Barcode',
                                  controller: barcodeCtrl,
                                  hintText: '123456789104...',
                                ),
                              ],
                            ),
                          ),
                          space,
                        ],
                      ),
                      FlexExpansionTile(
                        title: const Text('Shipping'),
                        key: shippingKey,
                        onExpansionChanged: (expanded) async {
                          if (expanded) {
                            await shippingKey.currentContext.ensureVisibility();
                          }
                        },
                        child: Column(
                          children: [
                            Text(
                                'Shipping information can be required depending on your shipping provider, and whether or not you are shipping internationally.',
                                style:
                                    smallTextStyle?.copyWith(color: manatee)),
                            space,
                            Row(
                              children: [
                                Text('Dimensions', style: largeTextStyle),
                              ],
                            ),
                            space,
                            Text(
                                'Configure to calculate the most accurate shipping rates.',
                                style:
                                    smallTextStyle?.copyWith(color: manatee)),
                            space,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: LabeledNumericTextField(
                                      controller: widthCtrl, label: 'Width'),
                                ),
                                space,
                                Flexible(
                                  child: LabeledNumericTextField(
                                      controller: lengthCtrl, label: 'Length'),
                                ),
                              ],
                            ),
                            space,
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: LabeledNumericTextField(
                                      controller: heightCtrl, label: 'Height'),
                                ),
                                space,
                                Flexible(
                                  child: LabeledNumericTextField(
                                      controller: weightCtrl, label: 'Weight'),
                                ),
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
                            Text(
                                'Configure if you are shipping internationally.',
                                style:
                                    smallTextStyle?.copyWith(color: manatee)),
                            space,
                            LabeledTextField(
                              label: 'MID Code',
                              controller: midCtrl,
                              hintText: 'XDSKLAD9999...',
                            ),
                            LabeledTextField(
                              label: 'HS Code',
                              controller: hsCtrl,
                              hintText: 'BDJSK39277W...',
                            ),
                            LabeledTextField(
                              readOnly: true,
                              onTap: () async {
                                final result = await showBarModalBottomSheet(
                                    context: context,
                                    backgroundColor:
                                        context.theme.scaffoldBackgroundColor,
                                    overlayStyle: context
                                        .theme.appBarTheme.systemOverlayStyle,
                                    builder: (context) =>
                                        const SelectCountryView());
                                if (result is List<Country>) {
                                  countryCtrl.text = result.first.displayName!;
                                  setState(() {});
                                }
                              },
                              label: 'Country of origin',
                              controller: countryCtrl,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                hintText: 'Choose a country',
                                suffixIcon: countryCtrl.text.isEmpty
                                    ? const Icon(
                                        Icons.keyboard_arrow_down_outlined)
                                    : IconButton(
                                        onPressed: () {
                                          countryCtrl.clear();
                                          setState(() {});
                                        },
                                        icon: const Icon(CupertinoIcons
                                            .clear_circled_solid)),
                                filled: true,
                                fillColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

  Future<void> save(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      if (!generalTileCtrl.isExpanded) {
        generalTileCtrl.expand();
      }
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
        amount:
            int.tryParse(value.text.replaceAll(',', '').replaceAll('.', '')),
        currencyCode: key.code,
      ));
    });

    context.router.popForced(
      ProductVariant(
        prices: prices,
        title: variantTitle,
        options: variantOptions,
        manageInventory: manageInventory,
        allowBackorder: allowBackorder,
        inventoryQuantity: int.tryParse(quantityCtrl.text) ?? 0,
        weight: int.tryParse(weightCtrl.text),
        length: int.tryParse(lengthCtrl.text),
        height: int.tryParse(heightCtrl.text),
        width: int.tryParse(widthCtrl.text),
        hsCode: hsCtrl.text.removeAllWhitespace.isEmpty ? null : hsCtrl.text,
        material: materialCtrl.text.removeAllWhitespace.isEmpty
            ? null
            : materialCtrl.text,
        sku: skuCtrl.text.removeAllWhitespace.isEmpty ? null : skuCtrl.text,
        ean: eanCtrl.text.removeAllWhitespace.isEmpty ? null : eanCtrl.text,
        upc: upcCtrl.text.removeAllWhitespace.isEmpty ? null : upcCtrl.text,
        barcode: barcodeCtrl.text.removeAllWhitespace.isEmpty
            ? null
            : barcodeCtrl.text,
        midCode: midCtrl.text.removeAllWhitespace.isEmpty ? null : midCtrl.text,
        originCountry: countryCtrl.text.removeAllWhitespace.isEmpty
            ? null
            : countryCtrl.text,
      ),
    );
  }
}

