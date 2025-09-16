import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/core/utils/enums.dart';
import 'package:medusa_admin/src/features/app_settings/data/service/preference_service.dart';

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
    this.backgroundColor,
    this.centerTitle,
    this.bottom,
    this.flexibleSpace,
  });

  final AppBarStyle? appBarStyle;
  final Widget? title;
  final Widget? leading;
  final Widget? flexibleSpace;
  final List<Widget>? actions;
  final bool? floating;
  final Color? backgroundColor;
  final bool? snap;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final PreferredSizeWidget? bottom;
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
    return switch (appBarStyle) {
      AppBarStyle.normal => SliverAppBar(
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor,
          leading: leading,
          actions: actions,
          floating: floating ?? true,
          flexibleSpace: flexibleSpace,
          snap: snap ?? true,
          bottom: bottom,
          systemOverlayStyle: overLayStyle,
        ),
      AppBarStyle.medium => SliverAppBar.medium(
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor,
          leading: leading,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          systemOverlayStyle: overLayStyle,
        ),
      AppBarStyle.large => SliverAppBar.large(
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor,
          leading: leading,
          actions: actions,
          flexibleSpace: flexibleSpace,
          bottom: bottom,
          systemOverlayStyle: overLayStyle,
        )
    };
  }
}
