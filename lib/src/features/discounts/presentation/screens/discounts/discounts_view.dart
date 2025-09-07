import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';import 'package:medusa_admin/src/core/extensions/paging_controller.dart';import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/core/utils/enums.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/features/discounts/presentation/bloc/discount_crud/discount_crud_bloc.dart';
import 'package:medusa_admin/src/features/discounts/presentation/screens/discounts/components/discounts_loading_page.dart';
import 'package:medusa_admin/src/features/search/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'components/discount_card.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';

@RoutePage()
class DiscountsView extends StatefulWidget {
  const DiscountsView({super.key});

  @override
  State<DiscountsView> createState() => _DiscountsViewState();
}

class _DiscountsViewState extends State<DiscountsView> {
  final smartRefresherCtrl = RefreshController();
  final PagingController<int, Promotion> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  String loadingDiscountId = '';

  bool get loading => loadingDiscountId.isNotEmpty;
  int discountCount = 0;
  late DiscountCrudBloc discountsBloc;
  late DiscountCrudBloc discountCrudBloc;

  Future<void> _loadPage(int pageKey) async {
    discountsBloc.add(DiscountCrudEvent.loadAll(queryParameters: {
      'offset': pageKey == 0 ? 0 : pagingController.itemList?.length,
    }));
  }

  @override
  void initState() {
    discountsBloc = DiscountCrudBloc.instance;
    discountCrudBloc = DiscountCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    smartRefresherCtrl.dispose();
    discountsBloc.close();
    discountCrudBloc.close();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final largeTextStyle = context.bodyLarge;
    return MultiBlocListener(
      listeners: [
        BlocListener<DiscountCrudBloc, DiscountCrudState>(
          bloc: discountCrudBloc,
          listener: (context, updateDiscountState) {
            updateDiscountState.whenOrNull(
              loading: (discountId) => setState(() => loadingDiscountId = discountId ?? ''),
              discount: (discount) async {
                final index =
                    pagingController.itemList?.indexWhere((element) => element.id == discount.id);
                // If for whatever reason we didn't find the discount in the list,
                // we just reload discounts
                if (index == -1 || index == null) {
                  smartRefresherCtrl.headerMode?.value = RefreshStatus.refreshing;
                } else {
                  pagingController.updateItem(discount, index);
                }
                setState(() => loadingDiscountId = '');
                context.showSnackBar('Discount updated successfully');
              },
              deleted: () {
                context.showSnackBar('Discount deleted successfully');
                final index = pagingController.itemList
                    ?.indexWhere((element) => element.id == loadingDiscountId);
                if (index != -1 && index != null) {
                  pagingController.removeAt(index);
                } else {
                  pagingController.refresh();
                }

                setState(() {
                  loadingDiscountId = '';
                  discountCount -= 1;
                });
              },
              error: (e) {
                setState(() => loadingDiscountId = '');
                context.showSnackBar(e.toSnackBarString());
              },
            );
          },
        ),
        BlocListener<DiscountCrudBloc, DiscountCrudState>(
          bloc: discountsBloc,
          listener: (context, state) {
            state.mapOrNull(
              discounts: (state) async {
                final isLastPage = state.discounts.length < DiscountCrudBloc.pageSize;
                if (smartRefresherCtrl.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);

                  pagingController.value =
                      const PagingState(nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(state.discounts);
                } else {
                  final nextPageKey = pagingController.nextPageKey ?? 0 + state.discounts.length;
                  pagingController.appendPage(state.discounts, nextPageKey);
                }
                setState(() => discountCount = state.count);
                smartRefresherCtrl.refreshCompleted();
              },
              loading: (_) {},
              error: (state) {
                context.showSnackBar(state.failure.toSnackBarString());
                smartRefresherCtrl.refreshFailed();
              },
            );
          },
        )
      ],
      child: Scaffold(
        drawer: const AppDrawer(),
        drawerEdgeDragWidth: context.drawerEdgeDragWidth,
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchFloatingActionButton(searchCategory: SearchCategory.discounts),
                Gap(4.0),
              ],
            ),
            const Gap(6.0),
            FloatingActionButton.extended(
              heroTag: UniqueKey(),
              onPressed: () async {
                final result = await context.pushRoute(AddUpdateDiscountRoute());
                if (result is Promotion) {
                  pagingController.refresh();
                }
              },
              label: const Text('New Discount'),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: Text(discountCount > 0 ? 'Discounts ($discountCount)' : 'Discounts',
                  overflow: TextOverflow.ellipsis),
            ),
          ],
          body: SmartRefresher(
            controller: smartRefresherCtrl,
            onRefresh: () => _loadPage(0),
            child: PagedListView.separated(
              separatorBuilder: (_, __) => const Gap(12.0),
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 80),
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<Promotion>(
                animateTransitions: true,
                itemBuilder: (context, discount, index) => Skeletonizer(
                  enabled: loadingDiscountId == discount.id,
                  child: DiscountCard(
                    discount,
                    onTap: () async {
                      final result =
                          await context.pushRoute(DiscountDetailsRoute(discount: discount));
                      // Discount deleted, reload discounts
                      if (result == true) {
                        smartRefresherCtrl.headerMode?.value = RefreshStatus.refreshing;
                      }
                    },
                    onDelete: loading
                        ? null
                        : () async {
                            discountCrudBloc.add(DiscountCrudEvent.delete(discount.id));
                          },
                    onToggle: loading
                        ? null
                        : () async {
                            discountCrudBloc.add(DiscountCrudEvent.update(
                                discount.id,
                                PostPromotionReq(
                                    // isDisabled: !discount.isDisabled,
                                    )));
                          },
                  ),
                ),
                firstPageProgressIndicatorBuilder: (context) => const DiscountsLoadingPage(),
                noItemsFoundIndicatorBuilder: (_) => Center(
                    child: Text('No discounts yet!\n Tap on + to add discount',
                        style: largeTextStyle, textAlign: TextAlign.center)),
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
