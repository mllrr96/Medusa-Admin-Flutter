import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/core/utils/enums.dart';
import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/src/features/draft_orders/presentation/bloc/draft_order_crud/draft_order_crud_bloc.dart';
import 'package:medusa_admin/src/features/search/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'components/index.dart';

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
  late DraftOrderCrudBloc draftOrderCrudBloc;

  void _loadPage(int pageKey) {
    draftOrderCrudBloc.add(DraftOrderCrudEvent.loadAll(
      queryParameters: {
        'offset': pageKey == 0 ? 0 : pagingController.itemList?.length,
      },
    ));
  }

  @override
  void initState() {
    draftOrderCrudBloc = DraftOrderCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    draftOrderCrudBloc.close();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DraftOrderCrudBloc, DraftOrderCrudState>(
      bloc: draftOrderCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          draftOrders: (state) async {
            final isLastPage =
                state.draftOrders.length < DraftOrderCrudBloc.pageSize;
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
            pagingController.error = state.error;
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
            FloatingActionButton.extended(
              heroTag: UniqueKey(),
              onPressed: () => context.pushRoute(const CreateDraftOrderRoute()),
              label: const Text('Draft Order'),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: Builder(builder: (context) {
                final ordersCount = draftOrderCrudBloc.state.maybeWhen(
                    draftOrders: (state) => state.count, orElse: () => 0);
                return Text(
                    ordersCount > 0 ? 'Drafts ($ordersCount)' : 'Drafts',
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
                animateTransitions: true,
                itemBuilder: (context, draftOrder, index) =>
                    DraftOrderCard(draftOrder),
                noItemsFoundIndicatorBuilder: (_) =>
                    const Center(child: Text('No draft orders yet!')),
                firstPageProgressIndicatorBuilder: (context) =>
                    const DraftsLoadingPage(),
                firstPageErrorIndicatorBuilder: (context) =>
                    PaginationErrorPage(pagingController: pagingController),
              ),
              separatorBuilder: (_, __) => const Gap(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
