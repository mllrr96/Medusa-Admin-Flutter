import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile(this.customer,
      {super.key, required this.index, this.onEditTap, this.onDeleteTap, this.shimmer = false});
  final Customer customer;
  final int index;
  final void Function(BuildContext)? onEditTap;
  final void Function(BuildContext)? onDeleteTap;
  final bool shimmer;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    return Slidable(
      groupTag: const Key('customers'),
      key: ValueKey(customer.id!),
      endActionPane: ActionPane(
        extentRatio: 0.4,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: onEditTap,
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: MedusaIcons.pencil_square_solid,
          ),
          SlidableAction(
            onPressed: onDeleteTap,
            backgroundColor: Colors.redAccent,
            foregroundColor: Colors.white,
            icon: Icons.delete_forever,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          horizontalTitleGap: 8,
          tileColor:
              index.isOdd ? context.theme.appBarTheme.backgroundColor : null,
          leading: CircleAvatar(
            backgroundColor:shimmer ? context.theme.scaffoldBackgroundColor: ColorManager.getAvatarColor(customer.email),
            maxRadius: 18,
            child:shimmer ? null: Text(
                customer.firstName == null
                    ? customer.email[0].capitalize
                    : customer.firstName![0],
                style: largeTextStyle!.copyWith(color: Colors.white)),
          ),
          title: customer.firstName != null
              ? Text('${customer.firstName ?? ''} ${customer.lastName ?? ''}',
                  style: mediumTextStyle)
              : Text(customer.email, style: mediumTextStyle),
          subtitle: customer.firstName != null
              ? Text(customer.email, style: mediumTextStyle)
              : null,
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (customer.createdAt != null)
                Text(
                  customer.createdAt.formatDate(),
                  style: smallTextStyle,
                ),
              if (customer.orders != null)
                Text('Orders: ${customer.orders!.length}', style: smallTextStyle),
            ],
          ),
          onTap: () =>
              context.pushRoute(CustomerDetailsRoute(customerId: customer.id!)),
        ),
      ),
    );
  }
}
