import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';

class PersonalInfoTile extends StatelessWidget {
  const PersonalInfoTile(this.user, {super.key, this.onTap});
  final User? user;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:
        const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        padding:
        const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: context.theme.appBarTheme.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Manage your Medusa profile',
                    style: smallTextStyle!
                        .copyWith(color: lightWhite)),
              ),
              const Divider(),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                    ColorManager.getAvatarColor(
                        user?.email),
                    radius: 25,
                    child: Text(
                        user?.firstName != null
                            ? user!.firstName![0].capitalize ?? ''
                            : user?.email?[0].capitalize ?? '',
                        style: largeTextStyle?.copyWith(
                            color: Colors.white)),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        if (user?.firstName != null &&
                            user?.lastName != null)
                          Text(
                              '${user!.firstName!} ${user!.lastName!}'),
                        if (user?.firstName != null &&
                            user?.lastName != null)
                          const SizedBox(height: 6.0),
                        Text(user?.email ?? ''),
                      ],
                    ),
                  )
                ],
              ),
            ]
        ),
      ),
    );
  }
}
