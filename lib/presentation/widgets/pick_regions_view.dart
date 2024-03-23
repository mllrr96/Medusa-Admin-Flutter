import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/data/models/pick_region_req.dart';
import 'package:medusa_admin/data/models/pick_region_res.dart';
import 'package:medusa_admin/presentation/blocs/region_crud/region_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

@RoutePage()
class PickRegionsView extends StatefulWidget {
  const PickRegionsView({super.key, this.pickRegionsReq});
  final PickRegionsReq? pickRegionsReq;

  @override
  State<PickRegionsView> createState() => _PickRegionsViewState();
}

class _PickRegionsViewState extends State<PickRegionsView> {
  PickRegionsReq get pickRegionsReq =>
      widget.pickRegionsReq ?? PickRegionsReq();
  bool get multipleSelect => pickRegionsReq.multipleSelect;

  late RegionCrudBloc regionCrudBloc;
  final PagingController<int, Region> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  List<Region> selectedRegions = <Region>[];

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
    if (pickRegionsReq.selectedRegions?.isNotEmpty ?? false) {
      selectedRegions = pickRegionsReq.selectedRegions!;
    }
    super.initState();
  }

  @override
  void dispose() {
    regionCrudBloc.close();
    pagingController.dispose();
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
            if (isLastPage) {
              pagingController.appendLastPage(state.regions);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + state.regions.length;
              pagingController.appendPage(state.regions, nextPageKey);
            }
          },
          error: (state) {
            pagingController.error = state.failure;
          },
        );
      },
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              leading: const CloseButton(),
              title: multipleSelect
                  ? const Text('Pick Regions')
                  : const Text('Pick Region'),
              actions: [
                TextButton(
                    onPressed: selectedRegions.isNotEmpty
                        ? () => context
                            .popRoute(PickRegionsRes(regions: selectedRegions))
                        : null,
                    child: const Text('Done'))
              ],
            ),
          ],
          body: PagedListView.separated(

            separatorBuilder: (_, __) => const Divider(height: 0, indent: 16),
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<Region>(
              animateTransitions: true,
              itemBuilder: (context, region, index) => CheckboxListTile(
                  title: Text(region.name ?? ''),
                  value: selectedRegions
                      .map((e) => e.id)
                      .toList()
                      .contains(region.id),
                  onChanged: (val) {
                    if (!multipleSelect) {
                      setState(() => selectedRegions = [region]);
                      return;
                    }
                    if (val != null && val) {
                      selectedRegions.add(region);
                    } else {
                      selectedRegions
                          .removeWhere((element) => element.id == region.id);
                    }
                    setState(() {});
                  }),
              firstPageProgressIndicatorBuilder: (context) =>
                  const Center(child: CircularProgressIndicator.adaptive()),
              firstPageErrorIndicatorBuilder: (context) =>
                  PaginationErrorPage(pagingController: pagingController),
            ),
          ),
        ),
      ),
    );
  }
}
