import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SearchFloatingActionButton extends StatelessWidget {
  const SearchFloatingActionButton({super.key, this.onTap, this.searchCategory});
  final void Function()? onTap;
  final SearchCategory? searchCategory;
  @override
  Widget build(BuildContext context) {
    assert(searchCategory != null || onTap != null,
        'searchCategory or onTap must not be null');
    return ShadButton(
      size: ShadButtonSize.icon,
      onPressed: onTap ??
          () => context
              .pushRoute(MedusaSearchRoute(searchCategory: searchCategory!)),
      icon: const Icon(CupertinoIcons.search),
    );
    // return FloatingActionButton.small(
    //   onPressed: onTap ??
    //       () => context
    //           .pushRoute(MedusaSearchRoute(searchCategory: searchCategory!)),
    //   heroTag: UniqueKey(),
    //   child: const Icon(CupertinoIcons.search),
    // );
  }
}
