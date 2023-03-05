import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/utils/enums.dart';
import '../controllers/products_controller.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (controller) {
        return Scaffold(
          // ignore: prefer_const_constructors
          appBar: AnimatedAppBar(),
          body: SafeArea(
            child: controller.viewOptions == ViewOptions.grid ? const ProductsGridView() : const ProductsListView(),
          ),
        );
      },
    );
  }
}

class AnimatedAppBar extends StatefulWidget with PreferredSizeWidget {
  const AnimatedAppBar({Key? key}) : super(key: key);

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  bool search = false;
  final ProductsController controller = Get.find<ProductsController>();
  final searchCtrl = TextEditingController();
  final searchNode = FocusNode();
  static const kDuration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Products'),
      centerTitle: true,
      // 56 is the default leading width value
      leadingWidth: 56 * 2,
      leading: Row(
        children: [
          AdaptiveIcon(
              onPressed: () => controller.changeViewOption(),
              icon: Icon(controller.viewOptions == ViewOptions.list ? Icons.grid_view_rounded : Icons.list)),
          Obx(() {
            return AdaptiveIcon(
                onPressed: () async {
                  final result =
                      await showModalActionSheet<SortOptions>(context: context, actions: <SheetAction<SortOptions>>[
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
        ],
      ),
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: AnimatedCrossFade(
              firstChild: Row(
                children: [
                  // Expanded(child: TextFormField()),
                  // const SizedBox(width: 12.0),
                  if (GetPlatform.isIOS)
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: CupertinoSearchTextField(
                      focusNode: searchNode,
                      controller: searchCtrl,
                      placeholder: 'Search for product name, variant title ...',
                      onChanged: (val) {
                          controller.searchTerm = val;
                          controller.pagingController.refresh();
                      },
                    ),
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
                          search = false;
                          if (controller.searchTerm.isNotEmpty) {
                            controller.searchTerm = '';
                            controller.pagingController.refresh();
                          }
                          searchCtrl.clear();
                        });
                      }),
                ],
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
                              setState(() {
                                search = true;
                              });
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
                            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
                    Obx(() {
                      if (controller.productsCount.value == 0) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text('${controller.productsCount.value} Products',
                              style: Theme.of(context).textTheme.titleSmall));
                    }),
                  ],
                ),
              ),
              crossFadeState: search ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: kDuration)),

      actions: [
        AdaptiveIcon(
            onPressed: () async {
              await Get.toNamed(Routes.ADD_UPDATE_PRODUCT)?.then((result) {
                if (result != null && result is bool && result == true) {
                  controller.pagingController.refresh();
                }
              });
            },
            icon: const Icon(Icons.add)),
        AdaptiveIcon(
            onPressed: () async {
              final result = await showModalActionSheet(context: context, actions: <SheetAction>[
                const SheetAction(label: 'Export Products'),
                const SheetAction(label: 'Import Products'),
              ]);
            },
            icon: const Icon(Icons.more_horiz))
      ],
    );
  }

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
}

class ProductsGridView extends GetView<ProductsController> {
  const ProductsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.gridRefreshController,
      onRefresh: () => controller.pagingController.refresh(),
      header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
      child: PagedGridView(
        pagingController: controller.pagingController,
        // padding: const EdgeInsets.symmetric(vertical: 8.0),
        builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, product, index) => GestureDetector(
                  onTap: () async {
                    await Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product.id)?.then((result) {
                      // A product has been deleted, reload data
                      if (result is bool && result == true) {
                        controller.pagingController.refresh();
                      }
                    });
                  },
                  child: Card(
                    child: Column(
                      children: [
                        if (product.thumbnail != null)
                          Expanded(
                            flex: 3,
                            child: CachedNetworkImage(
                                imageUrl: product.thumbnail!,
                                placeholder: (context, text) =>
                                    const Center(child: CircularProgressIndicator.adaptive()),
                                errorWidget: (context, string, error) =>
                                    const Icon(Icons.warning_rounded, color: Colors.redAccent)),
                          ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(product.title!, style: Theme.of(context).textTheme.titleMedium),
                        )),
                      ],
                    ),
                  ),
                ),
            firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator.adaptive())),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 100 / 150,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          crossAxisCount: 3,
        ),
      ),
    );
  }
}

class ProductsListView extends GetView<ProductsController> {
  const ProductsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.listRefreshController,
      onRefresh: () => controller.pagingController.refresh(),
      header: GetPlatform.isIOS ? const ClassicHeader(completeText: '') : const MaterialClassicHeader(),
      child: PagedListView.separated(
        separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
        pagingController: controller.pagingController,
        builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, product, index) => ListTile(
                  onTap: () async {
                    await Get.toNamed(Routes.PRODUCT_DETAILS, arguments: product.id)?.then((result) {
                      // A product has been deleted, reload data
                      if (result is bool && result == true) {
                        controller.pagingController.refresh();
                      }
                    });
                  },
                  title: Text(product.title!),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _getStatusIcon(product.status),
                      const SizedBox(width: 4.0),
                      Text(product.status.name.capitalize ?? product.status.name,
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                  leading: product.thumbnail != null
                      ? SizedBox(
                          width: 45,
                          child: CachedNetworkImage(
                            imageUrl: product.thumbnail!,
                            placeholder: (context, text) => const Center(child: CircularProgressIndicator.adaptive()),
                            errorWidget: (context, string, error) =>
                                const Icon(Icons.warning_rounded, color: Colors.redAccent),
                          ))
                      : null,
                  trailing: AdaptiveIcon(
                      onPressed: () async {
                        await showModalActionSheet(context: context, actions: <SheetAction>[
                          const SheetAction(label: 'Edit'),
                          SheetAction(
                              label: product.status == ProductStatus.published ? 'Unpublish' : 'Publish',
                              key: 'publish'),
                          const SheetAction(label: 'Duplicate'),
                          const SheetAction(label: 'Delete', isDestructiveAction: true, key: 'delete'),
                        ]).then((result) async {
                          if (result == 'delete') {
                            final confirmDelete = await showOkCancelAlertDialog(
                                context: context,
                                title: 'Confirm product deletion',
                                message: 'Are you sure you want to delete this product? \n This action is irreversible',
                                isDestructiveAction: true);

                            if (confirmDelete != OkCancelResult.ok) {
                              return;
                            }
                            await controller.deleteProduct(product.id!);
                          } else if (result == 'publish') {
                            await controller.updateProduct(Product(
                              id: product.id!,
                              discountable: product.discountable,
                              status: product.status == ProductStatus.published
                                  ? ProductStatus.draft
                                  : ProductStatus.published,
                            ));
                          }
                        });
                      },
                      icon: const Icon(Icons.more_horiz)),
                ),
            firstPageProgressIndicatorBuilder: (context) => const Center(child: CircularProgressIndicator.adaptive())),
      ),
    );
  }

  Widget _getStatusIcon(ProductStatus status) {
    switch (status) {
      case ProductStatus.draft:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);
      case ProductStatus.proposed:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);

      case ProductStatus.published:
        return const Icon(Icons.circle, color: Colors.green, size: 12);

      case ProductStatus.rejected:
        return const Icon(Icons.circle, color: Colors.red, size: 12);
    }
  }
}
