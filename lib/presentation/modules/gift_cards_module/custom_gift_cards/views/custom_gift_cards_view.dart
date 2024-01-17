import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/modules/gift_cards_module/custom_gift_cards/components/custom_gift_cards_loading_page.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/extension.dart';
import 'package:medusa_admin/domain/use_case/gift_cards_use_case.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/widgets/scrolling_expandable_fab.dart';
import 'package:medusa_admin/presentation/widgets/search_floating_action_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../components/index.dart';
import '../controllers/custom_gift_cards_controller.dart';
import '../../../../../core/utils/enums.dart';

@RoutePage()
class CustomGiftCardsView extends StatelessWidget {
  const CustomGiftCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    final manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;

    return GetBuilder<CustomGiftCardsController>(
        init: CustomGiftCardsController(
            giftCardsUseCase: GiftCardsUseCase.instance),
        builder: (controller) {
          return Scaffold(
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
                ScrollingExpandableFab(
                  controller: controller.scrollController,
                  label: 'Custom Gift Card',
                  icon: const Icon(Icons.add),
                  onPressed: () =>
                      context.pushRoute(CreateUpdateCustomGiftCardRoute()),
                ),
              ],
            ),
            body: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () async => await controller.refreshData(),
              header: const MaterialClassicHeader(offset: 100),
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverAppBar(
                    systemOverlayStyle: context.defaultSystemUiOverlayStyle,
                    floating: true,
                    snap: true,
                    title: Obx(() => Text(
                        controller.giftCardsCount.value != 0
                            ? 'Gift Cards History (${controller.giftCardsCount.value})'
                            : 'Gift Cards History',
                        overflow: TextOverflow.ellipsis)),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'See the history of purchased Gift Cards',
                        style: smallTextStyle?.copyWith(color: manatee),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 80),
                    sliver: PagedSliverList.separated(
                        pagingController: controller.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<GiftCard>(
                          itemBuilder: (context, giftCard, index) {
                            final isDisabled = giftCard.isDisabled;

                            final listTile = CustomGiftCardTile(
                              giftCard,
                              onToggle: () async {
                                await controller.updateCustomGiftCard(
                                  context: context,
                                  id: giftCard.id!,
                                  userUpdateGiftCardReq: UserUpdateGiftCardReq(
                                      isDisabled: !isDisabled),
                                  getBack: false,
                                );
                              },
                            );
                            const disabledDot = Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.circle,
                                  color: Colors.red, size: 10),
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
                              PaginationErrorPage(
                                  pagingController:
                                      controller.pagingController),
                        ),
                        separatorBuilder: (_, __) => const Divider(height: 0)),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
