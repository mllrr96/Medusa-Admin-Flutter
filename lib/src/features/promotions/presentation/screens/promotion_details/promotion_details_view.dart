import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';
import 'package:medusa_admin/src/features/promotions/presentation/bloc/promotion_crud/promotion_crud_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'components/index.dart';

@RoutePage()
class PromotionDetailsView extends StatefulWidget {
  const PromotionDetailsView(this.discount, {super.key});
  final Promotion discount;

  @override
  State<PromotionDetailsView> createState() => _PromotionDetailsViewState();
}

class _PromotionDetailsViewState extends State<PromotionDetailsView> {
  final refreshController = RefreshController();
  late final PromotionCrudBloc promotionCrudBloc;
  @override
  void initState() {
    promotionCrudBloc = PromotionCrudBloc.instance;
    promotionCrudBloc.add(PromotionCrudEvent.load(widget.discount.id));
    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    promotionCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    return BlocConsumer<PromotionCrudBloc, PromotionCrudState>(
      bloc: promotionCrudBloc,
      listener: (context, state) => state.mapOrNull(
        deleted: (_) => context.maybePop(true),
      ),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: context.defaultSystemUiOverlayStyle,
            title: const Text('Discount Details'),
          ),
          floatingActionButton: PromotionDetailsFab(promotionCrudBloc),
          body: SafeArea(
            child: state.maybeWhen(
              discount: (promotion) => SmartRefresher(
                controller: refreshController,
                onRefresh: () => promotionCrudBloc
                    .add(PromotionCrudEvent.load(widget.discount.id)),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                      12.0, 8.0, 12.0, kToolbarHeight * 2),
                  children: [
                    // DiscountDetailsCard(promotion, toggle: () {
                    //   PromotionCrudBloc.add(PromotionCrudEvent.update(
                    //       promotion.id,
                    //       PostPromotionReq(
                    //         // isDisabled: !promotion.isDisabled,
                    //       )));
                    // }),
                    space,
                    ConfigurationsCard(promotion),
                    space,
                    ConditionsCard(promotion,
                        promotionCrudBloc: promotionCrudBloc),
                  ],
                ),
              ),
              initial: () => const SizedBox.shrink(),
              loading: (_) => PromotionLoadingPage(widget.discount),
              error: (e) => SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error loading discount \n ${e.toString()}',
                      style: mediumTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(12.0),
                    FilledButton(
                        onPressed: () => promotionCrudBloc
                            .add(PromotionCrudEvent.load(widget.discount.id)),
                        child: const Text('Retry')),
                  ],
                ),
              ),
              deleted: () => const SizedBox.shrink(),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
