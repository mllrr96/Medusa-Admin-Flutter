import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/cubits/products_filter/products_filter_cubit.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

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
  static const Widget disabledApplyButton = Expanded(
      flex: 4, child: FilledButton(onPressed: null, child: Text('Apply')));

  @override
  Widget build(BuildContext context) {
    final smallTextStyle = context.bodySmall;
    const space = Gap(12);
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
              padding: EdgeInsets.fromLTRB(12, 0, 12, context.bottomViewPadding != 0 ? context.bottomViewPadding : 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: widget.onResetPressed,
                    child: const Text('Reset'),
                  ),
                  const Gap(8.0),
                  state.maybeMap(
                    loaded: (_) => Expanded(
                      flex: 4,
                      child: FilledButton(
                          onPressed: () {
                            widget.onSubmitted?.call(productFilter);
                          },
                          child: const Text('Apply')),
                    ),
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
                state.map(
                  initial: (_) => const SizedBox(),
                  loading: (_) => const Skeletonizer(
                    enabled: true,
                    child: Column(
                      children: [
                        FlexExpansionTile(
                          title: Text('Status'),
                        ),
                        space,
                        FlexExpansionTile(
                          title: Text('Collections'),
                        ),
                        space,
                        FlexExpansionTile(
                          title: Text('Tags'),
                        ),
                      ],
                    ),
                  ),
                  loaded: (_) {
                    final collections = _.collections;
                    final tags = _.tags;
                    return Column(
                      children: [
                        FlexExpansionTile(
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
                                      title: Text(e.name.capitalize,
                                          style: smallTextStyle),
                                      value: productFilter.status.contains(e),
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
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
                        FlexExpansionTile(
                          key: collectionKey,
                          title: const Text('Collections'),
                          initiallyExpanded:
                              productFilter.collection.isNotEmpty,
                          onExpansionChanged: (expanded) async {
                            if (expanded) {
                              await collectionKey.currentContext
                                  .ensureVisibility();
                            }
                          },
                          child: Column(
                            children: [
                              if (collections.isNotEmpty)
                                ...collections.map((e) => CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
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
                                          productFilter.collection.removeWhere(
                                              (element) => element.id == e.id);
                                        }
                                        setState(() {});
                                      },
                                      title: Text(e.title ?? '',
                                          style: smallTextStyle),
                                    ))
                            ],
                          ),
                        ),
                        space,
                        FlexExpansionTile(
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
                              if (tags.isNotEmpty)
                                Wrap(
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
                                )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  error: (error) => Column(
                    children: [
                      Center(
                        child: Text(error.failure.toString()),
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
