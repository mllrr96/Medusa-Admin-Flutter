import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/service/storage_service.dart';

class MedusaSliverAppBar extends StatelessWidget {
  const MedusaSliverAppBar({
    this.appBarStyle,
    super.key,
    this.title,
    this.actions,
    this.floating,
    this.snap,
    this.systemOverlayStyle,
  });
  final AppBarStyle? appBarStyle;
  final Widget? title;
  final List<Widget>? actions;
  final bool? floating;
  final bool? snap;
  final SystemUiOverlayStyle? systemOverlayStyle;
  @override
  Widget build(BuildContext context) {
    final appBarStyle =
        this.appBarStyle ?? StorageService.appSettings.appBarStyle;
    switch (appBarStyle) {
      case AppBarStyle.normal:
        return SliverAppBar(
          title: title,
          actions: actions,
          floating: floating ?? true,
          snap: snap ?? true,
          systemOverlayStyle: systemOverlayStyle,
        );
      case AppBarStyle.medium:
        return SliverAppBar.medium(
          title: title,
          actions: actions,
          systemOverlayStyle: systemOverlayStyle,
        );
      case AppBarStyle.large:
        return SliverAppBar.large(
          title: title,
          actions: actions,
          systemOverlayStyle: systemOverlayStyle,
        );
    }
  }
}
