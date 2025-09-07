import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/src/features/pricing/presentation/bloc/pricing/pricing_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/index.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';

@RoutePage()
class PricingView extends StatefulWidget {
  const PricingView({super.key});

  @override
  State<PricingView> createState() => _PricingViewState();
}

class _PricingViewState extends State<PricingView> {
  final RefreshController refreshController = RefreshController();
  late final PagingController<int, PriceList> pagingController;
  late PricingCrudBloc pricingCrudBloc;

  void _loadPage(int _) {
    pricingCrudBloc.add(PricingCrudEvent.loadAll(queryParameters: {
      'offset': _ == 0 ? 0 : pagingController.itemList?.length,
    }));
  }

  @override
  void initState() {
    pricingCrudBloc = PricingCrudBloc.instance;
    pagingController =
        PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    pricingCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PricingCrudBloc, PricingCrudState>(
      bloc: pricingCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          pricingLists: (state) async {
            final isLastPage =
                state.priceLists.length < PricingCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.priceLists);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.priceLists.length;
              pagingController.appendPage(state.priceLists, nextPageKey);
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
        drawer: const AppDrawer(),
        drawerEdgeDragWidth: context.drawerEdgeDragWidth,
        floatingActionButton: FloatingActionButton.extended(
          heroTag: UniqueKey(),
          label: const Text('New Price List'),
          icon: const Icon(Icons.add),
          onPressed: () => context.pushRoute(AddUpdatePriceListRoute()),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: Builder(builder: (context) {
                final count = pricingCrudBloc.state.maybeMap(
                  pricingLists: (state) => state.priceLists.length,
                  orElse: () => 0,
                );
                return Text(
                    count > 0 ? 'Pricing Lists ($count)' : 'Pricing Lists',
                    overflow: TextOverflow.ellipsis);
              }),
            ),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            child: PagedListView.separated(
              separatorBuilder: (_, __) =>
                  const Divider(height: 0, indent: 16.0),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<PriceList>(
                animateTransitions: true,
                itemBuilder: (context, priceList, index) =>
                    PriceListTile(priceList),
                firstPageProgressIndicatorBuilder: (_) =>
                    const PriceListsLoadingPage(),
                firstPageErrorIndicatorBuilder: (_) =>
                    PaginationErrorPage(pagingController: pagingController),
                noItemsFoundIndicatorBuilder: (_) => const Center(
                  child: Text('No Price Lists Found'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
