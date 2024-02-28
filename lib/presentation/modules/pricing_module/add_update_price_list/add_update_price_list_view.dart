import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/copy_with_price_list.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/data/models/wrapped.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/blocs/pricing/pricing_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/date_time_card.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/pick_groups/controllers/pick_groups_controller.dart';
import 'package:medusa_admin/presentation/widgets/pick_groups/views/pick_groups_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_products/controllers/pick_products_controller.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'components/index.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class AddUpdatePriceListView extends StatefulWidget {
  const AddUpdatePriceListView({super.key, this.id});
  final String? id;
  static const kDuration = Duration(milliseconds: 300);

  @override
  State<AddUpdatePriceListView> createState() => _AddUpdatePriceListViewState();
}

class _AddUpdatePriceListViewState extends State<AddUpdatePriceListView> {
  bool get updateMode => widget.id != null;
  PriceList priceList =
      const PriceList(type: PriceListType.sale, status: PriceListStatus.active);
  final configFormKey = GlobalKey<FormState>();
  final generalFormKey = GlobalKey<FormState>();
  final priceListTypeKey = GlobalKey();
  final generalKey = GlobalKey();
  final generalController = FlexExpansionTileController();
  final configController = FlexExpansionTileController();
  final configKey = GlobalKey();
  final pricesKey = GlobalKey();
  bool specifyCustomers = false;
  final groupCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  List<Product> products = [];
  bool saveAsDraft = false;
  late PricingCrudBloc pricingCrudBloc;
  bool firstTimeLoading = true;

  @override
  void initState() {
    pricingCrudBloc = PricingCrudBloc.instance;
    if (updateMode) {
      pricingCrudBloc.add(PricingCrudEvent.load(widget.id!));
    }
    super.initState();
  }

