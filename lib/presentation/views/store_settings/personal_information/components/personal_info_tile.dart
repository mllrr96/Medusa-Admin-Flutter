import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PersonalInfoTile extends StatelessWidget {
  const PersonalInfoTile(this.user, {super.key, this.onTap});
  final User? user;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final largeTextStyle = context.bodyLarge;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: ShadCard(
          title: const Text('Manage your Medusa profile'),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ColorManager.getAvatarColor(user?.email),
                      radius: 20,
                      child: Text(
                          user?.firstName != null
                              ? user!.firstName![0].capitalize
                              : user?.email?[0].capitalize ?? '',
                          style: largeTextStyle?.copyWith(color: Colors.white)),
                    ),
                    const Gap(8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (user?.firstName != null && user?.lastName != null)
                            Text('${user!.firstName!} ${user!.lastName!}'),
                          Text(user?.email ?? ''),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
