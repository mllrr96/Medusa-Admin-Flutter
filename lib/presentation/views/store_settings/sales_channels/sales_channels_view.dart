import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/presentation/blocs/sales_channel_crud/sales_channel_crud_bloc.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

import 'components/index.dart';

@RoutePage()
class SalesChannelsView extends StatefulWidget {
  const SalesChannelsView({super.key});

  @override
  State<SalesChannelsView> createState() => _SalesChannelsViewState();
}

class _SalesChannelsViewState extends State<SalesChannelsView> {
  late SalesChannelCrudBloc salesChannelCrudBloc;
  final pagingController = PagingController<int, SalesChannel>(
      firstPageKey: 0, invisibleItemsThreshold: 6);
  final refreshController = RefreshController();

  void _loadPage(int _) {
    salesChannelCrudBloc.add(
      SalesChannelCrudEvent.loadAll(queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
        'expand': 'orders',
      }),
    );
  }

  @override
  void initState() {
    salesChannelCrudBloc = SalesChannelCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    salesChannelCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return BlocListener<SalesChannelCrudBloc, SalesChannelCrudState>(
      listener: (context, state) {
        state.mapOrNull(
          salesChannels: (state) async {
            final isLastPage =
                state.salesChannels.length < SalesChannelCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.salesChannels);
            } else {
              final nextPageKey = pagingController.nextPageKey ??
                  0 + state.salesChannels.length;
              pagingController.appendPage(state.salesChannels, nextPageKey);
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
          systemOverlayStyle: context.defaultSystemUiOverlayStyle,
          title: const Text('Sales Channels'),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight / 2),
              child: Container(
                height: kToolbarHeight / 2,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                                'Control which products are available in which channels',
                                style:
                                    smallTextStyle?.copyWith(color: manatee)))),
                    const Divider(height: 0),
                  ],
                ),
              )),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              // final result =
              //     await Get.toNamed(Routes.ADD_UPDATE_SALES_CHANNEL);
              final result =
                  await context.pushRoute(AddUpdateSalesChannelRoute());
              if (result is bool) {
                pagingController.refresh();
              }
            },
            child: const Icon(CupertinoIcons.add)),
        body: SafeArea(
            child: SmartRefresher(
          controller: refreshController,
          onRefresh: () => _loadPage(0),
          header: const MaterialClassicHeader(),
          child: PagedListView.separated(
            separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
            padding: const EdgeInsets.only(bottom: kToolbarHeight),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<SalesChannel>(
                itemBuilder: (context, salesChannel, index) =>
                    SalesChannelTile(salesChannel),
                firstPageProgressIndicatorBuilder: (_) =>
                    const SalesChannelsLoadingPage(),
                firstPageErrorIndicatorBuilder: (_) =>
                    PaginationErrorPage(pagingController: pagingController)),
          ),
        )),
      ),
    );
  }
}
