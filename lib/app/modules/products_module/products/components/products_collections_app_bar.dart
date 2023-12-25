import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/collections_module/collections/controllers/collections_controller.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../../../core/utils/enums.dart';
import '../../../categories/controllers/categories_controller.dart';
import '../controllers/products_controller.dart';

class ProductsCollectionsTabBarAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProductsCollectionsTabBarAppBar({
    super.key,
    required this.tabController,
    required this.topViewPadding,
  });

  final TabController tabController;
  final double topViewPadding;

  @override
  State<ProductsCollectionsTabBarAppBar> createState() => _ProductsCollectionsTabBarAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2 + topViewPadding);
}

class _ProductsCollectionsTabBarAppBarState extends State<ProductsCollectionsTabBarAppBar> {
  bool collectionSearch = false;
  bool productSearch = false;
  final ProductsController controller = Get.find<ProductsController>();
  final collectionCtrl = CollectionsController.instance;
  final categoriesCtrl = CategoriesController.instance;
  final searchNode = FocusNode();
  IconData getSortIcon(SortOptions sortOptions) {
    switch (sortOptions) {
      case SortOptions.aZ:
        return Icons.sort_by_alpha;
      case SortOptions.zA:
        return Icons.sort_by_alpha;

      case SortOptions.dateRecent:
        return CupertinoIcons.calendar_badge_plus;

      case SortOptions.dateOld:
        return CupertinoIcons.calendar_badge_minus;
    }
  }

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final largeTextStyle = context.bodyLarge;
    final headlineMediumTextStyle = context.headlineMedium;



    final productsText = Obx(() {
      final count = ProductsController.instance.productsCount.value;
      return Text(count != 0 ? 'Products ($count)' : 'Products', overflow: TextOverflow.ellipsis);
    });
    final collectionText = Obx(() {
      final count = CollectionsController.instance.collectionCount.value;
      return Text(count != 0 ? 'Collections ($count)' : 'Collections', overflow: TextOverflow.ellipsis);
    });
    // final categoriesText = Obx(() {
    //   final count = categoriesCtrl.categoriesCount.value;
    //   return Text(count != 0 ? 'Categories ($count)' : 'Categories', overflow: TextOverflow.ellipsis);
    // });

    final androidTabBar = TabBar(
      controller: widget.tabController,
      tabs: [
        Tab(child: productsText),
        Tab(child: collectionText),
        // Tab(child: categoriesText),
      ],
    );

    final iosTabBar = SizedBox(
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CupertinoButton(
              padding: const EdgeInsets.only(right: 16.0, bottom: 8.0, left: 16.0),
              onPressed: () {
                widget.tabController.index = 0;
                setState(() {});
              },
              alignment: Alignment.bottomCenter,
              child: AnimatedDefaultTextStyle(
                  style: widget.tabController.index == 0
                      ? headlineMediumTextStyle!
                      : largeTextStyle!.copyWith(color: manatee),
                  duration: const Duration(milliseconds: 200),
                  child: productsText)),
          CupertinoButton(
            padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
            onPressed: () {
              widget.tabController.index = 1;
              setState(() {});
            },
            alignment: Alignment.bottomCenter,
            child: AnimatedDefaultTextStyle(
                style: widget.tabController.index == 1
                    ? headlineMediumTextStyle!
                    : largeTextStyle!.copyWith(color: manatee),
                duration: const Duration(milliseconds: 200),
                child: collectionText),
          ),
        ],
      ),
    );

    widget.tabController.addListener(() {
      setState(() {
        collectionSearch = false;
        productSearch = false;
      });
    });
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: context.topViewPadding),
          if (Platform.isAndroid) androidTabBar,
          if (Platform.isIOS) iosTabBar,
          // if (Platform.isIOS) const Divider(height: 0),
        ],
      ),
    );
  }
}
