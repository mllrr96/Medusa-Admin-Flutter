import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/blocs/region_crud/region_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'components/region_card.dart';
import 'components/regions_loading_page.dart';

@RoutePage()
class RegionsView extends StatefulWidget {
  const RegionsView({super.key});

  @override
  State<RegionsView> createState() => _RegionsViewState();
}

class _RegionsViewState extends State<RegionsView> {
  late RegionCrudBloc regionCrudBloc;
  final PagingController<int, Region> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  final refreshController = RefreshController();

  void _loadPage(int _) {
    regionCrudBloc.add(
      RegionCrudEvent.loadAll(queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
      }),
    );
  }

  @override
  void initState() {
    regionCrudBloc = RegionCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    regionCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegionCrudBloc, RegionCrudState>(
      bloc: regionCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          regions: (state) async {
            final isLastPage = state.regions.length < RegionCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(state.regions);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.regions.length;
              pagingController.appendPage(state.regions, nextPageKey);
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
        floatingActionButton: ScrollingExpandableFab(
          controller: ScrollController(),
          label: 'New Region',
          icon: const Icon(Icons.add),
          onPressed: () async {
            final result = await context.pushRoute(AddRegionRoute());
            if (result is bool && result == true) {
              pagingController.refresh();
            }
          },
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const MedusaSliverAppBar(
              title: Text('Regions'),
            ),
          ],
          body: SmartRefresher(
            // scrollController: controller.scrollController,
            controller: refreshController,
            onRefresh: () => pagingController.refresh(),
            header: const MaterialClassicHeader(),
            child: PagedListView.separated(
              separatorBuilder: (_, __) => const Gap(6.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<Region>(
                itemBuilder: (context, region, index) =>
                    RegionCard(region: region),
                firstPageProgressIndicatorBuilder: (context) =>
                    const RegionsLoadingPage(),
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
