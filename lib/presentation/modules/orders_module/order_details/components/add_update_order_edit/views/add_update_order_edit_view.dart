import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/order_edit_crud/order_edit_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/pick_product_variants/controllers/pick_product_variants_controller.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class AddUpdateOrderEditView extends StatefulWidget {
  const AddUpdateOrderEditView(this.order, {super.key});
  final Order order;

  @override
  State<AddUpdateOrderEditView> createState() => _AddUpdateOrderEditViewState();
}

class _AddUpdateOrderEditViewState extends State<AddUpdateOrderEditView> {
  late OrderEditCrudBloc orderEditCrudBloc;
  Order get order => widget.order;
  String get orderId => order.id!;
  final noteCtrl = TextEditingController();

  @override
  void initState() {
    orderEditCrudBloc = OrderEditCrudBloc.instance;
    orderEditCrudBloc.add(
        OrderEditCrudEvent.loadAll(queryParameters: {'order_id': orderId}));
    super.initState();
  }

  @override
  void dispose() {
    orderEditCrudBloc.close();
    noteCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderEditCrudBloc, OrderEditCrudState>(
      bloc: orderEditCrudBloc,
      listener: (context, state) {
        state.maybeWhen(
          orderEdits: (orderEdits, count) {
            final createdOrderEdits = orderEdits
                .where((element) => element.status == OrderEditStatus.created);
            if (orderEdits.isEmpty || createdOrderEdits.isEmpty) {
              orderEditCrudBloc.add(OrderEditCrudEvent.create(orderId, null));
            } else {
              // controller.change(createdOrderEdits.first);
              noteCtrl.text = createdOrderEdits.first.internalNote ?? '';
            }
          },
          error: (error) {
            context.showSnackBar(error.toSnackBarString());
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final orderEdit = state.mapOrNull(
            orderEdits: (_) => _.orderEdits.firstWhereOrNull(
                (element) => element.status == OrderEditStatus.created));
        return Scaffold(
          appBar: AppBar(
            title: const Text('Order edit'),
            actions: [
              if (orderEdit != null)
                TextButton(
                    onPressed: () => orderEditCrudBloc
                        .add(OrderEditCrudEvent.request(orderEdit.id!)),
                    child: const Text('Save')),
            ],
          ),
          bottomNavigationBar: Container(
              color: context.theme.appBarTheme.backgroundColor,
              height: context.bottomViewPadding),
          bottomSheet: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: context.theme.appBarTheme.backgroundColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: SearchTextField(
                  controller: noteCtrl,
                  fillColor: context.theme.scaffoldBackgroundColor,
                  hintText: 'Add a note',
                  prefixIconData: Icons.tag_faces,
                  onSuffixTap: () async {
                    if (orderEdit?.id == null) {
                      return;
                    }
                    await showOkCancelAlertDialog(
                      context: context,
                      title: 'Delete note?',
                      message: 'Are you sure you want to delete note?',
                      isDestructiveAction: true,
                      okLabel: 'Yes, delete',
                    ).then((result) async {
                      if (result == OkCancelResult.ok) {
                        orderEditCrudBloc
                            .add(OrderEditCrudEvent.update(orderEdit!.id!, ''));
                      }
                    });
                  },
                  maxLines: null,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  textInputAction: TextInputAction.send,
                  textCapitalization: TextCapitalization.sentences,
                  onSubmitted: (_) async {
                    if (orderEdit?.id != null && _.isNotEmpty) {
                      orderEditCrudBloc
                          .add(OrderEditCrudEvent.update(orderEdit!.id!, _));
                    }
                  },
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: state.maybeMap(
              orderEdits: (_) {
                if (orderEdit != null) {
                  return EditOrderItems(
                    orderEdit: orderEdit,
                    order: order,
                    onAddLineItem: (id, variants) {
                      // for (var element in variants) {
                      //   orderEditCrudBloc.add(OrderEditCrudEvent.addLineItem(
                      //       id,
                      //       UserAddLineItemReq(
                      //           quantity: 1, variantId: element.id!)));
                      // }
                    },
                    onUpsetLineItem: (id, itemId, quantity) {
                      orderEditCrudBloc.add(OrderEditCrudEvent.upsertLineItem(
                          id, itemId, quantity));
                    },
                    onDeleteLineItem: (id, itemId) {
                      orderEditCrudBloc
                          .add(OrderEditCrudEvent.deleteLineItem(id, itemId));
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              error: (_) => SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _.failure.toString(),
                      style: context.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12.0),
                    FilledButton(
                        onPressed: () => orderEditCrudBloc.add(
                            OrderEditCrudEvent.loadAll(
                                queryParameters: {'order_id': orderId})),
                        child: const Text('Retry')),
                  ],
                ),
              ),
              loading: (_) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}

class EditOrderItems extends StatelessWidget {
  const EditOrderItems(
      {super.key,
      required this.orderEdit,
      required this.order,
      this.onUpsetLineItem,
      this.onAddLineItem,
      this.onDeleteLineItem});

  final OrderEdit orderEdit;
  final Order order;
  final void Function(String id, String itemId, int quantity)? onUpsetLineItem;
  final void Function(String id, List<ProductVariant> variants)? onAddLineItem;
  final void Function(String id, String itemId)? onDeleteLineItem;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final currencyCode = order.currencyCode;
    final differenceDue = orderEdit.differenceDue ?? 0;
    Map<String, int> addedItems = {};
    List<LineItem> lineItems = List<LineItem>.from(orderEdit.items!);
    lineItems.sort((a, b) => a.id!.compareTo(b.id!));
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(tr.editItems, style: context.bodyLarge),
            TextButton(
                onPressed: () async {
                  final result =
                      await context.pushRoute(PickProductVariantsRoute());
                  if (result is SelectProductsRes &&
                      (result.selectedProductVariants?.isNotEmpty ?? false) &&
                      context.mounted) {
                    onAddLineItem?.call(
                        orderEdit.id!, result.selectedProductVariants!);
                    // await controller.addLineItems(
                    //     context: context,
                    //     orderEditId: orderEdit.id!,
                    //     items: result.selectedProductVariants!);
                  }
                },
                child: Text(tr.editAddItems)),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lineItems.length,
          separatorBuilder: (_, __) => const Gap(10),
          itemBuilder: (context, index) {
            final item = lineItems[index];
            final itemQuantity = (item.quantity ?? 1) +
                (addedItems.containsKey(item.id) ? addedItems[item.id]! : 0);
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Row(
                    children: [
                      if (item.thumbnail?.isNotEmpty ?? false)
                        SizedBox(
                            width: 50,
                            child:
                                CachedNetworkImage(imageUrl: item.thumbnail!)),
                      const Gap(10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title ?? '', style: context.bodyLarge),
                            Text(item.variant?.title ?? '',
                                style: context.bodyMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(((item.unitPrice ?? 1) * itemQuantity)
                            .formatAsPrice(currencyCode)),
                        const Gap(5),
                        Text(
                          currencyCode?.toUpperCase() ?? '',
                          style: context.bodyMedium
                              ?.copyWith(color: ColorManager.manatee),
                        ),
                        IconButton(
                            onPressed: () async {
                              final result = await showModalActionSheet(
                                  context: context,
                                  actions: <SheetAction>[
                                    SheetAction(
                                        label: tr.orderLineReplaceWithOtherItem,
                                        key: 0),
                                    SheetAction(
                                        label: tr.orderLineDuplicateItem,
                                        key: 1),
                                    SheetAction(
                                        label: tr.orderLineRemoveItem,
                                        key: 2,
                                        isDestructiveAction: true),
                                  ]);
                              switch (result) {
                                case 0:
                                  break;

                                case 1:
                                  break;

                                case 2:
                                  onDeleteLineItem?.call(
                                      orderEdit.id!, item.id!);
                                  // await controller.deleteLineItem(
                                  //     orderEditId: orderEdit.id!,
                                  //     itemId: item.id!);
                                  break;
                              }
                            },
                            icon: const Icon(Icons.more_horiz))
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: item.quantity! > 1
                              ? () async {
                                  final canRemove = item.quantity! > 1;
                                  if (canRemove) {
                                    onUpsetLineItem?.call(orderEdit.id!,
                                        item.id!, item.quantity! - 1);
                                    // await controller.updateLineItem(
                                    //     orderEditId: orderEdit.id!,
                                    //     itemId: item.id!,
                                    //     quantity: item.quantity! - 1);
                                  }
                                }
                              : null,
                          icon: const Icon(CupertinoIcons.minus),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(((item.quantity ?? 0) +
                                  (addedItems[item.id] ?? 0))
                              .toString()),
                        ),
                        IconButton(
                          onPressed: () async {
                            onUpsetLineItem?.call(
                                orderEdit.id!, item.id!, item.quantity! + 1);
                            // await controller.updateLineItem(
                            //     orderEditId: orderEdit.id!,
                            //     itemId: item.id!,
                            //     quantity: item.quantity! + 1);
                          },
                          icon: const Icon(CupertinoIcons.add),
                        )
                      ],
                    )
                  ],
                ),
              ],
            );
          },
        ),
        if (differenceDue != 0)
          Column(
            children: [
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tr.editAmountPaid, style: context.bodyLarge),
                  Row(
                    children: [
                      Text(orderEdit.total?.formatAsPrice(currencyCode) ?? '',
                          style: context.bodyLarge),
                      Text(' ${currencyCode?.toUpperCase() ?? ''}',
                          style: context.bodyLarge
                              ?.copyWith(color: ColorManager.manatee))
                    ],
                  ),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tr.editNewTotal, style: context.headlineMedium),
                  Text(
                      ((orderEdit.total ?? 0) + differenceDue)
                          .formatAsPrice(currencyCode),
                      style: context.headlineMedium),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tr.editDifferenceDue, style: context.bodyLarge),
                  Row(
                    children: [
                      Text(
                        differenceDue.formatAsPrice(currencyCode),
                        style: context.bodyLarge?.copyWith(
                            color: differenceDue.isNegative
                                ? null
                                : Colors.greenAccent),
                      ),
                      Text(' ${currencyCode?.toUpperCase() ?? ''}',
                          style: context.bodyLarge
                              ?.copyWith(color: ColorManager.manatee))
                    ],
                  ),
                ],
              ),
            ],
          ),
        const Gap(20),
      ],
    );
  }
}
