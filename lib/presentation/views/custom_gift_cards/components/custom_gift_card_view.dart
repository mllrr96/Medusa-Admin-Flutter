import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:flutter/services.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CustomGiftCardView extends StatefulWidget {
  const CustomGiftCardView(this.giftCard,
      {super.key, this.onEdit, this.onToggle});
  final GiftCard giftCard;
  final void Function()? onEdit;
  final void Function()? onToggle;

  @override
  State<CustomGiftCardView> createState() => _CustomGiftCardViewState();
}

class _CustomGiftCardViewState extends State<CustomGiftCardView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final isDisabled = widget.giftCard.isDisabled;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom == 0
        ? 20.0
        : MediaQuery.of(context).viewPadding.bottom;
    return ShadDialog(
      title: const Text('Custom Gift Card Details'),
      actions: [
        ShadButton(
            onPressed: () {
              context.maybePop();
              widget.onEdit?.call();
            },
            text: const Text('Edit')),
        ShadButton(
            onPressed: () {
              context.maybePop();
              widget.onToggle?.call();
            },
            text: Text(isDisabled ? 'Enable' : 'Disable')),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ShadButton.outline(
                      text: Text(
                        widget.giftCard.code ?? '',
                      ),
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: widget.giftCard.code ?? ''));
                      }),
                ),
                const Gap(12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Original amount',
                            style: mediumTextStyle?.copyWith(color: manatee)),
                        Text(
                            widget.giftCard.value.formatAsPrice(
                                widget.giftCard.region?.currencyCode),
                            style: mediumTextStyle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Balance',
                            style: mediumTextStyle?.copyWith(color: manatee)),
                        Text(
                            widget.giftCard.balance.formatAsPrice(
                                widget.giftCard.region?.currencyCode),
                            style: mediumTextStyle),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Region',
                            style: mediumTextStyle?.copyWith(color: manatee)),
                        Text(widget.giftCard.region?.name?.toUpperCase() ?? '',
                            style: mediumTextStyle),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Created',
                            style: mediumTextStyle?.copyWith(color: manatee)),
                        Text(widget.giftCard.createdAt.formatDate(),
                            style: mediumTextStyle),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6.0),
                InkWell(
                  onTap: () async {
                    if (await confirmToggle(isDisabled) && context.mounted) {
                      context.maybePop();
                      widget.onToggle?.call();
                    }
                  },
                  child: Ink(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Status',
                            style: mediumTextStyle?.copyWith(color: manatee)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Icon(Icons.circle,
                                    color:
                                        isDisabled ? Colors.red : Colors.green,
                                    size: 10),
                                Icon(Icons.circle,
                                    color: isDisabled
                                        ? Colors.red.withOpacity(0.17)
                                        : Colors.green.withOpacity(0.17),
                                    size: 24),
                              ],
                            ),
                            const SizedBox(width: 6.0),
                            Text(isDisabled ? 'Disabled' : 'Active',
                                style: mediumTextStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: bottomPadding),
        ],
      ),
    );
  }

  Future<
      bool> confirmToggle(bool isDisabled) async => await showOkCancelAlertDialog(
          context: context,
          title: isDisabled ? 'Enable' : 'Disable',
          message:
              'Are you sure you want to ${isDisabled ? 'enable' : 'disable'} this gift card?',
          okLabel: 'Yes, ${isDisabled ? 'enable' : 'disable'}',
          isDestructiveAction: true)
      .then((value) => value == OkCancelResult.ok);
}
