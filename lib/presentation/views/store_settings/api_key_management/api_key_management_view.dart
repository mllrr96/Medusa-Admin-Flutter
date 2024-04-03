import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/blocs/api_key_crud/api_key_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/api_key_tile.dart';

@RoutePage()
class ApiKeyManagementView extends StatefulWidget {
  const ApiKeyManagementView({super.key});

  @override
  State<ApiKeyManagementView> createState() => _ApiKeyManagementViewState();
}

class _ApiKeyManagementViewState extends State<ApiKeyManagementView> {
  late ApiKeyCrudBloc apiKeyCrudBloc;

  final pagingController = PagingController<int, PublishableApiKey>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();

  @override
  void initState() {
    apiKeyCrudBloc = ApiKeyCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  void _loadPage(int _) {
    apiKeyCrudBloc.add(ApiKeyCrudEvent.loadAll(queryParameters: {
      'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
    }));
  }

  @override
  void dispose() {
    apiKeyCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApiKeyCrudBloc, ApiKeyCrudState>(
      bloc: apiKeyCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          apiKeys: (state) async {
            final isLastPage = state.apiKeys.length < ApiKeyCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.apiKeys);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.apiKeys.length;
              pagingController.appendPage(state.apiKeys, nextPageKey);
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
        appBar: AppBar(
          title: const Text('Api Key Management'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pushRoute(AddUpdateApiKeyRoute()),
          child: const Icon(CupertinoIcons.add),
        ),
        body: SafeArea(
          child: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            header: const MaterialClassicHeader(),
            child: PagedListView.separated(
              padding: const EdgeInsets.only(bottom: kToolbarHeight * 1.4),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<PublishableApiKey>(
                animateTransitions: true,
                itemBuilder: (context, apiKey, index) => ApiKeyTile(apiKey),
                noItemsFoundIndicatorBuilder: (_) =>
                    const Center(child: Text('No items found')),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
                firstPageErrorIndicatorBuilder: (_) =>
                    PaginationErrorPage(pagingController: pagingController),
              ),
              separatorBuilder: (_, __) => const Divider(height: 1),
            ),
          ),
        ),
      ),
    );
  }
}
