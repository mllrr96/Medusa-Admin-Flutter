import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/blocs/group_crud/group_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../core/utils/enums.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

import 'components/index.dart';

@RoutePage()
class GroupsView extends StatefulWidget {
  const GroupsView({super.key});

  @override
  State<GroupsView> createState() => _GroupsViewState();
}

class _GroupsViewState extends State<GroupsView> {
  final PagingController<int, CustomerGroup> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  RefreshController refreshController = RefreshController();
  late GroupCrudBloc groupCrudBloc;

  @override
  void initState() {
    groupCrudBloc = GroupCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  void _loadPage(int _) {
    groupCrudBloc.add(GroupCrudEvent.loadAll(
      queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
      }
    ));
  }

  @override
  void dispose() {
    groupCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
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
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.groups);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.groups.length;
              pagingController.appendPage(state.groups, nextPageKey);
            }
            if (refreshController.isRefresh) {
              pagingController.addPageRequestListener(_loadPage);
              refreshController.refreshCompleted();
            }
          },
          error: (state) {
            refreshController.refreshFailed();
            pagingController.error = state.failure;
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          drawer: const AppDrawer(),
          drawerEdgeDragWidth: context.drawerEdgeDragWidth,
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchFloatingActionButton(
                      searchCategory: SearchCategory.groups),
                  Gap(4.0),
                ],
              ),
              const Gap(6.0),
              ScrollingExpandableFab(
                heroTag: UniqueKey(),
                controller: ScrollController(),
                label: 'New Group',
                icon: const Icon(Icons.group_add),
                onPressed: () async {
                  final result =
                      await context.pushRoute(CreateUpdateGroupRoute());
                  if (result is bool && result) {
                    pagingController.refresh();
                  }
                },
              ),
            ],
          ),
          body: SlidableAutoCloseBehavior(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MedusaSliverAppBar(
                  title: Builder(builder: (context) {
                    final groupsCount = groupCrudBloc.state
                        .mapOrNull(groups: (state) => state.count) ?? 0;
                    return Text(
                        groupsCount != 0 ? 'Groups ($groupsCount)' : 'Groups',
                        overflow: TextOverflow.ellipsis);
                  }),
                ),
              ],
              body: SmartRefresher(
                controller: refreshController,
                onRefresh: () => pagingController.refresh(),
                child: PagedListView.separated(
                  separatorBuilder: (_, __) =>
                      Divider(height: 0, indent: GetPlatform.isIOS ? 16.0 : 0),
                  padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
                  pagingController: pagingController,
                  builderDelegate: PagedChildBuilderDelegate<CustomerGroup>(
                    itemBuilder: (context, customerGroup, index) => GroupCard(
                      customerGroup: customerGroup,
                      index: index,
                      onDelete: () {
                        // Handle delete group
                      },
                      afterUpdate: () {
                        pagingController.refresh();
                      },
                    ),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const GroupsLoadingPage(),
                    firstPageErrorIndicatorBuilder: (context) =>
                        PaginationErrorPage(pagingController: pagingController),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
