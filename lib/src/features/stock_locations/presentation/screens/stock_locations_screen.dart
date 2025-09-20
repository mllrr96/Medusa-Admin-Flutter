import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/features/stock_locations/presentation/bloc/stock_locations_bloc.dart';
import 'package:medusa_admin/src/features/stock_locations/presentation/widgets/stock_location_tile.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class StockLocationsScreen extends StatefulWidget {
  const StockLocationsScreen({super.key});

  @override
  State<StockLocationsScreen> createState() => _StockLocationsScreenState();
}

class _StockLocationsScreenState extends State<StockLocationsScreen> {
  late final StockLocationsBloc _stockLocationsBloc;
  late final StockLocationsBloc _deleteStockLocationBloc;
  final pagingController =
      PagingController<int, StockLocation>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();

  void _loadPage(int page) {
    _stockLocationsBloc.add(
      StockLocationsEvent.load(queryParameters: {
        'offset': page == 0 ? 0 : pagingController.itemList?.length,
      }),
    );
  }

  @override
  void initState() {
    _stockLocationsBloc = StockLocationsBloc.instance;
    _deleteStockLocationBloc = StockLocationsBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    _stockLocationsBloc.close();
    _deleteStockLocationBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<StockLocationsBloc, StockLocationsState>(
          bloc: _stockLocationsBloc,
          listener: (context, state) {
            state.whenOrNull(
              stockLocations: (state) async {
                final stockLocations = state.stockLocations;
                final isLastPage = stockLocations.length < StockLocationsBloc.pageSize;
                if (refreshController.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);
                  pagingController.value =
                      const PagingState(nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(stockLocations);
                } else {
                  final nextPageKey = pagingController.nextPageKey ?? 0 + stockLocations.length;
                  pagingController.appendPage(stockLocations, nextPageKey);
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
        ),
        BlocListener<StockLocationsBloc, StockLocationsState>(
          bloc: _deleteStockLocationBloc,
          listener: (context, state) {
            state.whenOrNull(
              deleted: () {
                pagingController.refresh();
                context.showSnackBar('Stock location deleted successfully');
              },
              error: (e) {
                context.showSnackBar(e.toSnackBarString());
              },
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stock Locations'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await context.pushRoute<bool>(CreateUpdateStockLocationRoute());
            if (result == true) {
              pagingController.refresh();
            }
          },
          child: const Icon(Icons.add),
        ),
        body: SafeArea(
            child: SmartRefresher(
          controller: refreshController,
          onRefresh: () => _loadPage(0),
          header: const MaterialClassicHeader(),
          child: PagedListView(
            padding: const EdgeInsets.only(bottom: kToolbarHeight),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<StockLocation>(
              animateTransitions: true,
              itemBuilder: (context, stockLocation, index) => StockLocationTile(
                stockLocation,
                onEdit: () async {
                  final result =
                      await context.pushRoute<bool>(CreateUpdateStockLocationRoute(stockLocation: stockLocation));
                  if (result == true) {
                    pagingController.refresh();
                  }
                },
                onDelete: () {
                  _deleteStockLocationBloc.add(StockLocationsEvent.delete(stockLocation.id));
                },
              ),
              noItemsFoundIndicatorBuilder: (_) => Center(
                child: Text(
                  'No stock locations found',
                  style: context.bodyMedium?.copyWith(fontSize: 16),
                ),
              ),
              firstPageErrorIndicatorBuilder: (_) =>
                  PaginationErrorPage(pagingController: pagingController),
            ),
          ),
        )),
      ),
    );
  }
}
