import 'package:flutter/material.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/extension.dart';

class UserRoleLabel extends StatelessWidget {
  const UserRoleLabel({super.key, required this.userRole});
  final UserRole userRole;
  @override
  Widget build(BuildContext context) {
    var containerColor = ColorManager.primary.withOpacity(0.17);
    var textColor = ColorManager.primary;
    String text = 'Admin';
    switch (userRole) {
      case UserRole.admin:
        containerColor = Colors.redAccent.withOpacity(0.17);
        textColor = Colors.redAccent;
        text = 'Admin';
        break;
      case UserRole.developer:
        containerColor = Colors.orange.withOpacity(0.17);
        textColor = Colors.orange;
        text = 'Developer';
        break;
      case UserRole.member:
        containerColor = ColorManager.primary.withOpacity(0.17);
        textColor = ColorManager.primary;
        text = 'Member';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        text,
        style: context.bodySmall?.copyWith(color: textColor),
      ),
    );
  }
}
