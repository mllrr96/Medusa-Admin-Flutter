import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/products_module/products/controllers/products_controller.dart';

import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_close_button.dart';
import '../../../components/adaptive_filled_button.dart';

class ProductsFilterView extends StatefulWidget {
  const ProductsFilterView({super.key});

  @override
  State<ProductsFilterView> createState() => _ProductsFilterViewState();
}

class _ProductsFilterViewState extends State<ProductsFilterView> {
  final controller = ProductsController.instance;
  late ProductFilter productFilter;
  @override
  void initState() {
    productFilter = controller.productFilter ?? ProductFilter(status: [], tags: [], collection: []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final bottomPadding = context.mediaQueryViewPadding.bottom == 0 ? 20.0 : context.mediaQueryViewPadding.bottom;
    const space = SizedBox(height: 12.0);
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveCloseButton(),
        title: const Text('Filter Products'),
        actions: [
          AdaptiveButton(
            onPressed: () {
              controller.resetFilter();
              Get.back();
            },
            child: const Text('Reset'),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, bottomPadding),
        color: context.theme.appBarTheme.backgroundColor,
        child: AdaptiveFilledButton(
            onPressed: () {
              controller.updateFilter(productFilter);
              Get.back();
            },
            child: Text('Apply', style: smallTextStyle?.copyWith(color: Colors.white))),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
        children: [
          CustomExpansionTile(
            title: Text('Status', style: smallTextStyle),
            initiallyExpanded: productFilter.status.isNotEmpty,
            children: ProductStatus.values
                .map((e) => CheckboxListTile(
                      title: Text(e.name.capitalize ?? e.name, style: smallTextStyle),
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
          space,
          CustomExpansionTile(
            title: Text('Collection', style: smallTextStyle),
            initiallyExpanded: productFilter.collection.isNotEmpty,
            children: [
              if (controller.collections?.isNotEmpty ?? false)
                ...controller.collections!
                    .map((e) => CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                          value: productFilter.collection.map((e) => e.id).toList().contains(e.id),
                          onChanged: (val) {
                            if (val == null) {
                              return;
                            }
                            if (val) {
                              productFilter.collection.add(e);
                            } else {
                              productFilter.collection.removeWhere((element) => element.id == e.id);
                            }
                            setState(() {});
                          },
                          title: Text(e.title ?? '', style: smallTextStyle),
                        ))
                    .toList()
            ],
          ),
          space,
          CustomExpansionTile(
            title: Text('Tags', style: smallTextStyle),
            initiallyExpanded: productFilter.tags.isNotEmpty,
            children: [
              if (controller.tags?.isNotEmpty ?? false)
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 6.0,
                  children: controller.tags!
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
        ],
      ),
    );
  }
}

class ProductFilter {
  final List<ProductStatus> status;
  final List<ProductTag> tags;
  final List<ProductCollection> collection;

  ProductFilter({required this.status, required this.tags, required this.collection});

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