  @override
  void dispose() {
    groupCtrl.dispose();
    nameCtrl.dispose();
    descriptionCtrl.dispose();
    pricingCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    const halfSpace = Gap(6);

    Widget buildPriceListType() {
      return FlexExpansionTile(
          key: priceListTypeKey,
          initiallyExpanded: true,
          onExpansionChanged: (expanded) async {
            if (expanded) {
              await priceListTypeKey.currentContext.ensureVisibility();
            } else {
              context.unfocus();
            }
          },
          title: const Text('Price List Type'),
          childPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select the type of the price list',
                style: smallTextStyle!.copyWith(color: manatee),
              ),
              space,
              PriceListTypeCard(
                priceListType: PriceListType.sale,
                groupValue: priceList.type,
                onTap: (val) {
                  priceList = priceList.copyWith(type: val);
                  setState(() {});
                  // update([0]);
                },
              ),
              space,
              PriceListTypeCard(
                priceListType: PriceListType.override,
                groupValue: priceList.type,
                onTap: (val) {
                  priceList = priceList.copyWith(type: val);
                  setState(() {});
                },
              ),
              halfSpace,
            ],
          ));
    }

    Widget buildGeneral() {
      return FlexExpansionTile(
        key: generalKey,
        controller: generalController,
        maintainState: true,
        onExpansionChanged: (expanded) async {
          if (expanded) {
            await generalKey.currentContext.ensureVisibility();
          } else {
            context.unfocus();
          }
        },
        title: const Text('General'),
        childPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General information for the price list.',
              style: smallTextStyle!.copyWith(color: manatee),
            ),
            space,
            LabeledTextField(
              label: 'Name',
              controller: nameCtrl,
              required: true,
              hintText: 'B2B, Black Friday...',
              validator: (val) {
                if (val == null || val.removeAllWhitespace.isEmpty) {
                  return 'Price list must have a name';
                }
                return null;
              },
            ),
            LabeledTextField(
              label: 'Description',
              controller: descriptionCtrl,
              required: true,
              hintText: 'For our business partners',
              validator: (val) {
                if (val == null || val.removeAllWhitespace.isEmpty) {
                  return 'Price list must have a description';
                }
                return null;
              },
            ),
          ],
        ),
      );
    }

    Widget buildConfig() {
      return FlexExpansionTile(
          key: configKey,
          controller: configController,
          maintainState: true,
          onExpansionChanged: (expanded) async {
            if (expanded) {
              await configKey.currentContext.ensureVisibility();
            } else {
              context.unfocus();
            }
          },
          title: const Text('Configuration'),
          childPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The price overrides apply from the time you hit the publish button and forever if left untouched.',
                style: smallTextStyle!.copyWith(color: manatee),
              ),
              space,
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Price overrides has a start date?'),
                subtitle: const Text(
                    'Schedule the price overrides to activate in the future.',
                    style: TextStyle(color: manatee)),
                value: priceList.startsAt != null,
                onChanged: (val) async {
                  if (val) {
                    priceList = priceList.copyWith(
                        startsAt: Wrapped.value(DateTime.now()));
                    setState(() {});
                    // update([2]);
                    await configKey.currentContext.ensureVisibility();
                  } else {
                    priceList =
                        priceList.copyWith(startsAt: const Wrapped.value(null));
                    // update([2]);
                    setState(() {});
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                  duration: AddUpdatePriceListView.kDuration,
                  child: priceList.startsAt != null
                      ? DateTimeCard(
                          validator: (date) {
                            if (date == null) {
                              return 'Required';
                            }
                            return null;
                          },
                          onTap: () async {
                            final result = await context.adaptiveDateTimePicker(
                                date: priceList.startsAt);
                            if (result != null) {
                              priceList = priceList.copyWith(
                                  startsAt: Wrapped.value(result));
                              // update([2]);
                              setState(() {});
                            }
                          },
                          dateTime: priceList.startsAt,
                          dateText: 'Start',
                        )
                      : const SizedBox.shrink()),
              space,
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Price overrides has a expiry date?'),
                subtitle: const Text(
                    'Schedule the price overrides to deactivate in the future.',
                    style: TextStyle(color: manatee)),
                value: priceList.endsAt != null,
                onChanged: (val) async {
                  if (val) {
                    priceList = priceList.copyWith(
                        endsAt: Wrapped.value(
                            DateTime.now().add(const Duration(days: 7))));
                    // update([2]);
                    setState(() {});
                    await configKey.currentContext.ensureVisibility();
                  } else {
                    priceList =
                        priceList.copyWith(endsAt: const Wrapped.value(null));
                    // update([2]);
                    setState(() {});
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                  duration: AddUpdatePriceListView.kDuration,
                  child: priceList.endsAt != null
                      ? DateTimeCard(
                          validator: (date) {
                            if (date == null) {
                              return 'Required';
                            }
                            return null;
                          },
                          onTap: () async {
                            final result = await context.adaptiveDateTimePicker(
                                date: priceList.endsAt);
                            if (result != null) {
                              priceList = priceList.copyWith(
                                  endsAt: Wrapped.value(result));
                              // update([2]);
                              setState(() {});
                            }
                          },
                          dateTime: priceList.endsAt,
                          dateText: 'Expiry')
                      : const SizedBox.shrink()),
              space,
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Customer availability'),
                subtitle: const Text(
                    'Specify which customer groups the price overrides should apply for.',
                    style: TextStyle(color: manatee)),
                value: specifyCustomers,
                onChanged: (val) async {
                  if (val) {
                    specifyCustomers = val;
                    // update([2]);
                    setState(() {});
                    await configKey.currentContext.ensureVisibility();
                  } else {
                    specifyCustomers = val;
                    // update([2]);
                    setState(() {});
                  }
                },
              ),
              halfSpace,
              AnimatedSwitcher(
                  duration: AddUpdatePriceListView.kDuration,
                  child: specifyCustomers
                      ? LabeledTextField(
                          validator: (val) {
                            if (!specifyCustomers) {
                              return null;
                            }
                            if (val == null || val.isEmpty) {
                              return 'Field is required';
                            }

                            return null;
                          },
                          readOnly: true,
                          onTap: () async {
                            final result = await showBarModalBottomSheet(
                                context: context,
                                backgroundColor:
                                    context.theme.scaffoldBackgroundColor,
                                overlayStyle: context
                                    .theme.appBarTheme.systemOverlayStyle,
                                builder: (context) => PickGroupsView(
                                    pickGroupsReq: PickGroupsReq(
                                        multipleSelect: true,
                                        selectedGroups:
                                            priceList.customerGroups)));
                            if (result is List<CustomerGroup>) {
                              priceList = priceList.copyWith(
                                  customerGroups: Wrapped.value(result));
                              groupCtrl.text = result
                                  .map((e) => e.name)
                                  .toList()
                                  .toString()
                                  .replaceAll('[', '')
                                  .replaceAll(']', '');
                              // update([2]);
                              setState(() {});
                            }
                          },
                          label: 'Customer Groups',
                          controller: groupCtrl,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: 'Select group(s)',
                            suffixIcon: priceList.customerGroups?.isEmpty ??
                                    true
                                ? const Icon(Icons.keyboard_arrow_down_outlined)
                                : IconButton(
                                    onPressed: () {
                                      priceList = priceList.copyWith(
                                          customerGroups:
                                              const Wrapped.value(null));
                                      groupCtrl.clear();
                                      // update([2]);
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                        CupertinoIcons.clear_circled_solid)),
                            filled: true,
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink())
            ],
          ));
    }

    Widget buildPrices() {
      return FlexExpansionTile(
        key: pricesKey,
        onExpansionChanged: (expanded) async {
          if (expanded) {
            await pricesKey.currentContext.ensureVisibility();
          } else {
            context.unfocus();
          }
        },
        title: const Text('Prices'),
        childPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'You will be able to override the prices for the products you add here',
            style: smallTextStyle!.copyWith(color: manatee),
          ),
          space,
          ...products.map((product) => Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    onTap: () async {
                      await showModalActionSheet<int>(
                          title: 'Manage Product',
                          message: product.title ?? '',
                          context: context,
                          actions: <SheetAction<int>>[
                            const SheetAction(label: 'Edit prices', key: 0),
                            const SheetAction(
                                label: 'Remove',
                                isDestructiveAction: true,
                                key: 1),
                          ]).then((result) async {
                        switch (result) {
                          case 0:
                            final result = await showBarModalBottomSheet(
                              backgroundColor:
                                  context.theme.scaffoldBackgroundColor,
                              overlayStyle:
                                  context.theme.appBarTheme.systemOverlayStyle,
                              context: context,
                              builder: (context) => AddUpdateVariantsPriceView(
                                  product: product, prices: priceList.prices),
                            );
                            if (result is List<MoneyAmount>) {
                              final originalPrices = priceList.prices ?? [];
                              priceList = priceList.copyWith(
                                  prices: result + originalPrices);
                              // update([3]);
                              setState(() {});
                            }
                            return;
                          case 1:
                            products.removeWhere(
                                (element) => element.id == product.id);
                            // update([3]);
                            setState(() {});
                            return;
                        }
                      });
                    },
                    child: Ink(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12.0),
                      // margin: const EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(product.title ?? '', style: smallTextStyle),
                          const Icon(Icons.more_horiz)
                        ],
                      ),
                    ),
                  ),
                  const Gap(6.0),
                  if (product.variants != null &&
                      product.variants!.isNotEmpty &&
                      priceList.prices != null)
                    ...product.variants!.map((e) {
                      final priceCount = priceList.prices!
                          .where((element) => element.variantId == e.id)
                          .toList()
                          .length;
                      if (priceCount == 0) {
                        return const SizedBox.shrink();
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        margin: const EdgeInsets.only(bottom: 10.0, left: 14),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(e.title ?? '', style: smallTextStyle),
                            if (priceList.prices != null)
                              Text(
                                  '${priceCount == 0 ? 'Add' : priceCount} prices',
                                  style: smallTextStyle),
                          ],
                        ),
                      );
                    }),
                ],
              )),
          space,
          TextButton(
            onPressed: () async {
              final result = await context.pushRoute(PickProductsRoute(
                  pickProductsReq: PickProductsReq(includeVariantCount: true)));
              if (result is PickProductsRes) {
                products = result.selectedProducts;
                // update([3]);
                setState(() {});
              }
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add),
                SizedBox(width: 6.0),
                Text('Add Products Manually'),
              ],
            ),
          ),
        ]),
      );
    }

    return BlocListener<PricingCrudBloc, PricingCrudState>(
      bloc: pricingCrudBloc,
      listener: (context, state) {
        state.maybeMap(
          loading: (_) => loading(),
          pricingList: (state) {
            dismissLoading();
            if (firstTimeLoading) {
              firstTimeLoading = false;
              priceList = state.priceList;
              nameCtrl.text = priceList.name ?? '';
              descriptionCtrl.text = priceList.description ?? '';
              saveAsDraft = priceList.status == PriceListStatus.draft;
              specifyCustomers = priceList.customerGroups != null;
              groupCtrl.text = priceList.customerGroups
                      ?.map((e) => e.name)
                      .toList()
                      .toString()
                      .replaceAll('[', '')
                      .replaceAll(']', '') ??
                  '';
              setState(() {});
            } else {
              if (updateMode) {
                context.showSnackBar('Price List Updated');
                context.popRoute(true);
              } else {
                context.showSnackBar('Price List Created');
                context.popRoute(true);
              }
            }
          },
          orElse: () => dismissLoading(),
        );
      },
      child: GestureDetector(
        onTap: () => context.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: context.defaultSystemUiOverlayStyle,
            leading: const CloseButton(),
            title: updateMode
                ? const Text('Update price list')
                : const Text('Create price list'),
            actions: [
              TextButton(
                onPressed: () async {
                  updateMode
                      ? pricingCrudBloc.add(PricingCrudEvent.update(
                          widget.id!,
                          UserUpdatePriceListReq(
                            name: nameCtrl.text,
                            description: descriptionCtrl.text,
                            type: priceList.type,
                            startsAt: priceList.startsAt,
                            endsAt: priceList.endsAt,
                            customerGroupIds: priceList.customerGroups
                                ?.map((e) => e.id!)
                                .toList(),
                            status: saveAsDraft
                                ? PriceListStatus.draft
                                : PriceListStatus.active,
                          ),
                        ))
                      : pricingCrudBloc.add(PricingCrudEvent.create(
                          UserCreatePriceListReq(
                            name: nameCtrl.text,
                            description: descriptionCtrl.text,
                            type: priceList.type,
                            prices: priceList.prices
                                    ?.map((e) => MoneyAmount(
                                          amount: e.amount,
                                          currencyCode: e.currencyCode,
                                          variantId: e.variantId,
                                        ))
                                    .toList() ??
                                [],
                            startsAt: priceList.startsAt,
                            endsAt: priceList.endsAt,
                            customerGroupIds: priceList.customerGroups
                                ?.map((e) => e.id!)
                                .toList(),
                            status: saveAsDraft
                                ? PriceListStatus.draft
                                : PriceListStatus.active,
                          ),
                        ));
                },
                child: updateMode ? const Text('Update') : const Text('Create'),
              )
            ],
          ),
          body: SafeArea(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              children: [
                SwitchListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  value: saveAsDraft,
                  onChanged: (val) {
                    saveAsDraft = val;
                    // update();
                    setState(() {});
                  },
                  title: updateMode
                      ? const Text('Unpublish')
                      : const Text('Save as draft'),
                ),
                const Divider(),
                buildPriceListType(),
                space,
                Form(key: generalFormKey, child: buildGeneral()),
                space,
                Form(key: configFormKey, child: buildConfig()),
                space,
                buildPrices(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
