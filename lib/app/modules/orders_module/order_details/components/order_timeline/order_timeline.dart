import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'index.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline(this.order, {Key? key, this.onExpansionChanged}) : super(key: key);
  final Order order;
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    return GetBuilder<OrderDetailsController>(
      id: 5,
      builder: (controller) {
        return CustomExpansionTile(
          key: controller.timelineKey,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text('Timeline'),
          trailing: IconButton(
              onPressed: () async {
                await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                  SheetAction(label: tr.requestReturn, key: 0),
                  SheetAction(label: tr.registerExchange, key: 1),
                  SheetAction(label: tr.registerClaim, key: 2),
                ]).then((result) {
                  switch (result) {
                    case 0:
                    case 1:
                    case 2:
                  }
                });
              },
              icon: const Icon(Icons.more_horiz)),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(controller.notes?.isNotEmpty ?? false)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.notes?.length,
              itemBuilder: (context, index) {
                final note = controller.notes?[index];
                if(note == null){
                  return const SizedBox.shrink();
                }
                return OrderNoteWidget(
                  note,
                  onNoteDelete: () async => controller.deleteNote(note.id),
                );
              },
            ),
            if(order.refunds?.isNotEmpty ?? false)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.refunds?.length,
              itemBuilder: (context, index) {
                final refund = order.refunds?[index];
                return RefundWidget(refund!, currency: order.currency!);
              },
            ),
            FutureBuilder<List<OrderEdit>?>(
                future: controller.fetchOrderEdits(),
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: asyncSnapshot.data?.length,
                      itemBuilder: (context, index) {
                        final orderEdit = asyncSnapshot.data?[index];
                        if (orderEdit == null) {
                          return const SizedBox.shrink();
                        }
                        return OrderEditWidget(order, orderEdit: orderEdit);
                      },
                    );
                  } else if (!asyncSnapshot.hasData) {
                    return const SizedBox.shrink();
                  }

                  if (asyncSnapshot.hasError) {
                    return Column(
                      children: [
                        const Text('Error fetching order edits'),
                        OutlinedButton(onPressed: () {}, child: const Text('Retry'))
                      ],
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }),
            OrderPlacedWidget(order),
          ],
        );
      },
    );
  }
}
