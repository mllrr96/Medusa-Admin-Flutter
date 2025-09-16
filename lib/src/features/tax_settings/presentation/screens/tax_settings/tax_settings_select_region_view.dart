import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/features/regions/presentation/bloc/region_crud/region_crud_bloc.dart';
import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/features/regions/presentation/screens/regions/components/region_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@RoutePage()
class TaxSettingsSelectRegionView extends StatefulWidget {
  const TaxSettingsSelectRegionView({super.key});

  @override
  State<TaxSettingsSelectRegionView> createState() =>
      _TaxSettingsSelectRegionViewState();
}

class _TaxSettingsSelectRegionViewState
    extends State<TaxSettingsSelectRegionView> {
  late RegionCrudBloc regionCrudBloc;
  final PagingController<int, Region> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  final refreshController = RefreshController();

  void _loadPage(int page) {
    regionCrudBloc.add(
      RegionCrudEvent.loadAll(queryParameters: {
        'offset': page == 0 ? 0 : pagingController.itemList?.length,
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
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
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
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: const Text('Regions'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight / 2),
                child: Container(
                  color: context.theme.scaffoldBackgroundColor,
                  height: kToolbarHeight / 2,
                  padding: const EdgeInsets.only(left: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Select the region you wish to manage taxes for',
                    style: smallTextStyle?.copyWith(color: manatee),
                  ),
                ),
              ),
            ),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => pagingController.refresh(),
            header: const MaterialClassicHeader(),
            child: PagedListView.separated(
              separatorBuilder: (_, __) => const Gap(6.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<Region>(
                animateTransitions: true,
                itemBuilder: (context, region, index) => RegionCard(
                  region: region,
                  onTap: () =>
                      context.pushRoute(TaxSettingsRoute(region: region)),
                  showProviders: false,
                ),
                // firstPageProgressIndicatorBuilder: (context) =>
                //     const RegionsLoadingPage(),
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
