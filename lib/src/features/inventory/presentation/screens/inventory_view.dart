import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/src/features/inventory/presentation/bloc/inventory_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class InventoryView extends StatefulWidget {
  const InventoryView({super.key});

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  late final InventoryBloc _inventoryBloc;
  final PagingController<int, InventoryItem> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    _inventoryBloc = InventoryBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  void _loadPage(int page) {
    _inventoryBloc.add(InventoryEvent.loadInventoryItems({
      'offset': page == 0 ? 0 : pagingController.itemList?.length,
    }));
  }

  @override
  void dispose() {
    _inventoryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InventoryBloc, InventoryState>(
      bloc: _inventoryBloc,
      listener: (context, state) {
        state.whenOrNull(
          inventoryItemsList: (result) async {
            final isLastPage = result.inventoryItems.length < 20;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value =
                  const PagingState(nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(result.inventoryItems);
            } else {
              final nextPageKey = pagingController.nextPageKey ?? 0 + result.inventoryItems.length;
              pagingController.appendPage(result.inventoryItems, nextPageKey);
            }
            if (refreshController.isRefresh) {
              pagingController.addPageRequestListener(_loadPage);
              refreshController.refreshCompleted();
            }
          },
          error: (e) {
            refreshController.refreshFailed();
            pagingController.error = e;
          },
        );
      },
      child: Scaffold(
        drawer: const AppDrawer(),
        drawerEdgeDragWidth: context.drawerEdgeDragWidth,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('New Inventory'),
          icon: const Icon(LucideIcons.plus),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: BlocBuilder<InventoryBloc, InventoryState>(
                  bloc: _inventoryBloc,
                  builder: (context, state) {
                    final inventoryCount = state.maybeWhen(
                        inventoryItemsList: (state) => state.count, orElse: () => 0);
                    return Text(inventoryCount > 0 ? 'Inventory ($inventoryCount)' : 'Inventory',
                        overflow: TextOverflow.ellipsis);
                  }),
            ),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => pagingController.refresh(),
            child: PagedListView(
              padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4, top: 8.0),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<InventoryItem>(
                animateTransitions: true,
                itemBuilder: (context, inventoryItem, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: InkWell(
                      onTap: () => context.pushRoute(
                        InventoryDetailsRoute(id: inventoryItem.id),
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      child: Ink(
                        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(inventoryItem.title ?? ''),
                                Text(inventoryItem.sku ?? ''),
                              ],
                            ),
                            const Gap(8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Reserved: ${inventoryItem.reservedQuantity}'),
                                Text('Available: ${inventoryItem.stockedQuantity}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
