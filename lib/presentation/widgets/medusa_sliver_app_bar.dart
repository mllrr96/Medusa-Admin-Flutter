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
    this.leading,
    this.actions,
    this.floating,
    this.snap,
    this.systemOverlayStyle,
    this.backgroundColor, this.centerTitle,
  });
  final AppBarStyle? appBarStyle;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? floating;
  final Color? backgroundColor;
  final bool? snap;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool? centerTitle;
  @override
  Widget build(BuildContext context) {
    final isDashboardRoute = context.router.current.name == DashboardRoute.name;
    final overLayStyle = systemOverlayStyle ??
        (isDashboardRoute
            ? context.systemUiOverlayNoAppBarStyle
            : context.defaultSystemUiOverlayStyle);
    final appBarStyle =
        this.appBarStyle ?? PreferenceService.appSettingsGetter.appBarStyle;
    switch (appBarStyle) {
      case AppBarStyle.normal:
        return SliverAppBar(
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor,
          leading: leading,
          actions: actions,
          floating: floating ?? true,
          snap: snap ?? true,
          systemOverlayStyle: overLayStyle,
        );
      case AppBarStyle.medium:
        return SliverAppBar.medium(
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor,
          leading: leading,
          actions: actions,
          systemOverlayStyle: overLayStyle,
        );
      case AppBarStyle.large:
        return SliverAppBar.large(
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor,
          leading: leading,
          actions: actions,
          systemOverlayStyle: overLayStyle,
        );
    }
  }
}
