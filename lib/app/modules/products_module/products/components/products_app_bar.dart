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
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_down_button/pull_down_button.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../data/models/store/product.dart';
import '../../../../routes/app_pages.dart';
import '../../../components/adaptive_button.dart';
import '../controllers/products_controller.dart';

class ProductsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProductsAppBar({
    super.key,
    required this.tabController,
    required this.topViewPadding,
  });

  final TabController tabController;
  final double topViewPadding;

  @override
  State<ProductsAppBar> createState() => _ProductsAppBarState();
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight * 2 + topViewPadding);
}

class _ProductsAppBarState extends State<ProductsAppBar> {
  bool collectionSearch = false;
  bool productSearch = false;
  final ProductsController controller = Get.find<ProductsController>();
  final collectionCtrl = CollectionsController.instance;
  // final searchCtrl = TextEditingController();
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
    const kDuration = Duration(milliseconds: 200);
    final topViewPadding = MediaQuery.of(context).viewPadding.top;
    final productsText = Obx(() {
      final count = ProductsController.instance.productsCount.value;
      return Text(count != 0 ? 'Products ($count)' : 'Products', overflow: TextOverflow.ellipsis);
    });
    final collectionText = Obx(() {
      final count = CollectionsController.instance.collectionCount.value;
      return Text(count != 0 ? 'Collections ($count)' : 'Collections', overflow: TextOverflow.ellipsis);
    });

    final androidTabBar = TabBar(
      controller: widget.tabController,
      tabs: [
        Tab(child: productsText),
        Tab(child: collectionText),
      ],
    );

    final iosTabBar = Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        children: [
          Flexible(
            child: CupertinoButton(
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
          ),
          Flexible(
            child: CupertinoButton(
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
          ),
        ],
      ),
    );

