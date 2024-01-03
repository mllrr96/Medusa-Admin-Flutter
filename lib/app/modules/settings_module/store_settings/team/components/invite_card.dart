import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/team/components/index.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

import '../../../../../../core/utils/colors.dart';

class InviteCard extends StatelessWidget {
  const InviteCard({
    super.key,
    required this.invite,
    this.onResendTap,
    this.onDeleteTap,
  });
  final Invite invite;
  final void Function()? onResendTap;
  final void Function()? onDeleteTap;
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    final email = invite.userEmail ?? '';
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
                    CircleAvatar(
                      backgroundColor: ColorManager.getAvatarColor(email),
                      child: Text(email[0].toUpperCase(), style: largeTextStyle?.copyWith(color: Colors.white)),
                    ),
                    const SizedBox(width: 6.0),
                    Flexible(child: Text(email, style: mediumTextStyle)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () async {
                        await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                          const SheetAction(label: 'Resend Invitation', key: 0),
                          const SheetAction(label: 'Copy Invite Link', key: 1),
                          const SheetAction(label: 'Remove Invitation', isDestructiveAction: true, key: 2),
                        ]).then((result) async {
                          switch (result) {
                            case 0:
                              if (onResendTap != null) {
                                onResendTap!();
                              }
                              return;
                            case 1:
                              await Clipboard.setData(ClipboardData(text: invite.token ?? '' )).then((value) =>
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(content: Text('Token copied'))));
                              return;
                            case 2:
                              if (onDeleteTap != null) {
                                onDeleteTap!();
                              }
                              return;
                          }
                        });
                      },
                      icon: const Icon(Icons.more_horiz_rounded)),
                  InviteStatusLabel(accepted: invite.accepted)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
