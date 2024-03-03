import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/extension/string_extension.dart';
import 'package:medusa_admin/presentation/blocs/gift_card_crud/gift_card_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/currency_formatter.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/date_time_card.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin/presentation/widgets/pick_regions/controllers/pick_regions_controller.dart';
import 'package:medusa_admin/presentation/widgets/pick_regions/views/pick_regions_view.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class CreateUpdateCustomGiftCardView extends StatefulWidget {
  const CreateUpdateCustomGiftCardView({super.key, this.giftCard});
  final GiftCard? giftCard;

  @override
  State<CreateUpdateCustomGiftCardView> createState() =>
      _CreateUpdateCustomGiftCardViewState();
}

class _CreateUpdateCustomGiftCardViewState
    extends State<CreateUpdateCustomGiftCardView> {
  bool get updateMode => widget.giftCard != null;
  Region? selectedRegion;
  DateTime? expiryDate;
  final amountCtrl = TextEditingController();
  final regionTextCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final messageCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hasExpiryDate = false;
  late GiftCardCrudBloc giftCardCrudBloc;

  @override
  void initState() {
    giftCardCrudBloc = GiftCardCrudBloc.instance;
    if (updateMode) {
      loadGiftCard();
    }
    super.initState();
  }

  @override
  void dispose() {
    giftCardCrudBloc.close();
    amountCtrl.dispose();
    emailCtrl.dispose();
    messageCtrl.dispose();
    regionTextCtrl.dispose();
    super.dispose();
  }

  void loadGiftCard() {
    selectedRegion = widget.giftCard!.region;
    regionTextCtrl.text = selectedRegion?.name ?? '';
    amountCtrl.text = widget.giftCard?.balance?.formatAsPrice(
            selectedRegion?.currencyCode,
            includeSymbol: false) ??
        '';
    expiryDate = widget.giftCard?.endsAt;
    hasExpiryDate = expiryDate != null;
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return BlocListener<GiftCardCrudBloc, GiftCardCrudState>(
      listener: (context, state) {
        state.maybeMap(
            loading: (_) => loading(),
            giftCard: (_) {
              context.popRoute();
              context.showSnackBar(
                  'Gift card ${updateMode ? 'updated' : 'created'}');
              dismissLoading();
            },
            error: (error) {
              dismissLoading();
              context.showSnackBar(error.failure.toSnackBarString());
            },
            orElse: () => dismissLoading());
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: updateMode
                ? const Text('Update Custom Gift Card')
                : const Text('Create Custom Gift Card'),
            actions: [
              TextButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    if (updateMode) {
                      giftCardCrudBloc.add(GiftCardCrudEvent.update(
                          widget.giftCard!.id!,
                          UserUpdateGiftCardReq(
                            regionId: selectedRegion!.id!,
                            endsAt: expiryDate,
                          )));
                    } else {
                      giftCardCrudBloc.add(
                          GiftCardCrudEvent.create(UserCreateGiftCardReq(
                            value: int.tryParse(amountCtrl.text
                                .replaceAll(RegExp(r'[^0-9]'), '')),
                            regionId: selectedRegion!.id!,
                            endsAt: expiryDate,
                          )));
                    }
                  },
                  child: const Text('Save'))
            ],
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                          color: context.theme.cardColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('Details'),
                            ),
                            halfSpace,
                            LabeledTextField(
                              label: 'Region',
                              hintText: 'Select Region',
                              controller: regionTextCtrl,
                              required: true,
                              readOnly: true,
                              onTap: () async {
                                final regionReq = PickRegionsReq(
                                  multipleSelect: false,
                                  selectedRegions: selectedRegion != null
                                      ? [selectedRegion!]
                                      : [],
                                );
                                await showBarModalBottomSheet(
                                    context: context,
                                    backgroundColor: context
                                        .theme.scaffoldBackgroundColor,
                                    overlayStyle: context.theme.appBarTheme
                                        .systemOverlayStyle,
                                    builder: (context) => PickRegionsView(
                                        pickRegionsReq: regionReq)).then(
                                        (result) {
                                      if (result is PickRegionsRes) {
                                        if (result.regions.isNotEmpty) {
                                          selectedRegion = result.regions.first;
                                          regionTextCtrl.text =
                                              result.regions.first.name ?? '';
                                          setState(() {});
                                        }
                                      }
                                    });
                              },
                              validator: (val) {
                                if (selectedRegion == null) {
                                  return 'Select a region';
                                }
                                return null;
                              },
                            ),
                            halfSpace,
                            LabeledNumericTextField(
                              key: const Key('amount'),
                              label: 'Amount',
                              required: true,
                              hintText: '0.00',
                              controller: amountCtrl,
                              onPlusPressed: () {
                                var text = amountCtrl.text;
                                text =
                                    text.replaceAll(RegExp(r'[^0-9]'), '');
                                var val = int.tryParse(text);
                                val ??= 0;
                                amountCtrl.text = (val + 1).formatAsPrice(
                                    selectedRegion?.currencyCode,
                                    includeSymbol: false);
                              },
                              onMinusPressed: () {
                                var text = amountCtrl.text;
                                text =
                                    text.replaceAll(RegExp(r'[^0-9]'), '');
                                var val = int.tryParse(text);
                                val ??= 0;
                                if (val == 0) {
                                  return;
                                }
                                amountCtrl.text = (val - 1).formatAsPrice(
                                    selectedRegion?.currencyCode,
                                    includeSymbol: false);
                              },
                              inputFormatters: [
                                if (selectedRegion != null)
                                  CurrencyTextInputFormatter(
                                    name: selectedRegion?.currencyCode,
                                  )
                              ],
                              prefixText:
                              '   ${selectedRegion!.currencyCode.getCurrencySymbol} ',
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                            halfSpace,
                            SwitchListTile.adaptive(
                              contentPadding: EdgeInsets.zero,
                              value: hasExpiryDate,
                              activeColor: GetPlatform.isIOS
                                  ? ColorManager.primary
                                  : null,
                              onChanged: (val) {
                                hasExpiryDate = val;
                                setState(() {});
                              },
                              title: const Text(
                                  'Gift Card has an expiry date?'),
                              subtitle: Text(
                                  'Schedule the Gift Card to deactivate in the future.',
                                  style: smallTextStyle?.copyWith(
                                      color: manatee)),
                            ),
                            if (hasExpiryDate)
                              DateTimeCard(
                                validator: (date) {
                                  if (date == null) {
                                    return 'Required';
                                  }
                                  return null;
                                },
                                dateTime: expiryDate,
                                dateText: 'Expiry',
                                onTap: () async {
                                  await context
                                      .adaptiveDateTimePicker(
                                      date: expiryDate)
                                      .then((result) {
                                    if (result != null) {
                                      expiryDate = result;
                                      setState(() {});
                                    }
                                  });
                                },
                              )
                          ],
                        ),
                      ),
                      space,
                      if (!updateMode)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(12.0)),
                            color: context.theme.cardColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding:
                                EdgeInsets.symmetric(vertical: 8.0),
                                child: Text('Receiver'),
                              ),
                              halfSpace,
                              LabeledTextField(
                                label: 'Email',
                                controller: emailCtrl,
                                required: true,
                                hintText: 'Email...',
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Email is required';
                                  }
                                  return null;
                                },
                              ),
                              LabeledTextField(
                                label: 'Personal Message',
                                controller: messageCtrl,
                                hintText:
                                'Write a personal message here...',
                              ),
                            ],
                          ),
                        )
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
