import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/bloc/api_key_crud/api_key_crud_bloc.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/screens/publishable_api_keys/components/api_key_tile.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class SecretApiKeysView extends StatefulWidget {
  const SecretApiKeysView({super.key});

  @override
  State<SecretApiKeysView> createState() => _SecretApiKeysViewState();
}

class _SecretApiKeysViewState extends State<SecretApiKeysView> {
  late ApiKeyCrudBloc apiKeyCrudBloc;

  final pagingController = PagingController<int, ApiKey>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();

  @override
  void initState() {
    apiKeyCrudBloc = ApiKeyCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  void _loadPage(int page) {
    apiKeyCrudBloc.add(ApiKeyCrudEvent.loadAll(queryParameters: {
      'offset': page == 0 ? 0 : pagingController.itemList?.length,
      'type': ApiKeyType.secret.name,
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
          title: const Text('Secret Api Keys'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pushRoute(AddUpdateApiKeyRoute(type: ApiKeyType.secret)),
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
              builderDelegate: PagedChildBuilderDelegate<ApiKey>(
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
