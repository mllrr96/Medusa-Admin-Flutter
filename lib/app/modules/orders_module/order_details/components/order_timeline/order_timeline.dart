import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/header_card.dart';
import 'package:medusa_admin/app/modules/components/search_text_field.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/controllers/order_details_controller.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'index.dart';

class OrderTimeline extends StatelessWidget {
  const OrderTimeline(this.order, {super.key, this.onExpansionChanged});
  final Order order;
  final void Function(bool)? onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return GetBuilder<OrderDetailsController>(
      id: 5,
      builder: (controller) {
        return HeaderCard(
          key: controller.timelineKey,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text('Timeline'),
          trailing: IconButton(
              onPressed: () async {
                await showModalActionSheet<int>(
                    context: context,
                    actions: <SheetAction<int>>[
                      SheetAction(label: tr.timelineRequestReturn, key: 0),
                      SheetAction(label: tr.timelineRegisterExchange, key: 1),
                      SheetAction(label: tr.timelineRegisterClaim, key: 2),
                    ]).then((result) {
                  switch (result) {
                    case 0:
                    case 1:
                    case 2:
                  }
                });
              },
              icon: const Icon(Icons.more_horiz)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    case ConnectionState.none ||
                          ConnectionState.waiting ||
                          ConnectionState.active:
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
                              case const (OrderEdit):
                                if ((item as OrderEdit).requestedAt != null) {
                                  return OrderEditWidget(item);
                                } else {
                                  return OrderEditStatusWidget(order,
                                      orderEdit: item);
                                }
                              case const (Note):
                                return OrderNoteWidget(
                                  item,
                                  onNoteDelete: () async =>
                                      controller.deleteNote(item.draftId),
                                );
                              case const (Refund):
                                return RefundWidget(item,
                                    currencyCode: order.currencyCode);
                              case const (Notification):
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
                        OutlinedButton(
                            onPressed: () {}, child: const Text('Retry'))
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
          ),
        );
      },
    );
  }
}
