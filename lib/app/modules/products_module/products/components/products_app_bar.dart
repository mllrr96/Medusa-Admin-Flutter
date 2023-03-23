import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../../core/utils/colors.dart';
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
  final searchCtrl = TextEditingController();
  final searchNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    final displayLargeTextStyle = Theme.of(context).textTheme.displayLarge;
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const kDuration = Duration(milliseconds: 200);
    final topViewPadding = MediaQuery.of(context).viewPadding.top;

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
                  controller: searchCtrl,
                  placeholder: 'Search for product name, variant title ...',
                  onChanged: (val) {
                    controller.searchTerm = val;
                    controller.pagingController.refresh();
                  },
                )),
              if (GetPlatform.isAndroid)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.titleSmall,
                    focusNode: searchNode,
                    controller: searchCtrl,
                    onChanged: (val) {
                      controller.searchTerm = val;
                      controller.pagingController.refresh();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search for product name, variant title ...',
                    ),
                  ),
                )),
              AdaptiveButton(
                  child: const Text('Cancel'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    // await Future.delayed(Duration(milliseconds: 150));
                    setState(() {
                      collectionSearch = false;
                      if (controller.searchTerm.isNotEmpty) {
                        controller.searchTerm = '';
                        controller.pagingController.refresh();
                      }
                      searchCtrl.clear();
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
                  icon: const Icon(CupertinoIcons.search)),
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
              if (GetPlatform.isIOS)
                Expanded(
                    child: CupertinoSearchTextField(
                  focusNode: searchNode,
                  controller: searchCtrl,
                  placeholder: 'Search for product name, variant title ...',
                  onChanged: (val) {
                    controller.searchTerm = val;
                    controller.pagingController.refresh();
                  },
                )),
              if (GetPlatform.isAndroid)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: TextFormField(
                    style: Theme.of(context).textTheme.titleSmall,
                    focusNode: searchNode,
                    controller: searchCtrl,
                    onChanged: (val) {
                      controller.searchTerm = val;
                      controller.pagingController.refresh();
                    },
                    decoration: const InputDecoration(
                      hintText: 'Search for product name, variant title ...',
                    ),
                  ),
                )),
              AdaptiveButton(
                  child: const Text('Cancel'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    // await Future.delayed(Duration(milliseconds: 150));
                    setState(() {
                      productSearch = false;
                      if (controller.searchTerm.isNotEmpty) {
                        controller.searchTerm = '';
                        controller.pagingController.refresh();
                      }
                      searchCtrl.clear();
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
                      icon: const Icon(CupertinoIcons.search)),
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
                  )
                ],
              ),
              Row(
                children: [
                  AdaptiveIcon(
                      onPressed: () async {
                        await Get.toNamed(Routes.ADD_UPDATE_PRODUCT)?.then((result) {
                          if (result != null && result is bool && result == true) {
                            controller.pagingController.refresh();
                          }
                        });
                      },
                      icon: Platform.isIOS ? const Icon(CupertinoIcons.add) : const Icon(Icons.add)),
                  if (Platform.isAndroid)
                    AdaptiveIcon(
                        onPressed: () async {
                          // ignore: unused_local_variable
                          final result = await showModalActionSheet(context: context, actions: <SheetAction>[
                            const SheetAction(label: 'Export Products'),
                            const SheetAction(label: 'Import Products'),
                          ]);
                        },
                        icon: const Icon(Icons.more_horiz))
                ],
              ),
            ],
          ),
        ),
        crossFadeState: productSearch ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: kDuration);

    final androidTabBar = TabBar(
      controller: widget.tabController,
      tabs: [
        Tab(
            child: Text('Products',
                style:
                    widget.tabController.index == 0 ? largeTextStyle : mediumTextStyle!.copyWith(color: lightWhite))),
        Tab(
            child: Text('Collections',
                style:
                    widget.tabController.index == 1 ? largeTextStyle : mediumTextStyle!.copyWith(color: lightWhite))),
      ],
    );

    final iosTabBar = Container(
      height: kToolbarHeight,
      padding: const EdgeInsets.only(left: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                      child: const Text('Products'))),
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
                    child: const Text('Collections')),
              ),
            ],
          ),
          if (widget.tabController.index == 0)
            AdaptiveIcon(
                onPressed: () async {
                  // ignore: unused_local_variable
                  final result = await showModalActionSheet(context: context, actions: <SheetAction>[
                    const SheetAction(label: 'Export Products'),
                    const SheetAction(label: 'Import Products'),
                  ]);
                },
                icon: const Icon(Icons.more_horiz))
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
          if (widget.tabController.index == 1) collectionAppBar,
          if (widget.tabController.index == 0) productsAppBar,
        ],
      ),
    );
  }
}
