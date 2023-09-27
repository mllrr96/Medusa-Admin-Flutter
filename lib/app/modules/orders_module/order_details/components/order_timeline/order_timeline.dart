import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/components/search_text_field.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'index.dart';
import 'package:medusa_admin/app/data/models/store/index.dart' as medusa;

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
            SearchTextField(
              controller: controller.noteCtrl,
              fillColor: context.theme.scaffoldBackgroundColor,
              hintText: 'Write a note',
              prefixIconData: Icons.tag_faces,
              suffixIconData: Icons.send,
              onSuffixTap: () async => await controller.addNote(),
              maxLines: null,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              textInputAction: TextInputAction.send,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (_) async => await controller.addNote(),
            ),
            const Divider(),
            FutureBuilder<List?>(
              future: controller.timeLineFuture,
              builder: (context, asyncSnapshot) {
                switch (asyncSnapshot.connectionState) {
                  case ConnectionState.none || ConnectionState.waiting || ConnectionState.active:
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  case ConnectionState.done:
                    if (asyncSnapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: asyncSnapshot.data?.length,
                        itemBuilder: (context, index) {
                          final item = asyncSnapshot.data?[index];
                          switch (item.runtimeType) {
                            case OrderEdit:
                              return OrderEditWidget(order, orderEdit: item);
                            case Note:
                              return OrderNoteWidget(
                                item,
                                onNoteDelete: () async => controller.deleteNote(item.id),
                              );
                            case Refund:
                              return RefundWidget(item, currency: order.currency!);
                            case medusa.Notification:
                              return const SizedBox();
                            default:
                              return const SizedBox();
                          }
                        },
                      );
                    } else if (!asyncSnapshot.hasData) {
                      return const SizedBox.shrink();
                    }
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
              },
            ),
            OrderPlacedWidget(order),
          ],
        );
      },
    );
  }
}
