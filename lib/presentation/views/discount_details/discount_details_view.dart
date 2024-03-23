import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/blocs/discount_crud/discount_crud_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'components/index.dart';

@RoutePage()
class DiscountDetailsView extends StatefulWidget {
  const DiscountDetailsView(this.discount, {super.key});
  final Discount discount;

  @override
  State<DiscountDetailsView> createState() => _DiscountDetailsViewState();
}

class _DiscountDetailsViewState extends State<DiscountDetailsView> {
  final refreshController = RefreshController();
  late final DiscountCrudBloc discountCrudBloc;
  @override
  void initState() {
    discountCrudBloc = DiscountCrudBloc.instance;
    discountCrudBloc.add(DiscountCrudEvent.load(widget.discount.id!));
    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    discountCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = context.bodyMedium;
    const space = Gap(12);
    return BlocConsumer<DiscountCrudBloc, DiscountCrudState>(
      bloc: discountCrudBloc,
      listener: (context, state) => state.mapOrNull(
        deleted: (_) => context.maybePop(true),
      ),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle: context.defaultSystemUiOverlayStyle,
            title: const Text('Discount Details'),
          ),
          floatingActionButton: DiscountDetailsFab(discountCrudBloc),
          body: SafeArea(
            child: state.maybeMap(
              discount: (state) => SmartRefresher(
                controller: refreshController,
                onRefresh: () => discountCrudBloc
                    .add(DiscountCrudEvent.load(widget.discount.id!)),
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                      12.0, 8.0, 12.0, kToolbarHeight * 2),
                  children: [
                    DiscountDetailsCard(state.discount, toggle: () {
                      discountCrudBloc.add(DiscountCrudEvent.update(
                          state.discount.id!,
                          UserUpdateDiscountReq(
                            isDisabled: state.discount.isDisabled != null
                                ? !state.discount.isDisabled!
                                : true,
                          )));
                    }),
                    space,
                    ConfigurationsCard(state.discount),
                    space,
                    ConditionsCard(state.discount,
                        discountCrudBloc: discountCrudBloc),
                  ],
                ),
              ),
              initial: (_) => const SizedBox.shrink(),
              loading: (_) => DiscountLoadingPage(widget.discount),
              error: (e) => SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error loading discount \n ${e.failure.toString()}',
                      style: mediumTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const Gap(12.0),
                    FilledButton(
                        onPressed: () => discountCrudBloc
                            .add(DiscountCrudEvent.load(widget.discount.id!)),
                        child: const Text('Retry')),
                  ],
                ),
              ),
              deleted: (_) => const SizedBox.shrink(),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        );
      },
    );
  }
}
