import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/update_discount/update_discount_bloc.dart';
import 'package:medusa_admin/presentation/cubits/discounts/discounts_cubit.dart';
import 'package:medusa_admin/presentation/views/discounts/components/discounts_loading_page.dart';
import 'package:medusa_admin/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/utils/enums.dart';
import '../../../core/route/app_router.dart';
import 'components/discount_card.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

@RoutePage()
class DiscountsView extends StatefulWidget {
  const DiscountsView({super.key});

  @override
  State<DiscountsView> createState() => _DiscountsViewState();
}

class _DiscountsViewState extends State<DiscountsView> {
  final smartRefresherCtrl = RefreshController();
  final PagingController<int, Discount> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  String loadingDiscountId = '';
  int discountCount = 0;

  Future<void> _loadPage(int pageKey) async {
    await context.read<DiscountsCubit>().loadDiscounts();
  }

  @override
  void initState() {
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final largeTextStyle = context.bodyLarge;
    return BlocConsumer<UpdateDiscountBloc, UpdateDiscountState>(
      listener: (context, updateDiscountState) {
        updateDiscountState.mapOrNull(
          loading: (_) => setState(() => loadingDiscountId = _.discountId),
          success: (_) async {
            if (_.discount == null) {
              context.showSnackBar('Discount deleted successfully');
              List<Discount> discounts = [];
              discounts.addAll(pagingController.itemList ?? []);
              discounts
                  .removeWhere((element) => element.id == loadingDiscountId);
              pagingController.value = PagingState(itemList: discounts);
              setState(() {
                loadingDiscountId = '';
                discountCount = discounts.length;
              });
            } else {
              List<Discount> discounts = [];
              discounts.addAll(pagingController.itemList ?? []);
              final index = discounts
                  .indexWhere((element) => element.id == _.discount?.id);
              if (index == -1) {
                context.showSnackBar('Discount updated successfully');
                smartRefresherCtrl.headerMode?.value = RefreshStatus.refreshing;
                return;
              }
              discounts.replaceRange(index, index + 1, [_.discount!]);
              pagingController.value = PagingState(itemList: discounts);
              setState(() => loadingDiscountId = '');
              context.showSnackBar('Discount updated successfully');
            }
          },
          error: (state) {
            setState(() => loadingDiscountId = '');
            context.showSnackBar(state.failure.message);
          },
        );
      },
      builder: (BuildContext context, UpdateDiscountState updateDiscountState) {
        final loading =
            updateDiscountState.mapOrNull(loading: (_) => true) ?? false;
        return BlocListener<DiscountsCubit, DiscountsState>(
          listener: (context, state) {
            state.mapOrNull(
              discounts: (state) async {
                final isLastPage =
                    state.discounts.length < DiscountsCubit.pageSize;
                if (smartRefresherCtrl.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);

                  pagingController.value = const PagingState(
                      nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(state.discounts);
                } else {
                  final nextPageKey = pagingController.nextPageKey ??
                      0 + state.discounts.length;
                  pagingController.appendPage(state.discounts, nextPageKey);
                }
                setState(() =>
                    discountCount = pagingController.itemList?.length ?? 0);
                smartRefresherCtrl.refreshCompleted();
              },
              loading: (_) {},
              error: (state) {
                context.showSnackBar(state.failure.message);
                smartRefresherCtrl.refreshFailed();
              },
            );
          },
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
                    SearchFloatingActionButton(
                        searchCategory: SearchCategory.discounts),
                    Gap(4.0),
                  ],
                ),
                const Gap(6.0),
                ScrollingExpandableFab(
                  controller: ScrollController(),
                  heroTag: UniqueKey(),
                  label: 'New Discount',
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    final result =
                        await context.pushRoute(AddUpdateDiscountRoute());
                    if (result is bool && result == true) {
                      smartRefresherCtrl.headerMode?.value =
                          RefreshStatus.refreshing;
                    }
                  },
                ),
              ],
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MedusaSliverAppBar(
                  title: Text(
                      discountCount > 0
                          ? 'Discounts ($discountCount)'
                          : 'Discounts',
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
                  builderDelegate: PagedChildBuilderDelegate<Discount>(
                    itemBuilder: (context, discount, index) => Skeletonizer(
                      enabled: loadingDiscountId == discount.id,
                      child: DiscountCard(
                        discount,
                        onDelete: loading
                            ? null
                            : () async {
                                context.read<UpdateDiscountBloc>().add(
                                    UpdateDiscountEvent.deleteDiscount(
                                        discount.id!));
                              },
                        onToggle: loading
                            ? null
                            : () async {
                                context
                                    .read<UpdateDiscountBloc>()
                                    .add(UpdateDiscountEvent.updateDiscount(
                                        discount.id!,
                                        UserUpdateDiscountReq(
                                          isDisabled:
                                              discount.isDisabled != null
                                                  ? !discount.isDisabled!
                                                  : null,
                                        )));
                              },
                      ),
                    ),
                    firstPageProgressIndicatorBuilder: (context) =>
                        const DiscountsLoadingPage(),
                    noItemsFoundIndicatorBuilder: (_) => Center(
                        child: Text(
                            'No discounts yet!\n Tap on + to add discount',
                            style: largeTextStyle,
                            textAlign: TextAlign.center)),
                    firstPageErrorIndicatorBuilder: (context) =>
                        PaginationErrorPage(pagingController: pagingController),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
