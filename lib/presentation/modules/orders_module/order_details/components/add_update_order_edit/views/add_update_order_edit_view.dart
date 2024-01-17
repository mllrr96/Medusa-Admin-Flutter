import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/order_edit_use_case.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import '../../../../../draft_orders_module/create_draft_order/components/pick_product_variants/controllers/pick_product_variants_controller.dart';
import '../controllers/add_update_order_edit_controller.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class AddUpdateOrderEditView extends StatelessWidget {
  const AddUpdateOrderEditView(this.order, {super.key});
  final Order? order;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddUpdateOrderEditController>(
        init: AddUpdateOrderEditController(
            orderEditUseCase: OrderEditUseCase.instance, order: order),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Order edit'),
                actions: [
                  controller.obx(
                    (state) => TextButton(
                        onPressed: controller.state?.id != null
                            ? () async =>
                                controller.save(controller.state!.id!, context)
                            : null,
                        child: const Text('Save')),
                    onLoading: const SizedBox.shrink(),
                    onError: (_) => const SizedBox.shrink(),
                  )
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
                      controller: controller.noteCtrl,
                      fillColor: context.theme.scaffoldBackgroundColor,
                      hintText: 'Add a note',
                      prefixIconData: Icons.tag_faces,
                      onSuffixTap: () async {
                        if (controller.state?.id == null) {
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
                            await controller.updateOrderEdit(
                                orderEditId: controller.state!.id!,
                                internalNote: '');
                          }
                        });
                      },
                      maxLines: null,
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      textInputAction: TextInputAction.send,
                      textCapitalization: TextCapitalization.sentences,
                      onSubmitted: (_) async {
                        if (controller.state?.id != null && _.isNotEmpty) {
                          await controller.updateOrderEdit(
                              orderEditId: controller.state!.id!,
                              internalNote: _);
                        }
                      },
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                  child: controller.obx(
                (orderEdit) {
                  return EditOrderItems(orderEdit: orderEdit!);
                },
                onError: (e) => SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error loading order edit \n ${e ?? ''}',
                        style: context.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12.0),
                      FilledButton(
                          onPressed: () async =>
                              await controller.fetchOrderEdits(),
                          child: const Text('Retry')),
                    ],
                  ),
                ),
                onLoading:
                    const Center(child: CircularProgressIndicator.adaptive()),
              )));
        });
  }
}

class EditOrderItems extends GetView<AddUpdateOrderEditController> {
  const EditOrderItems({super.key, required this.orderEdit});

  final OrderEdit orderEdit;

  @override
  Widget build(BuildContext context) {
    final tr = context.tr;
    final currencyCode = controller.order?.currencyCode;
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
                    await controller.addLineItems(
                        context: context,
                        orderEditId: orderEdit.id!,
                        items: result.selectedProductVariants!);
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
                                  await controller.deleteLineItem(
                                      orderEditId: orderEdit.id!,
                                      itemId: item.id!);
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
                                    await controller.updateLineItem(
                                        orderEditId: orderEdit.id!,
                                        itemId: item.id!,
                                        quantity: item.quantity! - 1);
                                  }
                                }
                              : null,
                          icon: const Icon(CupertinoIcons.minus),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(((item.quantity ?? 0) +
                                  (addedItems[item.id] ?? 0))
                              .toString()),
                        ),
                        IconButton(
                          onPressed: () async {
                            await controller.updateLineItem(
                                orderEditId: orderEdit.id!,
                                itemId: item.id!,
                                quantity: item.quantity! + 1);
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
