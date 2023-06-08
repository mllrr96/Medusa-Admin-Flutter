import 'dart:async';
import 'dart:io';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/collections_module/collections/controllers/collections_controller.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/modules/components/search_text_field.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../routes/app_pages.dart';
import '../../../categories/controllers/categories_controller.dart';
import '../../../components/adaptive_button.dart';
import '../controllers/products_controller.dart';

class ProductsCollectionsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProductsCollectionsAppBar({
    super.key,
    required this.tabController,
    required this.topViewPadding,
  });

  final TabController tabController;
  final double topViewPadding;

  @override
  State<ProductsCollectionsAppBar> createState() => _ProductsCollectionsAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2 + topViewPadding);
}

class _ProductsCollectionsAppBarState extends State<ProductsCollectionsAppBar> {
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
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final displayLargeTextStyle = Theme.of(context).textTheme.displayLarge;
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final topViewPadding = MediaQuery.of(context).viewPadding.top;
    final productsText = Obx(() {
      final count = ProductsController.instance.productsCount.value;
      return Text(count != 0 ? 'Products ($count)' : 'Products', overflow: TextOverflow.ellipsis);
    });
    final collectionText = Obx(() {
      final count = CollectionsController.instance.collectionCount.value;
      return Text(count != 0 ? 'Collections ($count)' : 'Collections', overflow: TextOverflow.ellipsis);
    });
    final categoriesText = Obx(() {
      final count = categoriesCtrl.categoriesCount.value;
      return Text(count != 0 ? 'Categories ($count)' : 'Categories', overflow: TextOverflow.ellipsis);
    });

    final androidTabBar = TabBar(
      controller: widget.tabController,
      tabs: [
        Tab(child: productsText),
        Tab(child: collectionText),
        Tab(child: categoriesText),
      ],
    );

    final iosTabBar = SizedBox(
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CupertinoButton(
              padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
              onPressed: () {
                widget.tabController.index = 0;
                setState(() {});
              },
              alignment: Alignment.bottomCenter,
              child: AnimatedDefaultTextStyle(
                  style: widget.tabController.index == 0
                      ? displayLargeTextStyle!
                      : largeTextStyle!.copyWith(color: lightWhite),
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
                    ? displayLargeTextStyle!
                    : largeTextStyle!.copyWith(color: lightWhite),
                duration: const Duration(milliseconds: 200),
                child: collectionText),
          ),
          Flexible(
            child: CupertinoButton(
              padding: const EdgeInsets.only(right: 16.0, bottom: 8.0),
              onPressed: () {
                widget.tabController.index = 2;
                setState(() {});
              },
              alignment: Alignment.bottomCenter,
              child: AnimatedDefaultTextStyle(
                  style: widget.tabController.index == 2
                      ? displayLargeTextStyle!
                      : largeTextStyle!.copyWith(color: lightWhite),
                  duration: const Duration(milliseconds: 200),
                  child: categoriesText),
            ),
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
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: topViewPadding),
          if (Platform.isAndroid) androidTabBar,
          if (Platform.isIOS) iosTabBar,
          if (Platform.isIOS) const Divider(height: 0),
        ],
      ),
    );
  }
}
