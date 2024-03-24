import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/data/models/add_update_tax_rate_req.dart';
import 'package:medusa_admin/presentation/blocs/tax_crud/tax_crud_bloc.dart';
import 'package:medusa_admin/presentation/cubits/tax_providers/tax_provider_cubit.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

import 'components/tax_rate_card.dart';

@RoutePage()
class TaxSettingsView extends StatefulWidget {
  const TaxSettingsView(this.region, {super.key});
  final Region region;

  @override
  State<TaxSettingsView> createState() => _TaxSettingsViewState();
}

class _TaxSettingsViewState extends State<TaxSettingsView> {
  late TaxProviderCubit taxProviderCubit;
  late TaxCrudBloc taxBloc;
  late TaxCrudBloc taxCrudBloc;

  final PagingController<int, TaxRate> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 3);
  final RefreshController refreshController = RefreshController();
  bool automaticTaxes = false;
  bool showAutomaticTaxesHint = false;
  bool giftCardsTaxable = false;
  bool showGiftCardsTaxableHint = false;
  TaxProvider? selectedTaxProvider;

  void _loadPage(int _) {
    taxBloc.add(
      TaxCrudEvent.loadAll(queryParameters: {
        'offset': _ == 0 ? 0 : pagingController.itemList?.length ?? 0,
      }),
    );
  }

  @override
  void initState() {
    taxBloc = TaxCrudBloc.instance;
    taxCrudBloc = TaxCrudBloc.instance;

    taxProviderCubit = TaxProviderCubit.instance;
    pagingController.addPageRequestListener(_loadPage);

    taxProviderCubit.fetch();
    automaticTaxes = widget.region.automaticTaxes ?? false;
    giftCardsTaxable = widget.region.giftCardsTaxable ?? false;
    super.initState();
  }

  @override
  void dispose() {
    taxBloc.close();
    taxCrudBloc.close();
    taxProviderCubit.close();
    pagingController.dispose();
    super.dispose();
  }

  bool same() {
    if (automaticTaxes == widget.region.automaticTaxes &&
        giftCardsTaxable == widget.region.giftCardsTaxable) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    const halfSpace = Gap(6);
    return MultiBlocListener(
      listeners: [
        BlocListener<TaxCrudBloc, TaxCrudState>(
          bloc: taxBloc,
          listener: (context, state) {
            state.mapOrNull(
              taxRates: (state) async {
                final isLastPage = state.taxRates.length < TaxCrudBloc.pageSize;
                if (refreshController.isRefresh) {
                  pagingController.removePageRequestListener(_loadPage);
                  pagingController.value = const PagingState(
                      nextPageKey: null, error: null, itemList: null);
                  await Future.delayed(const Duration(milliseconds: 250));
                }
                if (isLastPage) {
                  pagingController.appendLastPage(state.taxRates);
                } else {
                  final nextPageKey =
                      pagingController.nextPageKey ?? 0 + state.taxRates.length;
                  pagingController.appendPage(state.taxRates, nextPageKey);
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
        BlocListener<TaxCrudBloc, TaxCrudState>(
          bloc: taxCrudBloc,
          listener: (context, state) {
            state.mapOrNull(
              deleted: (_) {
                pagingController.refresh();
                context.showSnackBar('Tax Rate Deleted');
              },
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.region.name ?? ''),
          actions: [
            TextButton(
                onPressed: () async {
                  final result = await context.pushRoute(AddUpdateTaxRateRoute(
                    addUpdateTaxRateReq:
                        AddUpdateTaxRateReq(regionId: widget.region.id!),
                  ));
                  if (result is bool) {
                    pagingController.refresh();
                  }
                },
                child: const Text('New Tax Rate'))
          ],
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewPadding.bottom,
              right: 18.0,
              left: 18.0,
              top: MediaQuery.of(context).viewPadding.bottom / 2),
          child: FilledButton(
            onPressed: same() ? null : () {},
            child: Text('Save',
                style: TextStyle(color: same() ? Colors.grey : Colors.white)),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                margin:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(12.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tax Calculation Settings', style: largeTextStyle),
                    space,
                    Text('Tax Provider',
                        style: mediumTextStyle?.copyWith(color: manatee)),
                    halfSpace,
                    BlocBuilder<TaxProviderCubit, TaxProviderState>(
                      bloc: taxProviderCubit,
                      builder: (context, state) {
                        return state.maybeMap(
                            loading: (_) => const Skeletonizer(
                                  enabled: true,
                                  child: TextField(
                                    enabled: false,
                                    decoration: InputDecoration(
                                      hintText: 'Loading Tax Providers',
                                      isDense: true,
                                    ),
                                  ),
                                ),
                            taxProviders: (_) =>
                                DropdownButtonFormField<TaxProvider>(
                                  style: context.bodyMedium,
                                  items: _.taxProviders
                                      .map((e) => DropdownMenuItem<TaxProvider>(
                                            value: e,
                                            child: Text(e.id ?? ''),
                                          ))
                                      .toList(),
                                  onChanged: (val) {},
                                  value: selectedTaxProvider,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.0)))),
                                ),
                            error: (error) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(error.failure.message),
                                    const Gap(6.0),
                                    TextButton(
                                        onPressed: () {
                                          taxProviderCubit.fetch();
                                        },
                                        child: const Text('Retry'))
                                  ],
                                ),
                            orElse: () => const SizedBox.shrink());
                      },
                    ),
                    space,
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: automaticTaxes,
                      onChanged: (val) {
                        if (val != null) {
                          automaticTaxes = val;
                          setState(() {});
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Calculate taxes automatically?'),
                      secondary: IconButton(
                        iconSize: 20,
                        isSelected: showAutomaticTaxesHint,
                        icon: const Icon(Icons.info_outlined),
                        selectedIcon: const Icon(Icons.info),
                        onPressed: () {
                          showAutomaticTaxesHint = !showAutomaticTaxesHint;
                          setState(() {});
                        },
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: child,
                        );
                      },
                      child: showAutomaticTaxesHint
                          ? Column(
                              children: [
                                ListTile(
                                  tileColor:
                                      context.theme.dialogBackgroundColor,
                                  leading: const Icon(Icons.info),
                                  title: Text(
                                    'When checked Medusa will automatically apply tax calculations to Carts in this Region. When unchecked you will have to manually compute taxes at checkout. Manual taxes are recommended if using a 3rd party tax provider to avoid performing too many requests',
                                    style: context.bodySmall
                                        ?.copyWith(color: manatee),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                const Divider(),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                    CheckboxListTile(
                      contentPadding: EdgeInsets.zero,
                      value: giftCardsTaxable,
                      onChanged: (val) {
                        if (val != null) {
                          giftCardsTaxable = val;
                          setState(() {});
                        }
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                      title: const Text('Apply tax to gift cards?'),
                      secondary: IconButton(
                        iconSize: 20,
                        isSelected: showGiftCardsTaxableHint,
                        icon: const Icon(Icons.info_outlined),
                        selectedIcon: const Icon(Icons.info),
                        onPressed: () {
                          showGiftCardsTaxableHint = !showGiftCardsTaxableHint;
                          setState(() {});
                        },
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return SizeTransition(
                          sizeFactor: animation,
                          child: child,
                        );
                      },
                      child: showGiftCardsTaxableHint
                          ? ListTile(
                              leading: const Icon(Icons.info),
                              title: Text(
                                'When checked taxes will be applied to gift cards on checkout. In some countries tax regulations require that taxes are applied to gift cards on purchase.',
                                style:
                                    context.bodySmall?.copyWith(color: manatee),
                                textAlign: TextAlign.justify,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                margin:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(12.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Details', style: context.headlineMedium),
                    halfSpace,
                    Text('Tax rates: ',
                        style: mediumTextStyle?.copyWith(color: manatee)),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              sliver: PagedSliverList.separated(
                separatorBuilder: (_, __) => const Gap(6.0),
                pagingController: pagingController,
                builderDelegate: PagedChildBuilderDelegate<TaxRate>(
                  animateTransitions: true,
                  itemBuilder: (context, taxRate, index) => TaxRateCard(
                    taxRate: taxRate,
                    onEditTap: () async {
                      final result =
                          await context.pushRoute(AddUpdateTaxRateRoute(
                        addUpdateTaxRateReq: AddUpdateTaxRateReq(
                            regionId: widget.region.id!, taxRate: taxRate),
                      ));
                      if (result is bool) {
                        pagingController.refresh();
                      }
                    },
                    onDeleteTap: () =>
                        taxCrudBloc.add(TaxCrudEvent.delete(taxRate.id!)),
                  ),
                  firstPageProgressIndicatorBuilder: (context) =>
                      const Skeletonizer(
                    enabled: true,
                    child: Column(
                      children: [
                        TaxRateCard(
                            taxRate:
                                TaxRate(name: 'Default', rate: 0.0, code: '-')),
                        Gap(6.0),
                        TaxRateCard(
                          taxRate:
                              TaxRate(name: 'Default', rate: 0.0, code: '-'),
                        ),
                      ],
                    ),
                  ),
                  firstPageErrorIndicatorBuilder: (_) =>
                      PaginationErrorPage(pagingController: pagingController),
                  noItemsFoundIndicatorBuilder: (_) => const Column(
                    children: [
                      TaxRateCard(
                          taxRate:
                              TaxRate(name: 'Default', rate: 0.0, code: '-')),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
