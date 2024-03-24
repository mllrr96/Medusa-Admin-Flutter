import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/cubits/tags/tags_cubit.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/data/models/discount_condition_res.dart';
import 'condition_operator_card.dart';
import 'condition_tag_tile.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class ConditionTagView extends StatefulWidget {
  const ConditionTagView({super.key, this.disabledTags});
  final List<ProductTag>? disabledTags;

  @override
  State<ConditionTagView> createState() => _ConditionTagViewState();
}

class _ConditionTagViewState extends State<ConditionTagView> {
  late TagsCubit tagsCubit;

  List<ProductTag> selectedTags = <ProductTag>[];
  DiscountConditionOperator discountConditionOperator =
      DiscountConditionOperator.inn;
  final PagingController<int, ProductTag> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  final int _pageSize = 20;
  List<ProductTag> get disabledTags => widget.disabledTags ?? [];
  final searchCtrl = TextEditingController();
  String searchTerm = '';
  bool get updateMode => disabledTags.isNotEmpty;

  void _loadPage(int pageKey) {
    tagsCubit.fetchTags(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        'limit': _pageSize,
        if (searchTerm.isNotEmpty) 'q': searchTerm
      },
    );
  }

  @override
  void initState() {
    tagsCubit = TagsCubit.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    tagsCubit.close();
    pagingController.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return BlocListener<TagsCubit, TagsState>(
      bloc: tagsCubit,
      listener: (context, state) {
        state.maybeWhen(
          tags: (tags, _) {
            final isLastPage = tags.length < _pageSize;
            if (isLastPage) {
              pagingController.appendLastPage(tags);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + tags.length;
              pagingController.appendPage(tags, nextPageKey);
            }
          },
          error: (error) => pagingController.error = error,
          orElse: () {},
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: const Text('Choose tags'),
              actions: [
                TextButton(
                    onPressed: selectedTags.isNotEmpty
                        ? () {
                            final result = DiscountConditionRes(
                                operator: discountConditionOperator,
                                productTags: selectedTags,
                                conditionType:
                                    DiscountConditionType.productTags);
                            context.maybePop(result);
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
                    hintText: 'Search for tag name',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
                    space,
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
                builderDelegate: PagedChildBuilderDelegate<ProductTag>(
                  animateTransitions: true,
                  itemBuilder: (context, tag, index) => ConditionTagTile(
                      tag: tag,
                      value: selectedTags
                          .map((e) => e.id!)
                          .toList()
                          .contains(tag.id),
                      enabled: !disabledTags
                          .map((e) => e.id!)
                          .toList()
                          .contains(tag.id),
                      onChanged: (val) {
                        if (val == null) return;
                        if (val) {
                          selectedTags.add(tag);
                        } else {
                          selectedTags.removeWhere((e) => e.id == tag.id);
                        }
                        setState(() {});
                      }),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  firstPageErrorIndicatorBuilder: (_) =>
                      PaginationErrorPage(pagingController: pagingController),
                  noItemsFoundIndicatorBuilder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('No tags found'),
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
    );
  }
}
