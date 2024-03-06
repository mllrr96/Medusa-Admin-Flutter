import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/note_crud/note_crud_bloc.dart';
import 'package:medusa_admin/presentation/blocs/notification/notification_bloc.dart';
import 'package:medusa_admin/presentation/blocs/order_edit_crud/order_edit_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'index.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class OrderTimeline extends StatefulWidget {
  const OrderTimeline(this.order, {super.key, this.onExpansionChanged});

  final Order order;
  final void Function(bool)? onExpansionChanged;

  @override
  State<OrderTimeline> createState() => _OrderTimelineState();
}

class _OrderTimelineState extends State<OrderTimeline> {
  final noteCtrl = TextEditingController();
  late NoteCrudBloc noteCrudBloc;
  late OrderEditCrudBloc orderEditCrudBloc;
  late NotificationBloc notificationBloc;

  @override
  void initState() {
    noteCrudBloc = NoteCrudBloc.instance;
    orderEditCrudBloc = OrderEditCrudBloc.instance;
    notificationBloc = NotificationBloc.instance;
    orderEditCrudBloc.add(
      OrderEditCrudEvent.loadAll(
          queryParameters: {'order_id': widget.order.id}),
    );
    super.initState();
  }

  @override
  void dispose() {
    noteCrudBloc.close();
    orderEditCrudBloc.close();
    notificationBloc.close();
    noteCtrl.dispose();
    super.dispose();
  }

  void createNote() {
    if (noteCtrl.text.removeAllWhitespace.isEmpty) {
      return;
    }
    noteCrudBloc.add(
      NoteCrudEvent.create(widget.order.id!, 'order', noteCtrl.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    return BlocListener<NoteCrudBloc, NoteCrudState>(
      bloc: noteCrudBloc,
      listener: (context, state) {
        state.mapOrNull(note: (_) {
          noteCtrl.clear();
          context.showSnackBar('Note created');
          // refresh timeline
        }, deleted: (_) {
          context.showSnackBar('Note deleted');
          // refresh timeline
        });
      },
      child: FlexExpansionTile(
        onExpansionChanged: widget.onExpansionChanged,
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
              controller: noteCtrl,
              fillColor: context.theme.scaffoldBackgroundColor,
              hintText: 'Write a note',
              prefixIconData: Icons.tag_faces,
              suffixIconData: Icons.send,
              onSuffixTap: () => createNote(),
              maxLines: null,
              contentPadding: const EdgeInsets.symmetric(vertical: 5),
              textInputAction: TextInputAction.send,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (_) => createNote(),
            ),
            const Divider(),
            // FutureBuilder<List?>(
            //   // future: controller.timeLineFuture,
            //   builder: (context, asyncSnapshot) {
            //     switch (asyncSnapshot.connectionState) {
            //       case ConnectionState.none ||
            //       ConnectionState.waiting ||
            //       ConnectionState.active:
            //         return const Center(
            //           child: CircularProgressIndicator.adaptive(),
            //         );
            //       case ConnectionState.done:
            //         if (asyncSnapshot.hasData) {
            //           return ListView.builder(
            //             shrinkWrap: true,
            //             physics: const NeverScrollableScrollPhysics(),
            //             itemCount: asyncSnapshot.data?.length,
            //             itemBuilder: (context, index) {
            //               final item = asyncSnapshot.data?[index];
            //               switch (item.runtimeType) {
            //                 case const (OrderEdit):
            //                   if ((item as OrderEdit).requestedAt != null) {
            //                     return OrderEditWidget(item);
            //                   } else {
            //                     return OrderEditStatusWidget(widget.order,
            //                         orderEdit: item);
            //                   }
            //                 case const (Note):
            //                   return OrderNoteWidget(
            //                     item,
            //                     onNoteDelete: () {
            //                       noteCrudBloc.add(
            //                         NoteCrudEvent.delete(
            //                             (item as Note).id ?? ''),
            //                       );
            //                     },
            //                   );
            //                 case const (Refund):
            //                   return RefundWidget(item,
            //                       currencyCode: widget.order.currencyCode);
            //                 case const (Notification):
            //                   return const SizedBox();
            //                 default:
            //                   return const SizedBox();
            //               }
            //             },
            //           );
            //         } else if (!asyncSnapshot.hasData) {
            //           return const SizedBox.shrink();
            //         }
            //     }
            //
            //     if (asyncSnapshot.hasError) {
            //       return Column(
            //         children: [
            //           const Text('Error fetching order edits'),
            //           OutlinedButton(
            //               onPressed: () {}, child: const Text('Retry'))
            //         ],
            //       );
            //     }
            //
            //     return const Center(
            //       child: CircularProgressIndicator.adaptive(),
            //     );
            //   },
            // ),
            OrderPlacedWidget(widget.order),
          ],
        ),
      ),
    );
  }
}
