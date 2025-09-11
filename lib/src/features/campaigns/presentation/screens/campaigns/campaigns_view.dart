import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/features/campaigns/presentation/bloc/campaign_crud_bloc.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class CampaignsView extends StatefulWidget {
  const CampaignsView({super.key});

  @override
  State<CampaignsView> createState() => _CampaignsViewState();
}

class _CampaignsViewState extends State<CampaignsView> {
  final RefreshController refreshController = RefreshController();
  late final CampaignCrudBloc campaignCrudBloc;
  final PagingController<int, Campaign> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);

  void _loadPage(int page) {
    campaignCrudBloc.add(CampaignCrudEvent.loadAll(queryParameters: {
      'offset': page == 0 ? 0 : pagingController.itemList?.length,
    }));
  }

  @override
  void initState() {
    campaignCrudBloc = CampaignCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    campaignCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CampaignCrudBloc, CampaignCrudState>(
      bloc: campaignCrudBloc,
      listener: (context, state) {
        state.whenOrNull(
          campaigns: (campaigns, count) async {
            final isLastPage = campaigns.length < 20;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value =
                  const PagingState(nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(campaigns);
            } else {
              final nextPageKey = pagingController.nextPageKey ?? 0 + campaigns.length;
              pagingController.appendPage(campaigns, nextPageKey);
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
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: BlocBuilder<CampaignCrudBloc, CampaignCrudState>(
                bloc: campaignCrudBloc,
                builder: (context, state) {
                  final campaignsCount =
                      campaignCrudBloc.state.mapOrNull(campaigns: (state) => state.count) ?? 0;
                  return Text(campaignsCount != 0 ? 'Campaigns ($campaignsCount)' : 'Campaigns',
                      overflow: TextOverflow.ellipsis);
                },
              ),
            ),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            child: PagedListView(
              pagingController: pagingController,
              padding: const EdgeInsets.only(bottom: kToolbarHeight),
              builderDelegate: PagedChildBuilderDelegate<Campaign>(
                animateTransitions: true,
                itemBuilder: (context, campaign, index) => ListTile(
                  onTap: (){},
                  title: Text(campaign.name),
                ),
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
