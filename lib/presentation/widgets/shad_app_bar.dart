import 'package:flutter/material.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShadAppBar(
      {super.key,
      this.title,
      this.actions,
      this.centerTitle,
      this.backgroundColor,
      this.titleColor,
      this.elevation,
      this.titleSize});
  final Widget? title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? elevation;
  final double? titleSize;
  @override
  Widget build(context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton = parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    IconData icon = useCloseButton ? Icons.close : context.isRTL ? Icons.chevron_right : Icons.chevron_left;
    return AppBar(
      title: title,
      actions: actions,
      // leadingWidth: 40,
      leading: ShadButton.outline(
        padding: EdgeInsets.zero,
        icon: Icon(
          icon,
          size: 16,
        ),
        size: ShadButtonSize.icon,
        onPressed: () =>  Navigator.maybePop(context),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
