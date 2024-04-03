import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/paging_controller.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/gift_card_crud/gift_card_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/medusa_sliver_app_bar.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'components/index.dart';
import '../../../core/utils/enums.dart';

@RoutePage()
class CustomGiftCardsView extends StatefulWidget {
  const CustomGiftCardsView({super.key});

  @override
  State<CustomGiftCardsView> createState() => _CustomGiftCardsViewState();
}

class _CustomGiftCardsViewState extends State<CustomGiftCardsView> {
  final pagingController = PagingController<int, GiftCard>(
      firstPageKey: 0, invisibleItemsThreshold: 3);
  final refreshController = RefreshController();
  late GiftCardCrudBloc giftCardBloc;
  late GiftCardCrudBloc giftCardCrudBloc;

  @override
  void initState() {
    giftCardBloc = GiftCardCrudBloc.instance;
    giftCardCrudBloc = GiftCardCrudBloc.instance;
    pagingController.addPageRequestListener(_loadPage);
    super.initState();
  }

  @override
  void dispose() {
    giftCardBloc.close();
    giftCardCrudBloc.close();
    pagingController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  void _loadPage(int _) {
    giftCardBloc.add(
      GiftCardCrudEvent.loadAll(
        queryParameters: {
          'offset': pagingController.itemList?.length ?? 0,
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GiftCardCrudBloc, GiftCardCrudState>(
          bloc: giftCardBloc,
          listener: (context, state) {
            state.mapOrNull(
              giftCards: (state) async {
                final isLastPage =
                    state.giftCards.length < GiftCardCrudBloc.pageSize;
                if (refreshController.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);
                  pagingController.value = const PagingState(
                      nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(state.giftCards);
                } else {
                  final nextPageKey = pagingController.nextPageKey ??
                      0 + state.giftCards.length;
                  pagingController.appendPage(state.giftCards, nextPageKey);
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
        ),
        BlocListener<GiftCardCrudBloc, GiftCardCrudState>(
          bloc: giftCardCrudBloc,
          listener: (context, state) {
            state.maybeWhen(
                loading: (_) => loading(),
                giftCard: (giftCard) {
                  context.showSnackBar('Gift card updated');
                  pagingController.refresh();
                  dismissLoading();
                },
                error: (failure) {
                  dismissLoading();
                  context.showSnackBar(failure.toSnackBarString());
                },
                orElse: () => dismissLoading());
          },
        ),
      ],
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SearchFloatingActionButton(
                    searchCategory: SearchCategory.giftCards),
                Gap(4.0),
              ],
            ),
            const Gap(6.0),
            FloatingActionButton.extended(
              onPressed: () =>
                  context.pushRoute(CreateUpdateCustomGiftCardRoute()),
              label: const Text('Custom Gift Card'),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            MedusaSliverAppBar(
              title: Builder(builder: (context) {
                final ordersCount = giftCardBloc.state.maybeMap(
                    giftCards: (state) => state.count, orElse: () => 0);
                return Text(
                    ordersCount > 0
                        ? 'Gift Cards History ($ordersCount)'
                        : 'Gift Cards History',
                    overflow: TextOverflow.ellipsis);
              }),
            ),
          ],
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: () => _loadPage(0),
            child: PagedListView.separated(
                pagingController: pagingController,
                padding: const EdgeInsets.only(bottom: 80, top: 8),
                builderDelegate: PagedChildBuilderDelegate<GiftCard>(
                  animateTransitions: true,
                  itemBuilder: (context, giftCard, index) {
                    final isDisabled = giftCard.isDisabled;
                    final listTile = CustomGiftCardTile(
                      giftCard,
                      onTap: () async {
                        await showBarModalBottomSheet(
                          context: context,
                          backgroundColor:
                              context.theme.scaffoldBackgroundColor,
                          overlayStyle:
                              context.theme.appBarTheme.systemOverlayStyle,
                          builder: (context) => CustomGiftCardView(
                            giftCard,
                            onEdit: () async {
                              final result = await context.pushRoute(
                                CreateUpdateCustomGiftCardRoute(
                                  giftCard: giftCard,
                                ),
                              );
                              if (result is GiftCard) {
                                pagingController.updateItem(result, index);
                                setState(() {});
                              }
                            },
                            onToggle: () async {
                              giftCardCrudBloc.add(
                                GiftCardCrudEvent.update(
                                  giftCard.id!,
                                  UpdateGiftCardReq(isDisabled: !isDisabled),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      onEdit: () async {
                        final result = await context.pushRoute(
                          CreateUpdateCustomGiftCardRoute(
                            giftCard: giftCard,
                          ),
                        );
                        if (result is GiftCard) {
                          pagingController.updateItem(result, index);
                          setState(() {});
                        }
                      },
                      onToggle: () async {
                        giftCardCrudBloc.add(
                          GiftCardCrudEvent.update(
                            giftCard.id!,
                            UpdateGiftCardReq(isDisabled: !isDisabled),
                          ),
                        );
                      },
                    );
                    const disabledDot = Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.circle, color: Colors.red, size: 10),
                    );
                    if (isDisabled) {
                      return Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          listTile,
                          disabledDot,
                        ],
                      );
                    } else {
                      return listTile;
                    }
                  },
                  noItemsFoundIndicatorBuilder: (_) =>
                      const Center(child: Text('No Gift cards')),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const CustomGiftCardsLoadingPage(),
                  firstPageErrorIndicatorBuilder: (context) =>
                      PaginationErrorPage(pagingController: pagingController),
                ),
                separatorBuilder: (_, __) => const Divider(height: 0)),
          ),
        ),
      ),
    );
  }
}
