import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:info_popup/info_popup.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/widgets/currency_formatter.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class OrderCreateRefund extends StatefulWidget {
  const OrderCreateRefund(this.order, {super.key});
  final Order order;

  @override
  State<OrderCreateRefund> createState() => _OrderCreateRefundState();
}

class _OrderCreateRefundState extends State<OrderCreateRefund> {
  final amountCtrl = TextEditingController();
  final noteCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool sendNotification = true;

  @override
  void dispose() {
    amountCtrl.dispose();
    noteCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    String reason = 'Discount';
    const space = Gap(12);
    const halfSpace = Gap(6);
    final currencyCode = widget.order.currencyCode;
    return HideKeyboard(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          systemOverlayStyle: context.defaultSystemUiOverlayStyle.copyWith(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          title: const Text('Create a refund'),
          actions: [
            TextButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  context.maybePop(
                    CreateRefundOrdersReq(
                      amount: int.tryParse(amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0,
                      reason: reason.toLowerCase(),
                      note: noteCtrl.text.isEmpty ? null : noteCtrl.text,
                      noNotification: sendNotification ? null : true,
                    ),
                  );
                },
                child: const Text('Complete'))
          ],
        ),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
                margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 16.0), child: Text('Details')),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: LabeledTextField(
                            label: 'Currency',
                            controller: TextEditingController(text: currencyCode?.toUpperCase() ?? ''),
                            readOnly: true,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        Flexible(
                          flex: 3,
                          child: LabeledNumericTextField(
                            label: 'Refund Amount',
                            required: true,
                            hintText: '0.00',
                            prefixText: '  ${widget.order.currency?.symbolNative} ',
                            controller: amountCtrl,
                            inputFormatters: [
                              CurrencyTextInputFormatter(
                                name: currencyCode,
                              )
                            ],
                            onPlusPressed: () {
                              var text = amountCtrl.text;
                              text = text.replaceAll(RegExp(r'[^0-9]'), '');
                              var val = int.tryParse(text);
                              val ??= 0;
                              amountCtrl.text =
                                  (val + 1).formatAsPrice(currencyCode, includeSymbol: false);
                            },
                            onMinusPressed: () {
                              var text = amountCtrl.text;
                              text = text.replaceAll(RegExp(r'[^0-9]'), '');
                              var val = int.tryParse(text);
                              val ??= 0;
                              if (val == 0) {
                                return;
                              }
                              amountCtrl.text =
                                  (val - 1).formatAsPrice(currencyCode, includeSymbol: false);                            },
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Field is required';
                              }
                              final amount = val.replaceAll(RegExp(r'[^0-9]'), '');
                              final total = widget.order.refundableAmount ?? widget.order.total;

                              if (int.tryParse(amount) == null) {
                                return 'Amount should be in numbers';
                              }
                              if (int.parse(amount) == 0) {
                                return 'Amount can\'t be zero';
                              }
                              if (int.parse(amount).isGreaterThan(total ?? 0)) {
                                return 'Cannot refund more than the order\'s net total.';
                              }

                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    space,
                    Text('Reason', style: mediumTextStyle),
                    halfSpace,
                    DropdownButtonFormField<String>(
                      style: context.bodyMedium,
                      value: reason,
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          value: 'Discount',
                          child: Text('Discount'),
                        ),
                        DropdownMenuItem(
                          value: 'Other',
                          child: Text('Other'),
                        ),
                      ],
                      onChanged: (val) {
                        if (val != null) {
                          setState(() => reason = val);
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    space,
                    LabeledTextField(
                      label: 'Note',
                      controller: noteCtrl,
                      hintText: 'Discount for loyal customer',
                    ),
                    space,
                    CheckboxListTile(
                      value: sendNotification,
                      onChanged: (val) {
                        if (val != null) {
                          setState(() => sendNotification = val);
                        }
                      },
                      title: const Text('Send notification'),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      secondary: InfoPopupWidget(
                        arrowTheme: const InfoPopupArrowTheme(
                          arrowDirection: ArrowDirection.up,
                          color: ColorManager.primary,
                        ),
                        contentTheme: InfoPopupContentTheme(
                          infoContainerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          infoTextStyle: smallTextStyle!,
                          contentPadding: const EdgeInsets.all(8),
                          contentBorderRadius: const BorderRadius.all(Radius.circular(4)),
                          infoTextAlign: TextAlign.start,
                        ),
                        contentTitle: 'Notify customer of created return',
                        child: const Icon(CupertinoIcons.info_circle_fill),
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
  }
}