    final collectionAppBar = AnimatedCrossFade(
        key: const ValueKey(1),
        firstChild: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              const SizedBox(width: 12.0),
              if (GetPlatform.isIOS)
                Expanded(
                    child: CupertinoSearchTextField(
                  focusNode: searchNode,
                  controller: collectionCtrl.searchCtrl,
                  placeholder: 'Search for collection name, handle',
                  onChanged: (val) {
                    if (collectionCtrl.searchTerm.value != val) {
                      collectionCtrl.searchTerm.value = val;
                    }
                  },
                )),
              if (GetPlatform.isAndroid)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextFormField(
                      style: Theme.of(context).textTheme.titleSmall,
                      focusNode: searchNode,
                      controller: collectionCtrl.searchCtrl,
                      decoration: const InputDecoration(
                        hintText: 'Search for collection name, handle',
                      ),
                      onChanged: (val) {
                        if (collectionCtrl.searchTerm.value != val) {
                          collectionCtrl.searchTerm.value = val;
                        }
                      },
                    ),
                  ),
                ),
              AdaptiveButton(
                  child: const Text('Cancel'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      collectionSearch = false;
                      collectionCtrl.searchCtrl.clear();
                      collectionCtrl.searchTerm.value = '';
                    });
                  }),
            ],
          ),
        ),
        secondChild: SizedBox(
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AdaptiveIcon(
                  onPressed: () async {
                    setState(() {
                      collectionSearch = true;
                    });
                    await Future.delayed(kDuration);
                    searchNode.requestFocus();
                  },
                  icon: const Icon(MedusaIcons.magnifying_glass)),
              const SizedBox(width: 6.0),
              AdaptiveIcon(
                  onPressed: () => Get.toNamed(Routes.CREATE_COLLECTION),
                  icon: Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add)),
            ],
          ),
        ),
        crossFadeState: collectionSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: kDuration);

    final productsAppBar = AnimatedCrossFade(
        key: const ValueKey(0),
        firstChild: SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              const SizedBox(width: 12.0),
              Expanded(
                child: SearchTextField(
                  focusNode: searchNode,
                  controller: controller.searchCtrl,
                  hintText: 'Search for product name, variant title ...',
                  onChanged: (val) {
                    if (controller.searchTerm.value != val) {
                      controller.searchTerm.value = val;
                    }
                  },
                ),
              ),
              AdaptiveButton(
                  child: const Text('Cancel'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    // await Future.delayed(Duration(milliseconds: 150));
                    setState(() {
                      productSearch = false;
                      controller.searchCtrl.clear();
                      controller.searchTerm.value = '';
                    });
                  }),
            ],
          ),
        ),
        secondChild: SizedBox(
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AdaptiveIcon(
                    onPressed: () async {
                      setState(() => productSearch = true);
                      await Future.delayed(kDuration);
                      searchNode.requestFocus();
                    },
                    icon: const Icon(MedusaIcons.magnifying_glass),
                  ),
                  Obx(() {
                    return AdaptiveIcon(
                        onPressed: () async {
                          final result = await showModalActionSheet<SortOptions>(
                              context: context,
                              actions: <SheetAction<SortOptions>>[
                                SheetAction(
                                    label: 'A-Z',
                                    key: SortOptions.aZ,
                                    isDestructiveAction: controller.sortOptions.value == SortOptions.aZ),
                                SheetAction(
                                    label: 'Z-A',
                                    key: SortOptions.zA,
                                    isDestructiveAction: controller.sortOptions.value == SortOptions.zA),
                                SheetAction(
                                    label: 'Creation Date',
                                    key: SortOptions.dateRecent,
                                    isDestructiveAction: controller.sortOptions.value == SortOptions.dateRecent),
                                SheetAction(
                                    label: 'Creation Date - Ascending',
                                    key: SortOptions.dateOld,
                                    isDestructiveAction: controller.sortOptions.value == SortOptions.dateOld),
                              ]);
                          if (result != null) {
                            controller.changeSortOption(result);
                          }
                        },
                        icon: Icon(
                          getSortIcon(controller.sortOptions.value),
                          color: controller.sortOptions.value != SortOptions.dateRecent ? ColorManager.primary : null,
                        ));
                  }),
                  const SizedBox(width: 6.0),
                  InkWell(
                    onTap: () {
                      showBarModalBottomSheet(
                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Theme(
                                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                                          child: ExpansionTile(
                                            title: const Text('Status'),
                                            childrenPadding: const EdgeInsets.only(left: 20.0),
                                            children: ProductStatus.values
                                                .map((e) => CheckboxListTile(
                                                    title: Text(e.value), value: false, onChanged: (val) {}))
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12.0),
                                      Theme(
                                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                                          child: ExpansionTile(
                                            title: const Text('Collection'),
                                            childrenPadding: const EdgeInsets.only(left: 20.0),
                                            children: ProductStatus.values
                                                .map((e) => CheckboxListTile(
                                                    title: Text(e.value), value: false, onChanged: (val) {}))
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12.0),
                                      Theme(
                                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                                          child: ExpansionTile(
                                            title: const Text('Status'),
                                            childrenPadding: const EdgeInsets.only(left: 20.0),
                                            children: ProductStatus.values
                                                .map((e) => CheckboxListTile(
                                                    title: Text(e.value), value: false, onChanged: (val) {}))
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Chip(
                      side: const BorderSide(color: Colors.transparent),
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Filters', style: Theme.of(context).textTheme.titleSmall),
                          Text(' 0',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(color: ColorManager.primary)),
                        ],
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  AdaptiveIcon(
                      onPressed: () => controller.changeViewOption(),
                      icon: Icon(controller.viewOptions == ViewOptions.list ? Icons.grid_view_rounded : Icons.list)),
                  PullDownButton(
                    itemBuilder: (context) => [
                      PullDownMenuItem.selectable(
                        selected: controller.viewOptions == ViewOptions.grid,
                        title: 'Grid',
                        icon: CupertinoIcons.square_grid_2x2,
                        onTap: () => controller.changeViewOption(option: ViewOptions.grid),
                      ),
                      const PullDownMenuDivider(),
                      PullDownMenuItem.selectable(
                        selected: controller.viewOptions == ViewOptions.list,
                        title: 'List',
                        icon: CupertinoIcons.list_bullet,
                        onTap: () => controller.changeViewOption(option: ViewOptions.list),
                      ),
                    ],
                    position: PullDownMenuPosition.automatic,
                    buttonBuilder: (context, showMenu) => AdaptiveButton(
                      onPressed: showMenu,
                      padding: EdgeInsets.zero,
                      child: Icon(CupertinoIcons.square_grid_2x2, color: Theme.of(context).iconTheme.color),
                    ),
                  ),
                  AdaptiveIcon(
                      onPressed: () async {
                        await Get.toNamed(Routes.ADD_UPDATE_PRODUCT)?.then((result) {
                          if (result != null && result is bool && result == true) {
                            controller.pagingController.refresh();
                          }
                        });
                      },
                      icon: Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add)),
                  AdaptiveIcon(
                      onPressed: () async {
                        // ignore: unused_local_variable
                        final result = await showModalActionSheet(context: context, actions: <SheetAction>[
                          const SheetAction(label: 'Export Products'),
                          const SheetAction(label: 'Import Products'),
                        ]);
                      },
                      icon: const Icon(Icons.more_horiz)),
                ],
              ),
            ],
          ),
        ),
        crossFadeState: productSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: kDuration);

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
          if (widget.tabController.index == 1) collectionAppBar,
          if (widget.tabController.index == 0) productsAppBar,
        ],
      ),
    );
  }
}
