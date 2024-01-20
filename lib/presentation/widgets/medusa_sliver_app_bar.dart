import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/service/preference_service.dart';

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
    final isDashboardRoute = context.router.current.name == DashboardRoute.name;
    final overLayStyle = systemOverlayStyle ??
        (isDashboardRoute
            ? context.systemUiOverlayNoAppBarStyle
            : context.defaultSystemUiOverlayStyle);
    final appBarStyle =
        this.appBarStyle ?? PreferenceService.appSettings.appBarStyle;
    switch (appBarStyle) {
      case AppBarStyle.normal:
        return SliverAppBar(
          title: title,
          actions: actions,
          floating: floating ?? true,
          snap: snap ?? true,
          systemOverlayStyle: overLayStyle,
        );
      case AppBarStyle.medium:
        return SliverAppBar.medium(
          title: title,
          actions: actions,
          systemOverlayStyle: overLayStyle,
        );
      case AppBarStyle.large:
        return SliverAppBar.large(
          title: title,
          actions: actions,
          systemOverlayStyle: overLayStyle,
        );
    }
  }
}
