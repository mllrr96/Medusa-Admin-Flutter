// import 'dart:io';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
// import 'package:medusa_admin/app/modules/draft_orders_module/create_draft_order/controllers/create_draft_order_controller.dart';
// import 'package:medusa_admin/app/routes/app_pages.dart';
//
// import 'pick_product_variants/controllers/pick_product_variants_controller.dart';
//
// class ChooseItemsView extends StatelessWidget {
//   const ChooseItemsView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final smallTextStyle = Theme.of(context).textTheme.titleSmall;
//     return GetBuilder<CreateDraftOrderController>(
//       id: 1,
//       builder: (controller) {
//         return Scaffold(
//           bottomNavigationBar: Container(
//             color: Theme.of(context).appBarTheme.backgroundColor,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 AdaptiveButton(
//                     onPressed: () {},
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Platform.isIOS ? CupertinoIcons.add : Icons.add),
//                         const Text('Add Custom'),
//                       ],
//                     )),
//                 AdaptiveButton(
//                     onPressed: () async {
//                       // final result = await Get.toNamed(Routes.PICK_PRODUCT_VARIANTS,
//                       //     arguments: SelectProductsReq(selectedProducts: controller.selectedProducts));
//                       // if (result is SelectProductsRes) {
//                       //   controller.selectedProducts = result.selectedProductVariants ?? [];
//                       //   controller.update([0, 1]);
//                       // }
//                     },
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Platform.isIOS ? CupertinoIcons.add : Icons.add),
//                         const Text('Add Existing'),
//                       ],
//                     )),
//               ],
//             ),
//           ),
//           body: SafeArea(
//             child: ListView.separated(
//               separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
//               itemCount: controller.selectedProducts.length,
//               itemBuilder: (context, index) {
//                 final productVariant = controller.selectedProducts[index];
//                 return ListTile(
//                   isThreeLine: true,
//                   leading: productVariant.product?.thumbnail != null
//                       ? SizedBox(
//                           width: 45,
//                           child: CachedNetworkImage(
//                             key: ValueKey(productVariant.product!.thumbnail!),
//                             imageUrl: productVariant.product!.thumbnail!,
//                             placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
//                             errorWidget: (context, string, error) =>
//                                 const Icon(Icons.warning_rounded, color: Colors.redAccent),
//                           ))
//                       : null,
//                   title: Text(productVariant.product?.title ?? ''),
//                   subtitle:
//                       Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
//                     Text(productVariant.title ?? '', style: smallTextStyle),
//                     Text(
//                         '${productVariant.prices?[0].amount?.toString() ?? ''} ${productVariant.prices?[0].currencyCode?.toUpperCase() ?? ''}',
//                         style: smallTextStyle),
//                   ]),
//                   // trailing: ,
//                 );
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
