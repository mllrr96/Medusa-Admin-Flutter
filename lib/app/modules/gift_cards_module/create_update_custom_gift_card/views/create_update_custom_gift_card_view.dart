import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/domain/use_case/update_gift_card_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../components/adaptive_date_picker.dart';
import '../../../components/currency_formatter.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/date_time_card.dart';
import '../../../components/labeled_numeric_text_field.dart';
import '../../../components/pick_regions/controllers/pick_regions_controller.dart';
import '../../../components/pick_regions/views/pick_regions_view.dart';
import '../controllers/create_update_custom_gift_card_controller.dart';

@RoutePage()
class CreateUpdateCustomGiftCardView extends StatelessWidget {
  const CreateUpdateCustomGiftCardView( {super.key,this.giftCard});
  final GiftCard? giftCard ;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return GetBuilder<CreateUpdateCustomGiftCardController>(
      init: CreateUpdateCustomGiftCardController(updateGiftCardUseCase: UpdateGiftCardUseCase.instance, giftCard: giftCard),
      builder: (controller) {
        return GestureDetector(
          onTap: () => context.unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title:
                  controller.updateMode ? const Text('Update Custom Gift Card') : const Text('Create Custom Gift Card'),
              actions: [
                TextButton(
                    onPressed: () async =>
                        controller.updateMode ? await controller.updateGiftCard(context) : await controller.createGiftCard(context),
                    child: const Text('Save'))
              ],
            ),
            body: SafeArea(
              child: Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
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
                                controller: controller.regionTextCtrl,
                                required: true,
                                readOnly: true,
                                onTap: () async {
                                  final regionReq = PickRegionsReq(
                                    multipleSelect: false,
                                    selectedRegions:
                                        controller.selectedRegion != null ? [controller.selectedRegion!] : [],
                                  );
                                  await showBarModalBottomSheet(
                                      context: context,
                                      overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                                      builder: (context) => PickRegionsView(pickRegionsReq: regionReq)).then((result) {
                                    if (result is PickRegionsRes) {
                                      if (result.regions.isNotEmpty) {
                                        controller.selectedRegion = result.regions.first;
                                        controller.regionTextCtrl.text = result.regions.first.name ?? '';
                                        controller.update();
                                      }
                                    }
                                  });
                                },
                                validator: (val) {
                                  if (controller.selectedRegion == null) {
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
                                controller: controller.amountCtrl,
                                onPlusPressed: () {
                                  var text = controller.amountCtrl.text;
                                  text = text.replaceAll(RegExp(r'[^0-9]'), '');
                                  var val = int.tryParse(text);
                                  val ??= 0;
                                  controller.amountCtrl.text = (val + 1)
                                      .formatAsPrice(controller.selectedRegion?.currencyCode, includeSymbol: false);
                                },
                                onMinusPressed: () {
                                  var text = controller.amountCtrl.text;
                                  text = text.replaceAll(RegExp(r'[^0-9]'), '');
                                  var val = int.tryParse(text);
                                  val ??= 0;
                                  if (val == 0) {
                                    return;
                                  }
                                  controller.amountCtrl.text = (val - 1)
                                      .formatAsPrice(controller.selectedRegion?.currencyCode, includeSymbol: false);
                                },
                                inputFormatters: [
                                  if (controller.selectedRegion != null)
                                    CurrencyTextInputFormatter(
                                      name: controller.selectedRegion?.currencyCode,
                                    )
                                ],
                                prefixText:
                                    '   ${controller.selectedRegion != null ? NumberFormat.simpleCurrency(name: controller.selectedRegion!.currencyCode?.toUpperCase()).currencySymbol : ''} ',
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
                                value: controller.hasExpiryDate,
                                activeColor: GetPlatform.isIOS ? ColorManager.primary : null,
                                onChanged: (val) {
                                  controller.hasExpiryDate = val;
                                  controller.update();
                                },
                                title: const Text('Gift Card has an expiry date?'),
                                subtitle: Text('Schedule the Gift Card to deactivate in the future.',
                                    style: smallTextStyle?.copyWith(color: lightWhite)),
                              ),
                              if (controller.hasExpiryDate)
                                DateTimeCard(
                                  validator: (date) {
                                    if (date == null) {
                                      return 'Required';
                                    }
                                    return null;
                                  },
                                  dateTime: controller.expiryDate,
                                  dateText: 'Expiry',
                                  onTap: () async {
                                    await adaptiveDateTimePicker(date: controller.expiryDate, context: context)
                                        .then((result) {
                                      if (result != null) {
                                        controller.expiryDate = result;
                                        controller.update();
                                      }
                                    });
                                  },
                                )
                            ],
                          ),
                        ),
                        space,
                        if (!controller.updateMode)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                              color: context.theme.cardColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text('Receiver'),
                                ),
                                halfSpace,
                                LabeledTextField(
                                  label: 'Email',
                                  controller: controller.emailCtrl,
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
                                  controller: controller.messageCtrl,
                                  hintText: 'Write a personal message here...',
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
        );
      },
    );
  }
}
