import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/data/models/discount_condition_res.dart';
import 'package:medusa_admin/presentation/blocs/group_crud/group_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/presentation/widgets/search_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'condition_customer_group_tile.dart';
import 'condition_operator_card.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class ConditionCustomerGroupView extends StatefulWidget {
  const ConditionCustomerGroupView({super.key, this.disabledGroups});
  final List<CustomerGroup>? disabledGroups;

  @override
  State<ConditionCustomerGroupView> createState() =>
      _ConditionCustomerGroupViewState();
}

class _ConditionCustomerGroupViewState
    extends State<ConditionCustomerGroupView> {
  late GroupCrudBloc groupCrudBloc;

  List<CustomerGroup> selectedCustomerGroups = <CustomerGroup>[];
  DiscountConditionOperator discountConditionOperator =
      DiscountConditionOperator.inn;
  final PagingController<int, CustomerGroup> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 6);
  List<CustomerGroup> get disabledGroups => widget.disabledGroups ?? [];
  bool get updateMode => disabledGroups.isNotEmpty;
  final searchCtrl = TextEditingController();
  String searchTerm = '';

  void _loadPage(int pageKey) {
    groupCrudBloc.add(GroupCrudEvent.loadAll(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
        if (searchTerm.isNotEmpty) 'q': searchTerm,
      },
    ));
  }

  @override
  void initState() {
    groupCrudBloc = GroupCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    groupCrudBloc.close();
    pagingController.dispose();
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroupCrudBloc, GroupCrudState>(
      bloc: groupCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          groups: (state) async {
            final isLastPage = state.groups.length < GroupCrudBloc.pageSize;
            if (isLastPage) {
              pagingController.appendLastPage(state.groups);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.groups.length;
              pagingController.appendPage(state.groups, nextPageKey);
            }
          },
          error: (state) {
            pagingController.error = state.failure;
          },
        );
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: const Text('Choose groups'),
              actions: [
                TextButton(
                    onPressed: selectedCustomerGroups.isNotEmpty
                        ? () {
                            final result = DiscountConditionRes(
                                operator: discountConditionOperator,
                                customerGroups: selectedCustomerGroups,
                                conditionType:
                                    DiscountConditionType.customerGroups);
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
                      hintText: 'Search for group name',
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
                  )),
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
                builderDelegate: PagedChildBuilderDelegate<CustomerGroup>(
                  animateTransitions: true,
                  itemBuilder: (context, customerGroup, index) =>
                      ConditionCustomerGroupTile(
                          customerGroup: customerGroup,
                          value: selectedCustomerGroups
                              .map((e) => e.id!)
                              .toList()
                              .contains(customerGroup.id),
                          enabled: !disabledGroups
                              .map((e) => e.id!)
                              .toList()
                              .contains(customerGroup.id),
                          onChanged: (val) {
                            if (val == null) return;
                            if (val) {
                              selectedCustomerGroups.add(customerGroup);
                            } else {
                              selectedCustomerGroups
                                  .removeWhere((e) => e.id == customerGroup.id);
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
                        const Text('No groups found'),
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