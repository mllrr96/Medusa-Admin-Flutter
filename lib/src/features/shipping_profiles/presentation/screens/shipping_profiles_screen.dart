import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/features/shipping_profiles/presentation/bloc/shipping_profiles_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class ShippingProfilesScreen extends StatefulWidget {
  const ShippingProfilesScreen({super.key});

  @override
  State<ShippingProfilesScreen> createState() => _ShippingProfilesScreenState();
}

class _ShippingProfilesScreenState extends State<ShippingProfilesScreen> {
  late final ShippingProfilesBloc _shippingProfilesBloc;
  late final ShippingProfilesBloc _deleteShippingProfileBloc;
  final pagingController =
      PagingController<int, ShippingProfile>(firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();

  void _loadPage(int page) {
    _shippingProfilesBloc.add(
      ShippingProfilesEvent.load(queryParameters: {
        'offset': page == 0 ? 0 : pagingController.itemList?.length,
      }),
    );
  }

  @override
  void initState() {
    _shippingProfilesBloc = ShippingProfilesBloc.instance;
    _deleteShippingProfileBloc = ShippingProfilesBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    _shippingProfilesBloc.close();
    _deleteShippingProfileBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ShippingProfilesBloc, ShippingProfilesState>(
          bloc: _shippingProfilesBloc,
          listener: (context, state) {
            state.whenOrNull(
              profiles: (state) async {
                final profiles = state.shippingProfiles;
                final isLastPage = profiles.length < ShippingProfilesBloc.pageSize;
                if (refreshController.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);
                  pagingController.value =
                      const PagingState(nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(profiles);
                } else {
                  final nextPageKey = pagingController.nextPageKey ?? 0 + profiles.length;
                  pagingController.appendPage(profiles, nextPageKey);
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
        BlocListener<ShippingProfilesBloc, ShippingProfilesState>(
          bloc: _deleteShippingProfileBloc,
          listener: (context, state) {
            state.whenOrNull(
              deleted: () {
                pagingController.refresh();
                context.showSnackBar('Shipping profile deleted successfully');
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
          title: const Text('Shipping Profiles'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // context.pushRoute(const CreateUpdateShippingProfileRoute());
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
            builderDelegate: PagedChildBuilderDelegate<ShippingProfile>(
              animateTransitions: true,
              itemBuilder: (context, shippingOption, index) {
                return ListTile(
                  onTap: () async {},
                  title: Text(shippingOption.name),
                  subtitle: Text(shippingOption.type),
                  trailing: IconButton(
                      onPressed: () async {
                        final shouldDelete = await showOkCancelAlertDialog(
                          context: context,
                          title: 'Are you sure you want to delete this shipping profile?',
                          okLabel: 'Delete',
                          isDestructiveAction: true,
                        );
                        if (shouldDelete != OkCancelResult.ok) return;
                        _deleteShippingProfileBloc
                            .add(ShippingProfilesEvent.delete(shippingOption.id));
                      },
                      icon: const Icon(
                        LucideIcons.trash2,
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.all(16)),
                );
              },
              noItemsFoundIndicatorBuilder: (_) => Center(
                child: Text(
                  'No shipping profiles found',
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
