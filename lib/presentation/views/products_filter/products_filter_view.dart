import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/cubits/products_filter/products_filter_cubit.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

import 'custom_shad_checkbox.dart';

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
  late ProductFilter productFilter;
  @override
  void initState() {
    productFilter = widget.productFilter ??
        ProductFilter(status: [], tags: [], collection: []);
    super.initState();
  }

  final refreshController = RefreshController();
  final statusKey = GlobalKey();
  final collectionKey = GlobalKey();
  final tagsKey = GlobalKey();
  final Widget disabledApplyButton = const ShadButton.ghost(
      size: ShadButtonSize.lg, onPressed: null,child: Text('Apply'));

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    return BlocConsumer<ProductsFilterCubit, ProductsFilterState>(
      listener: (context, state) {
        state.mapOrNull(
          loaded: (state) => refreshController.refreshCompleted(),
          error: (error) => refreshController.refreshFailed(),
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Products Filter'),
          ),
          bottomNavigationBar: Padding(
              padding: EdgeInsets.fromLTRB(
                  12,
                  0,
                  12,
                  context.bottomViewPadding != 0
                      ? context.bottomViewPadding
                      : 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ShadButton.secondary(
                    size: ShadButtonSize.lg,
                    onPressed: widget.onResetPressed,
                   child: const Text('Reset'),
                  ),
                  const Gap(8.0),
                  state.maybeMap(
                    loaded: (_) => ShadButton(
                        size: ShadButtonSize.lg,
                        onPressed: () {
                          widget.onSubmitted?.call(productFilter);
                        },
                       child: const Text('Apply')),
                    orElse: () => disabledApplyButton,
                  ),
                ],
              )),
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () async =>
                await context.read<ProductsFilterCubit>().loadData(),
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              children: [
                state.when(
                  initial: () => const SizedBox(),
                  loading: () => const Skeletonizer(
                    enabled: true,
                    child: Skeletonizer(
                      enabled: true,
                      child: ShadAccordion<int>.multiple(
                          maintainState: true,
                          children: [
                            ShadAccordionItem(
                              value: 1,
                              title: Text('Status'),
                              child: SizedBox.shrink(),
                            ),
                            ShadAccordionItem(
                              value: 2,
                              title: Text('Collections'),
                              child: SizedBox.shrink(),
                            ),
                            ShadAccordionItem(
                              value: 3,
                              title: Text('Tags'),
                              child: SizedBox.shrink(),
                            ),
                          ]),
                    ),
                  ),
                  loaded: (collections, tags) {
                    return Column(
                      children: [
                        ShadAccordion<int>.multiple(
                            maintainState: true,
                            children: [
                              ShadAccordionItem(
                                value: 1,
                                title: const Text('Status'),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: ProductStatus.values
                                      .map((e) => ShadCheckbox(
                                            label: Text(e.name.capitalize,
                                                style: smallTextStyle),
                                            value: productFilter.status
                                                .contains(e),
                                            onChanged: (bool value) {
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
                              ShadAccordionItem(
                                value: 2,
                                title: const Text('Collections'),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: collections
                                      .map((e) => CustomShadCheckbox(
                                            value: productFilter.collection
                                                .map((e) => e.id)
                                                .toList()
                                                .contains(e.id),
                                            onChanged: (val) {
                                              if (val) {
                                                productFilter.collection.add(e);
                                              } else {
                                                productFilter.collection
                                                    .removeWhere((element) =>
                                                        element.id == e.id);
                                              }
                                              setState(() {});
                                            },
                                            label: Text(e.title ?? '',
                                                style: smallTextStyle),
                                          ))
                                      .toList(),
                                ),
                              ),
                              ShadAccordionItem(
                                  value: 3,
                                  title: const Text('Tags'),
                                  child: Wrap(
                                    alignment: WrapAlignment.start,
                                    spacing: 6.0,
                                    children: tags
                                        .map(
                                          (e) => ChoiceChip(
                                            label: Text(e.value ?? '',
                                                style: smallTextStyle),
                                            labelStyle: smallTextStyle,
                                            onSelected: (val) {
                                              if (val) {
                                                productFilter.tags.add(e);
                                              } else {
                                                productFilter.tags.remove(e);
                                              }
                                              setState(() {});
                                            },
                                            selected:
                                                productFilter.tags.contains(e),
                                          ),
                                        )
                                        .toList(),
                                  )),
                            ]),
                      ],
                    );
                  },
                  error: (failure) => Column(
                    children: [
                      Center(
                        child: Text(failure.toString()),
                      ),
                      FilledButton(
                          onPressed: () async => await context
                              .read<ProductsFilterCubit>()
                              .loadData(),
                          child: const Text('Retry'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
