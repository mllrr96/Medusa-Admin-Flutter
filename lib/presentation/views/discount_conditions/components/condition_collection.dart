import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/data/models/discount_condition_res.dart';
import 'package:medusa_admin/presentation/blocs/collection_crud/collection_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'condition_collection_tile.dart';
import 'condition_operator_card.dart';

@RoutePage()
class ConditionCollectionView extends StatefulWidget {
  const ConditionCollectionView({super.key, this.disabledCollections});
  final List<ProductCollection>? disabledCollections;

  @override
  State<ConditionCollectionView> createState() =>
      _ConditionCollectionViewState();
}

class _ConditionCollectionViewState extends State<ConditionCollectionView> {
  late CollectionCrudBloc collectionCrudBloc;
  List<ProductCollection> selectedCollections = <ProductCollection>[];
  DiscountConditionOperator discountConditionOperator =
      DiscountConditionOperator.inn;
  final PagingController<int, ProductCollection> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  List<ProductCollection> get disabledCollections =>
      widget.disabledCollections ?? [];
  bool get updateMode => disabledCollections.isNotEmpty;
  final searchCtrl = TextEditingController();
  String searchTerm = '';

  void _loadPage(int pageKey) {
    collectionCrudBloc.add(CollectionCrudEvent.loadAll(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        if (searchTerm.isNotEmpty) 'q': searchTerm,
      },
    ));
  }

  @override
  void initState() {
    collectionCrudBloc = CollectionCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    collectionCrudBloc.close();
    pagingController.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CollectionCrudBloc, CollectionCrudState>(
      bloc: collectionCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          collections: (state) async {
            final isLastPage =
                state.collections.length < CollectionCrudBloc.pageSize;
            if (isLastPage) {
              pagingController.appendLastPage(state.collections);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.collections.length;
              pagingController.appendPage(state.collections, nextPageKey);
            }
          },
          error: (state) {
            pagingController.error = state.failure;
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: const Text('Choose collections'),
                actions: [
                  TextButton(
                      onPressed: selectedCollections.isNotEmpty
                          ? () {
                              final result = DiscountConditionRes(
                                  operator: discountConditionOperator,
                                  productCollections: selectedCollections,
                                  conditionType:
                                      DiscountConditionType.productCollections);
                              context.popRoute(result);
                            }
                          : null,
                      child: const Text('Save')),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: Container(
                    height: kToolbarHeight,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    child: SearchTextField(
                      fillColor: context.theme.scaffoldBackgroundColor,
                      controller: searchCtrl,
                      hintText: 'Search for collection name, handle',
                      onSuffixTap: () {
                        if (searchTerm.isEmpty) return;
                        searchCtrl.clear();
                        searchTerm = '';
                        pagingController.refresh();
                      },
                      onSubmitted: (val) {
                        if (searchTerm != val && val.isNotEmpty) {
                          searchTerm = val;
                          pagingController.refresh();
                        }
                      },
                    ),
                  ),
                ),
              ),
              if (!updateMode)
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Column(
                    children: [
                      ConditionOperatorCard(
                        conditionOperator: DiscountConditionOperator.inn,
                        groupValue: discountConditionOperator,
                        onTap: (val) {
                          discountConditionOperator = val;
                          setState(() {});
                        },
                      ),
                      const Gap(12),
                      ConditionOperatorCard(
                        conditionOperator: DiscountConditionOperator.notIn,
                        groupValue: discountConditionOperator,
                        onTap: (val) {
                          discountConditionOperator = val;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                )),
              SliverSafeArea(
                top: false,
                sliver: PagedSliverList.separated(
                  separatorBuilder: (_, __) =>
                      const Divider(height: 0, indent: 16),
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<ProductCollection>(
                    itemBuilder: (context, collection, index) =>
                        ConditionCollectionTile(
                      collection: collection,
                      value: selectedCollections
                          .map((e) => e.id!)
                          .toList()
                          .contains(collection.id),
                      enabled: !disabledCollections
                          .map((e) => e.id!)
                          .toList()
                          .contains(collection.id),
                      onChanged: (val) {
                        if (val == null) return;
                        if (val) {
                          selectedCollections.add(collection);
                        } else {
                          selectedCollections
                              .removeWhere((e) => e.id == collection.id);
                        }
                        setState(() {});
                      },
                    ),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const Center(
                            child: CircularProgressIndicator.adaptive()),
                    firstPageErrorIndicatorBuilder: (_) =>
                        PaginationErrorPage(pagingController: pagingController),
                    noItemsFoundIndicatorBuilder: (context) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No collections found'),
                          if (searchTerm.isNotEmpty)
                            TextButton(
                                onPressed: () {
                                  searchTerm = '';
                                  searchCtrl.clear();
                                  pagingController.refresh();
                                },
                                child: const Text('Clear search')),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
