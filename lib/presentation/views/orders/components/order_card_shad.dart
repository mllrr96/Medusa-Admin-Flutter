import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
import 'package:medusa_admin/core/extension/medusa_model_extension.dart';
import 'package:medusa_admin/core/extension/num_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/data/models/order_preference.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin/presentation/views/orders/components/payment_status_label.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadOrderCard extends StatelessWidget {
  const ShadOrderCard(this.order,
      {super.key, this.onTap, this.orderPreference, this.shimmer = false});
  final Order order;
  final void Function()? onTap;
  final OrderPreference? orderPreference;
  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    const manatee = ColorManager.manatee;
    final lightMediumTextStyle = mediumTextStyle?.copyWith(color: manatee);
    final orderPreference = this.orderPreference ?? PreferenceService.orderPreference;
    final customerName = order.customerName;

    return ShadCard(
      padding: EdgeInsets.zero,
      content: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        onTap: onTap ??
                () => context.pushRoute(OrderDetailsRoute(orderId: order.id!)),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('#${order.displayId}', style: mediumTextStyle),
                  Text(order.total.formatAsPrice(order.currencyCode),
                      style: mediumTextStyle),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.cart?.createdAt != null
                          ? '${order.cart!.createdAt.formatDate()} at ${order.cart!.createdAt.formatTime()}'
                          : '',
                      style: smallTextStyle?.copyWith(color: manatee),
                    ),
                    Row(
                      children: [
                        if (order.currencyCode != null)
                          Text(
                            order.currencyCode!.toUpperCase(),
                            style: lightMediumTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        if (order.shippingAddress?.countryCode != null &&
                            !orderPreference.hideFlag)
                          Flag.fromString(order.shippingAddress!.countryCode!,
                              height: 15, width: 30),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color:shimmer? context.theme.scaffoldBackgroundColor : ColorManager.getAvatarColor(
                                order.customer?.email),
                          ),
                          alignment: Alignment.center,
                          child:shimmer? null: Text(
                              customerName?[0] ?? order.customer?.email[0] ?? '',
                              style: const TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 6.0),
                        if (customerName!= null)
                          Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(customerName, style: smallTextStyle),
                                  if (orderPreference.includeEmail)
                                    Text(order.email ?? '',
                                        style:
                                        smallTextStyle?.copyWith(color: manatee)),
                                ],
                              )),
                        if (customerName == null)
                          Flexible(
                              child: Text(order.customer?.email ?? '',
                                  style: mediumTextStyle,
                                  overflow: TextOverflow.ellipsis)),
                      ],
                    ),
                  ),
                  Flexible(
                    child: PaymentStatusLabel(
                        paymentStatus: order.paymentStatus,
                        dotOnly: !orderPreference.paymentStatusDot),
                  ),
                ],
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           'Payment Status',
              //           style: smallTextStyle!.copyWith(color: manatee),
              //         ),
              //         Text(
              //           'Customer',
              //           style: smallTextStyle.copyWith(color: manatee),
              //         ),
              //       ],
              //     ),
              //     const SizedBox(height: 6.0),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Flexible(
              //           child: PaymentStatusLabel(paymentStatus: order.paymentStatus),
              //         ),
              //         Flexible(
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children: [
              //               CircleAvatar(
              //                 radius: 16,
              //                 child: Text(getName()?[0] ?? order.customer!.email[0]),
              //               ),
              //               const SizedBox(width: 6.0),
              //               if (getName() != null) Flexible(child: Text(getName()!, style: smallTextStyle)),
              //               if (getName() == null)
              //                 Flexible(
              //                     child: Text(order.customer!.email,
              //                         style: mediumTextStyle, overflow: TextOverflow.ellipsis)),
              //             ],
              //           ),
              //         )
              //       ],
              //     )
              //     // Opacity(
              //     //   opacity: order.status != OrderStatus.pending ? 1 : 0,
              //     //   child: InkWell(
              //     //     onTap: order.status != OrderStatus.pending ? () {} : null,
              //     //     child: Container(
              //     //       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
              //     //       decoration: BoxDecoration(
              //     //           border: Border.all(
              //     //             color: ColorManager.primary,
              //     //             width: 2,
              //     //           ),
              //     //           borderRadius: const BorderRadius.all(Radius.circular(4))),
              //     //       child: Row(
              //     //         children: [
              //     //           Icon(Icons.refresh, color: ColorManager.primary),
              //     //           Text(
              //     //             'Reorder',
              //     //             style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.primary),
              //     //           ),
              //     //         ],
              //     //       ),
              //     //     ),
              //     //   ),
              //     // ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImages(BuildContext context) {
    if (order.items!.length > 3) {
      return Row(
        children: [
          ...List.generate(
              3,
                  (index) => Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey.shade300),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                                order.items![index].thumbnail!))),
                  ),
                  const SizedBox(width: 10)
                ],
              )),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Center(
                child: Text('+ ${order.items!.length - 3}',
                    style: context.bodySmall?.copyWith(
                        color: context.isDark ? Colors.white : Colors.grey))),
          ),
        ],
      );
    }

    return Row(
      children: List.generate(
          order.items!.length,
              (index) => Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(color: Colors.grey.shade300),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            order.items![index].thumbnail!))),
              ),
              const SizedBox(width: 10)
            ],
          )),
    );
  }
}
