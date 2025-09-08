import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/src/features/gift_cards/presentation/bloc/gift_card_crud/gift_card_crud_bloc.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/widgets/drawer_widget.dart';
import 'package:medusa_admin/src/core/utils/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/src/core/utils/pagination_error_page.dart';
import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'components/index.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

@RoutePage()
class ProductGiftCardsView extends StatefulWidget {
  const ProductGiftCardsView({super.key});

  @override
  State<ProductGiftCardsView> createState() => _ProductGiftCardsViewState();
}

class _ProductGiftCardsViewState extends State<ProductGiftCardsView> {
  final pagingController = PagingController<int, GiftCard>(
      firstPageKey: 0, invisibleItemsThreshold: 3);
  final refreshController = RefreshController();
  late GiftCardCrudBloc giftCardCrudBloc;

  @override
  void initState() {
    giftCardCrudBloc = GiftCardCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    pagingController.dispose();
    giftCardCrudBloc.close();
    super.dispose();
  }

  void _loadPage(int _) {
    giftCardCrudBloc.add(GiftCardCrudEvent.loadAll(queryParameters: {
      'offset': pagingController.itemList?.length,
    }));
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final bottomPadding =
        context.viewPadding.bottom == 0 ? 12.0 : context.viewPadding.bottom;
    return BlocListener<GiftCardCrudBloc, GiftCardCrudState>(
      bloc: giftCardCrudBloc,
      listener: (context, state) {
        state.whenOrNull(
          giftCards: (giftCards, length) async {
            final isLastPage = length < GiftCardCrudBloc.pageSize;
            if (refreshController.isRefresh) {
              pagingController.removePageRequestListener(_loadPage);
              pagingController.value = const PagingState(
                  nextPageKey: null, error: null, itemList: null);
              await Future.delayed(const Duration(milliseconds: 250));
            }
            if (isLastPage) {
              pagingController.appendLastPage(giftCards);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + giftCards.length;
              pagingController.appendPage(giftCards, nextPageKey);
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
        floatingActionButton: FloatingActionButton.extended(
          heroTag: UniqueKey(),
          label: const Text('Gift Card'),
          icon: const Icon(Icons.add),
          onPressed: () async => await showBarModalBottomSheet(
              overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
              backgroundColor: context.theme.scaffoldBackgroundColor,
              context: context,
              builder: (context) => const CreateProductGiftCardView()),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(bottom: bottomPadding),
          decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              border: Border(
                  top: BorderSide(
                      color: context.isDark ? Colors.white : Colors.black))),
          child: ListTile(
            title: const Text('Gift Cards History'),
            subtitle: Text('See the history of purchased Gift Cards',
                style: smallTextStyle),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => context.pushRoute(const CustomGiftCardsRoute()),
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: BlocBuilder<GiftCardCrudBloc, GiftCardCrudState>(
                bloc: giftCardCrudBloc,
                builder: (context, state) {
                  final productsCount = giftCardCrudBloc.state
                          .mapOrNull(giftCards: (state) => state.count) ??
                      0;
                  return Text(
                      productsCount != 0
                          ? 'Gift Cards ($productsCount)'
                          : 'Gift Cards',
                      overflow: TextOverflow.ellipsis);
                },
              ),
            ),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => pagingController.refresh(),
            child: PagedListView.separated(
              pagingController: pagingController,
              padding: const EdgeInsets.only(bottom: 80, top: 10),
              builderDelegate: PagedChildBuilderDelegate<Product>(
                animateTransitions: true,
                itemBuilder: (context, product, index) {
                  final published = product.status == ProductStatus.published;
                  final listTile = GiftCardListTile(
                    giftCard: product,
                    onToggle: () async {
                      // await controller.toggleProduct(product);
                    },
                    onDelete: () async {
                      // await controller.deleteProduct(product.id!);
                    },
                  );
                  const disabledDot = Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.circle, color: Colors.red, size: 8),
                  );
                  if (published) {
                    return listTile;
                  } else {
                    return Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [listTile, disabledDot],
                    );
                  }
                },
                noItemsFoundIndicatorBuilder: (_) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Are you ready to sell your first Gift Card?'),
                      Text(
                        'No Gift Card has been added yet.',
                        style: smallTextStyle?.copyWith(color: manatee),
                      ),
                      TextButton(
                          onPressed: () async {
                            await showBarModalBottomSheet(
                                context: context,
                                backgroundColor:
                                    context.theme.scaffoldBackgroundColor,
                                overlayStyle: context
                                    .theme.appBarTheme.systemOverlayStyle,
                                builder: (context) =>
                                    const CreateProductGiftCardView());
                          },
                          child: const Text('Create Gift Card'))
                    ],
                  );
                },
                firstPageProgressIndicatorBuilder: (context) =>
                    const GiftCardsLoadingPage(),
                firstPageErrorIndicatorBuilder: (context) =>
                    PaginationErrorPage(pagingController: pagingController),
              ),
              separatorBuilder: (_, __) => const Divider(height: 0),
            ),
          ),
        ),
      ),
    );
  }
}
