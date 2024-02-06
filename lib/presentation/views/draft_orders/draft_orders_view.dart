import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/presentation/cubits/draft_orders/draft_orders_cubit.dart';
import 'package:medusa_admin/presentation/views/draft_orders/components/index.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class DraftOrdersView extends StatefulWidget {
  const DraftOrdersView({super.key});

  @override
  State<DraftOrdersView> createState() => _DraftOrdersViewState();
}

class _DraftOrdersViewState extends State<DraftOrdersView> {
  final smartRefresherCtrl = RefreshController();
  final PagingController<int, DraftOrder> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);

  Future<void> _loadPage(int pageKey) async {
    await context.read<DraftOrdersCubit>().loadDraftOrders(queryParameters: {
      'offset': pageKey == 0 ? 0 : pagingController.itemList?.length ?? 0,
    });
  }

  @override
  void initState() {
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DraftOrdersCubit, DraftOrdersState>(
      listener: (context, state) {
        state.mapOrNull(
          draftOrders: (state) async {
            final isLastPage =
                state.draftOrders.length < DraftOrdersCubit.pageSize;
            if (smartRefresherCtrl.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.draftOrders);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.draftOrders.length;
              pagingController.appendPage(state.draftOrders, nextPageKey);
            }
            if (smartRefresherCtrl.isRefresh) {
              pagingController.addPageRequestListener(_loadPage);
              smartRefresherCtrl.refreshCompleted();
            }
          },
          error: (state) {
            smartRefresherCtrl.refreshFailed();
            pagingController.error = state.failure;
          },
        );
      },
      child: Scaffold(
        drawer: const AppDrawer(),
        drawerEdgeDragWidth: context.drawerEdgeDragWidth,
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchFloatingActionButton(
                    searchCategory: SearchCategory.draftOrders),
                Gap(4.0),
              ],
            ),
            const Gap(6.0),
            ScrollingExpandableFab(
                controller: ScrollController(),
                label: 'Draft Order',
                icon: const Icon(Icons.add),
                onPressed: () =>
                    context.pushRoute(const CreateDraftOrderRoute()),
                heroTag: 'Draft Order'),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: Builder(builder: (context) {
                final ordersCount = context.select<DraftOrdersCubit, int?>(
                    (bloc) => bloc.state.mapOrNull(
                        draftOrders: (state) =>
                            state.count > 0 ? state.count : null));
                return Text(
                    ordersCount != null ? 'Drafts ($ordersCount)' : 'Drafts',
                    overflow: TextOverflow.ellipsis);
              }),
            ),
          ],
          body: SmartRefresher(
            controller: smartRefresherCtrl,
            onRefresh: () => _loadPage(0),
            child: PagedListView.separated(
              pagingController: pagingController,
              padding: const EdgeInsets.only(
                  bottom: 120, top: 8.0, left: 8.0, right: 8.0),
              builderDelegate: PagedChildBuilderDelegate<DraftOrder>(
                  itemBuilder: (context, draftOrder, index) =>
                      DraftOrderCard(draftOrder),
                  noItemsFoundIndicatorBuilder: (_) =>
                      const Center(child: Text('No draft orders yet!')),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const DraftsLoadingPage(),
                  firstPageErrorIndicatorBuilder: (context) =>
                      PaginationErrorPage(pagingController: pagingController),
                  animateTransitions: true),
              separatorBuilder: (_, __) => const Gap(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
