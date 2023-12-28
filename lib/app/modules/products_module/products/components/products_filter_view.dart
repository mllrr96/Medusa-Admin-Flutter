import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/header_card.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'products_filter_controller.dart';

class ProductsFilterView extends StatefulWidget {
  const ProductsFilterView({
    super.key,
    this.productFilter,
    this.onResetPressed,
    this.onSubmitted,
  });
  final ProductFilter? productFilter;
  final void Function()? onResetPressed;
  final void Function(ProductFilter?)? onSubmitted;
  @override
  State<ProductsFilterView> createState() => _ProductsFilterViewState();
}

class _ProductsFilterViewState extends State<ProductsFilterView> {
  // final controller = ProductsController.instance;
  late ProductFilter productFilter;
  @override
  void initState() {
    productFilter = widget.productFilter ??
        ProductFilter(status: [], tags: [], collection: []);
    super.initState();
  }

  final statusKey = GlobalKey();
  final collectionKey = GlobalKey();
  final tagsKey = GlobalKey();
  final controller = ProductsFilterController.instance;
  final Widget disabledApplyButton = const FilledButton(onPressed: null, child: Text('Apply'));
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Filter'),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: widget.onResetPressed,
                child: const Text('Reset'),
              ),
              controller.obx((state) =>
                  FilledButton(
                      onPressed: () {
                        widget.onSubmitted?.call(productFilter);
                      },
                      child: const Text('Apply')),
                onLoading:disabledApplyButton,
                onEmpty: disabledApplyButton,
                onError: (_) => disabledApplyButton,
              ),
            ],
          )
      ),

      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async => await controller.loadData(),
        header: GetPlatform.isIOS
            ? const ClassicHeader(completeText: '')
            : const MaterialClassicHeader(),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          children: [
            controller.obx((state) {
              final collections = state?.$1;
              final tags = state?.$2;
              return Column(
                children: [
                  HeaderCard(
                    key: statusKey,
                    title: const Text('Status'),
                    initiallyExpanded: productFilter.status.isNotEmpty,
                    onExpansionChanged: (expanded) async {
                      if (expanded) {
                        await statusKey.currentContext.ensureVisibility();
                      }
                    },
                    child: Column(
                      children: ProductStatus.values
                          .map((e) => CheckboxListTile(
                        title: Text(e.name.capitalize ?? e.name,
                            style: smallTextStyle),
                        value: productFilter.status.contains(e),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (bool? value) {
                          if (value == null) {
                            return;
                          }

                          if (value) {
                            productFilter.status.add(e);
                          } else {
                            productFilter.status.remove(e);
                          }
                          setState(() {});
                        },
                      ))
                          .toList(),
                    ),
                  ),
                  space,
                  HeaderCard(
                    key: collectionKey,
                    title: const Text('Collections'),
                    initiallyExpanded: productFilter.collection.isNotEmpty,
                    onExpansionChanged: (expanded) async {
                      if (expanded) {
                        await collectionKey.currentContext.ensureVisibility();
                      }
                    },
                    child: Column(children: [
                      if (collections?.isNotEmpty ?? false)
                        ...collections!.map((e) => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          value: productFilter.collection
                              .map((e) => e.id)
                              .toList()
                              .contains(e.id),
                          onChanged: (val) {
                            if (val == null) {
                              return;
                            }
                            if (val) {
                              productFilter.collection.add(e);
                            } else {
                              productFilter.collection
                                  .removeWhere((element) => element.id == e.id);
                            }
                            setState(() {});
                          },
                          title: Text(e.title ?? '', style: smallTextStyle),
                        ))
                    ],
                    ),
                  ),
                  space,
                  HeaderCard(
                    key: tagsKey,
                    title: const Text('Tags'),
                    initiallyExpanded: productFilter.tags.isNotEmpty,
                    onExpansionChanged: (expanded) async {
                      if (expanded) {
                        await tagsKey.currentContext.ensureVisibility();
                      }
                    },
                    child: Column(
                      children: [
                        if (tags?.isNotEmpty ?? false)
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 6.0,
                            children: tags!
                                .map(
                                  (e) => ChoiceChip(
                                label: Text(e.value ?? '', style: smallTextStyle),
                                labelStyle: smallTextStyle,
                                onSelected: (val) {
                                  if (val) {
                                    productFilter.tags.add(e);
                                  } else {
                                    productFilter.tags.remove(e);
                                  }
                                  setState(() {});
                                },
                                selected: productFilter.tags.contains(e),
                              ),
                            )
                                .toList(),
                          )
                      ],
                    ),
                  ),
                ],
              );
            },
              onLoading: const Skeletonizer(
                enabled: true,
                child: Column(
                  children: [
                    HeaderCard(
                      title: Text('Status'),
                    ),
                    space,
                    HeaderCard(
                      title: Text('Collections'),
                    ),
                    space,
                    HeaderCard(
                      title:
                      Text('Tags'),
                    ),
                  ],
                ),
              ),
              onEmpty: const Center(child: Text('Error loading items')),
              onError: (error) => Column(
                children: [
                  Center(
                    child: Text(error ?? 'Error loading items'),
                  ),
                  FilledButton(
                      onPressed: () async => await controller.loadData(),
                      child: const Text('Retry'))
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}

class ProductFilter {
  final List<ProductStatus> status;
  final List<ProductTag> tags;
  final List<ProductCollection> collection;

  ProductFilter(
      {required this.status, required this.tags, required this.collection});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (status.isNotEmpty) {
      for (int i = 0; i < status.length; i++) {
        data['status[$i]'] = status[i].name;
      }
    }

    if (tags.isNotEmpty) {
      // For whatever reason when passing a list with single item an error occur, so this is a solution to solve the issue
      if (tags.length == 1) {
        data['tags'] = <String>[tags[0].id!, ''];
      } else {
        data['tags'] = tags.map((e) => e.id!).toList();
      }
    }

    if (collection.isNotEmpty) {
      if (collection.length == 1) {
        data['collection_id'] = [collection[0].id, ''];
      } else {
        data['collection_id'] = collection.map((e) => e.id!).toList();
      }
    }

    return data;
  }

  int count() {
    int i = 0;
    if (status.isNotEmpty) {
      i += 1;
    }
    if (tags.isNotEmpty) {
      i += 1;
    }
    if (collection.isNotEmpty) {
      i += 1;
    }
    return i;
  }
}
