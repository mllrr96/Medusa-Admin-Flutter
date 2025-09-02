import 'package:flutter/material.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

class UserRoleLabel extends StatelessWidget {
  const UserRoleLabel({super.key, required this.userRole});
  final String userRole;
  @override
  Widget build(BuildContext context) {
    var containerColor = ColorManager.primary.withOpacity(0.17);
    var textColor = ColorManager.primary;
    String text = 'Admin';
    switch (userRole) {
      case 'admin':
        containerColor = Colors.redAccent.withOpacity(0.17);
        textColor = Colors.redAccent;
        text = 'Admin';
        break;
      case 'developer':
        containerColor = Colors.orange.withOpacity(0.17);
        textColor = Colors.orange;
        text = 'Developer';
        break;
      case 'member':
        containerColor = ColorManager.primary.withOpacity(0.17);
        textColor = ColorManager.primary;
        text = 'Member';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          text,
          style: context.bodySmall?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
