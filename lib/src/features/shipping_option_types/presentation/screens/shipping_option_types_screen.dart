import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/features/shipping_option_types/presentation/bloc/shipping_option_types_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ShippingOptionTypesScreen extends StatefulWidget {
  const ShippingOptionTypesScreen({super.key});

  @override
  State<ShippingOptionTypesScreen> createState() => _ShippingOptionTypesScreenState();
}

class _ShippingOptionTypesScreenState extends State<ShippingOptionTypesScreen> {
  late final ShippingOptionTypesBloc _shippingOptionTypesBloc;
  late final ShippingOptionTypesBloc _deleteShippingOptionTypeBloc;
  final pagingController =
      PagingController<int, ShippingOptionType>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();

  void _loadPage(int page) {
    _shippingOptionTypesBloc.add(
      ShippingOptionTypesEvent.load({
        'offset': page == 0 ? 0 : pagingController.itemList?.length,
      }),
    );
  }

  @override
  void initState() {
    _shippingOptionTypesBloc = ShippingOptionTypesBloc.instance;
    _deleteShippingOptionTypeBloc = ShippingOptionTypesBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    _shippingOptionTypesBloc.close();
    _deleteShippingOptionTypeBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ShippingOptionTypesBloc, ShippingOptionTypesState>(
          bloc: _shippingOptionTypesBloc,
          listener: (context, state) {
            state.whenOrNull(
              optionTypes: (res) async {
                final shippingOptionTypes = res.shippingOptionTypes;
                final isLastPage = shippingOptionTypes.length < 20;
                if (refreshController.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);
                  pagingController.value =
                      const PagingState(nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(shippingOptionTypes);
                } else {
                  final nextPageKey =
                      pagingController.nextPageKey ?? 0 + shippingOptionTypes.length;
                  pagingController.appendPage(shippingOptionTypes, nextPageKey);
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
        BlocListener<ShippingOptionTypesBloc, ShippingOptionTypesState>(
          bloc: _deleteShippingOptionTypeBloc,
          listener: (context, state) {
            state.whenOrNull(
              deleted: () {
                pagingController.refresh();
                context.showSnackBar('Shipping option type deleted successfully');
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
          title: const Text('Shipping Option Types'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await context.pushRoute<bool>(CreateUpdateShippingOptionTypeRoute());
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
          child: PagedListView.separated(
            separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
            padding: const EdgeInsets.only(bottom: kToolbarHeight),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<ShippingOptionType>(
              animateTransitions: true,
              itemBuilder: (context, type, index) {
                return ListTile(
                  title: Text(type.label),
                  subtitle: Text(type.code),
                  onTap: () async {
                    final result = await context.pushRoute<bool>(
                        CreateUpdateShippingOptionTypeRoute(shippingOptionType: type));
                    if (result == true) {
                      pagingController.refresh();
                    }
                  },
                  trailing: IconButton(
                      padding: EdgeInsets.all(16),
                      onPressed: () async {
                        final shouldDelete = await showOkCancelAlertDialog(
                          context: context,
                          title: 'Are you sure you want to delete this shipping option type?',
                          okLabel: 'Delete',
                          isDestructiveAction: true,
                        );
                        if (shouldDelete == OkCancelResult.ok) {
                          _deleteShippingOptionTypeBloc
                              .add(ShippingOptionTypesEvent.delete(type.id));
                        }
                      },
                      icon: Icon(
                        LucideIcons.trash2,
                        color: Colors.red,
                      )),
                );
              },
              noItemsFoundIndicatorBuilder: (_) => Center(
                child: Text(
                  'No shipping option types found',
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
