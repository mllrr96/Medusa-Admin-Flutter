import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/data/models/pick_groups_req.dart';
import 'package:medusa_admin/presentation/blocs/group_crud/group_crud_bloc.dart';
import 'package:medusa_admin/presentation/views/groups/components/goups_loading_page.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class PickGroupsView extends StatefulWidget {
  const PickGroupsView({super.key, this.pickGroupsReq});
  final PickGroupsReq? pickGroupsReq;

  @override
  State<PickGroupsView> createState() => _PickGroupsViewState();
}

class _PickGroupsViewState extends State<PickGroupsView> {
  final PagingController<int, CustomerGroup> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  RefreshController refreshController = RefreshController();
  late GroupCrudBloc groupCrudBloc;
  PickGroupsReq get pickGroupsReq => widget.pickGroupsReq ?? PickGroupsReq();
  bool get multipleSelect => pickGroupsReq.multipleSelect;
  var selectedGroups = <CustomerGroup>[];

  @override
  void initState() {
    groupCrudBloc = GroupCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    if (pickGroupsReq.selectedGroups?.isNotEmpty ?? false) {
      selectedGroups = pickGroupsReq.selectedGroups!;
    }
    super.initState();
  }

  void _loadPage(int _) {
    groupCrudBloc.add(GroupCrudEvent.loadAll(queryParameters: {
      'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
    }));
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
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: Builder(builder: (context) {
                final groupsCount = groupCrudBloc.state
                        .mapOrNull(groups: (state) => state.count) ??
                    0;
                return Text(
                    groupsCount > 0 ? 'Groups ($groupsCount)' : 'Groups',
                    overflow: TextOverflow.ellipsis);
              }),
            ),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => pagingController.refresh(),
            child: PagedListView.separated(
              separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<CustomerGroup>(
                itemBuilder: (context, group, index) => CheckboxListTile(
                  title: Text(group.name ?? ''),
                  value: selectedGroups
                      .map((e) => e.id)
                      .toList()
                      .contains(group.id),
                  onChanged: (val) {
                    if (!multipleSelect) {
                      selectedGroups = [group];
                      setState(() {});
                      return;
                    }
                    if (val != null && val) {
                      selectedGroups.add(group);
                    } else {
                      selectedGroups
                          .removeWhere((element) => element.id == group.id);
                    }
                    setState(() {});
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
    );
  }
}
