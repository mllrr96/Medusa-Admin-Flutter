import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../components/adaptive_icon.dart';
import 'user_role_label.dart';

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
    final name = getName(user: user);
    final firstLetter = getName(user: user, firstLetterOnly: true);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor, borderRadius: const BorderRadius.all(Radius.circular(16.0))),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Row(
                  children: [
                    if (firstLetter != null || email.isNotEmpty)
                      CircleAvatar(
                        backgroundColor: ColorManager.getAvatarColor(email),
                        child: Text(firstLetter ?? email[0].toUpperCase(), style: largeTextStyle?.copyWith(color: Colors.white)),
                      ),
                    if (firstLetter != null || email.isNotEmpty) const SizedBox(width: 6.0),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AdaptiveIcon(
                      onPressed: () async {
                        await showModalActionSheet<int>(
                            title: 'Manage user',
                            message: '${user.firstName ?? ''} ${user.lastName ?? ''}',
                            context: context,
                            actions: <SheetAction<int>>[
                              const SheetAction(label: 'Edit User', key: 0),
                              const SheetAction(label: 'Remove User', isDestructiveAction: true, key: 1),
                            ]).then((result) async {
                          switch (result) {
                            case 0:
                              if (onEditTap != null) {
                                onEditTap!();
                              }
                              return;
                            case 1:
                              if (onDeleteTap != null) {
                                onDeleteTap!();
                              }
                              return;
                          }
                        });
                      },
                      icon: const Icon(Icons.more_horiz_rounded)),
                  if (user.role != null) UserRoleLabel(userRole: user.role!),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  String? getName({required User user, bool firstLetterOnly = false}) {
    if (user.firstName != null && user.lastName != null) {
      if (user.firstName!.isEmpty) {
        return null;
      }
      if (firstLetterOnly) {
        return user.firstName![0];
      } else {
        return '${user.firstName!} ${user.lastName!}';
      }
    }
    return null;
  }
}
