import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/medusa_model_extension.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

import '../../../../../../core/constant/colors.dart';
import 'user_role_label.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
    required this.user,
    this.onEditTap,
    this.onDeleteTap,
  });
  final User user;
  final void Function()? onEditTap;
  final void Function()? onDeleteTap;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final email = user.email ?? '';
    final name = user.fullName;
    final firstLetter = user.fullName?[0];
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: Row(
        children: [
          if (user.role != null) UserRoleLabel(userRole: user.role!),
          const Gap(5.0),
          Flexible(
            child: Row(
              children: [
                if (firstLetter != null || email.isNotEmpty)
                  CircleAvatar(
                    backgroundColor: ColorManager.getAvatarColor(email),
                    child: Text(firstLetter ?? email[0].toUpperCase(),
                        style:
                            largeTextStyle?.copyWith(color: Colors.white)),
                  ),
                if (firstLetter != null || email.isNotEmpty)
                  const SizedBox(width: 6.0),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (name != null) Text(name, style: largeTextStyle),
                      if (name != null) const SizedBox(height: 6.0),
                      Text(email, style: mediumTextStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(16.0),
              onPressed: () async {
                await showModalActionSheet<int>(
                    title: 'Manage user',
                    message:
                        '${user.firstName ?? ''} ${user.lastName ?? ''}',
                    context: context,
                    actions: <SheetAction<int>>[
                      const SheetAction(label: 'Edit User', key: 0),
                      if(AuthPreferenceService.email != user.email)
                      const SheetAction(
                          label: 'Remove User',
                          isDestructiveAction: true,
                          key: 1),
                    ]).then((result) async {
                  switch (result) {
                    case 0:
                      onEditTap?.call();
                      return;
                    case 1:
                      onDeleteTap?.call();
                      return;
                  }
                });
              },
              icon: const Icon(Icons.more_horiz_rounded))
        ],
      ),
    );
  }
}
