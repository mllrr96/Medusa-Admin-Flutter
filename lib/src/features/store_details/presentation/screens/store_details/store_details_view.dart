import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/features/currencies/presentation/cubits/currencies/currencies_cubit.dart';
import 'package:medusa_admin/src/features/store_details/presentation/bloc/store/store_bloc.dart';
import 'package:medusa_admin/src/features/store_details/presentation/screens/store_details/store_details_fab.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

@RoutePage()
class StoreDetailsView extends StatefulWidget {
  const StoreDetailsView({super.key});

  @override
  State<StoreDetailsView> createState() => _StoreDetailsViewState();
}

class _StoreDetailsViewState extends State<StoreDetailsView> {
  final keyFrom = GlobalKey<FormState>();
  Store? store;
  late final StoreBloc storeBloc;
  late final CurrenciesCubit currenciesCubit;
  List<Currency> selectedCurrencies = [];

  @override
  void initState() {
    storeBloc = StoreBloc.instance;
    currenciesCubit = CurrenciesCubit.instance;
    store =
        context.read<StoreBloc>().state.whenOrNull(stores: (stores) => stores.stores.firstOrNull);
    if (store == null) {
      // context.read<StoreBloc>().add(const StoreEvent.loadStore());
      context.maybePop();
      return;
    }
    final currencyCodes = store?.supportedCurrencies?.map((e) => e.currency.code).toList() ?? [];
    //for every currency code in currencyCodes create a map with key 'code' and value the currency code
    final queryParameters =
        currencyCodes.asMap().map((key, value) => MapEntry('code[$key]', value));

    currenciesCubit.loadAll(queryParameters: queryParameters);
    super.initState();
  }

  @override
  void dispose() {
    storeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return BlocListener<StoreBloc, StoreState>(
      bloc: storeBloc,
      listener: (context, state) {
        state.maybeWhen(
            loading: () => loading(),
            store: (_) {
              dismissLoading();
              context.maybePop();
              context.showSnackBar('Store details updated successfully');
              // context.read<StoreBloc>().add(const StoreEvent.loadStore());
            },
            error: (e) {
              dismissLoading();
              context.showSnackBar(e.toSnackBarString());
            },
            orElse: () => dismissLoading());
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: context.defaultSystemUiOverlayStyle,
            title: Text(store?.name ?? 'Store Details'),
          ),
          floatingActionButton: selectedCurrencies.isNotEmpty
              ? StoreDetailsFab(
                  currenciesCount: selectedCurrencies.length,
                  onClear: () {
                    selectedCurrencies.clear();
                    setState(() {});
                  },
                  onRemove: () {
                    final updatedCurrencies = store?.supportedCurrencies
                            ?.where((element) => !selectedCurrencies
                                .map((e) => e.code)
                                .contains(element.currency.code))
                            .toList() ??
                        [];
                    if (store == null) return;
                    storeBloc.add(StoreEvent.updateStore(
                        store!.id, UpdateStoreReq(supportedCurrencies: updatedCurrencies)));
                    selectedCurrencies.clear();
                    setState(() {});
                  },
                )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(10.0),
              children: [
                FlexExpansionTile(
                  initiallyExpanded: true,
                  title: const Text('Store'),
                  childPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Store Name'),
                            Text(store?.name ?? ''),
                          ],
                        ),
                      ),
                      Gap(10),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Default Currency'),
                            Text(store?.supportedCurrencies
                                    ?.where(
                                      (element) => element.isDefault,
                                    )
                                    .firstOrNull
                                    ?.currency
                                    .name ??
                                '-'),
                          ],
                        ),
                      ),
                      Gap(10),
                      Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Default Region'),
                            Text(store?.defaultRegionId ?? '-'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(10),
                FlexExpansionTile(
                  initiallyExpanded: true,
                  title: const Text('Currencies'),
                  childPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                  child: BlocBuilder<CurrenciesCubit, CurrenciesState>(
                      bloc: currenciesCubit,
                      builder: (context, state) {
                        return state.maybeWhen(
                          loading: () => const Center(child: CircularProgressIndicator()),
                          currencies: (currencies, _) {
                            final supportedCurrencies = store?.supportedCurrencies ?? [];
                            return Column(
                              children: currencies.map((currency) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                    onTap: () {
                                      final isSelected = selectedCurrencies.contains(currency);
                                      if (isSelected) {
                                        selectedCurrencies.removeWhere(
                                            (element) => element.code == currency.code);
                                      } else {
                                        selectedCurrencies.add(currency);
                                      }
                                      setState(() {});
                                    },
                                    child: Ink(
                                      padding: const EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                      ),
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            visualDensity: VisualDensity.compact,
                                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                            value: selectedCurrencies.contains(currency),
                                            onChanged: (value) {
                                              if (value == null) return;
                                              if (!value) {
                                                selectedCurrencies.removeWhere(
                                                    (element) => element.code == currency.code);
                                              } else {
                                                selectedCurrencies.add(currency);
                                              }
                                              setState(() {});
                                            },
                                          ),
                                          const Gap(5),
                                          Text('${currency.name} (${currency.code})'),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                          error: (e) => Text(e.toSnackBarString()),
                          orElse: () => const SizedBox.shrink(),
                        );
                      }),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: Text('Manage your store\'s details',
                //       style: mediumTextStyle!.copyWith(color: manatee)),
                // ),
                // Form(
                //   key: keyFrom,
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                //     margin: const EdgeInsets.symmetric(horizontal: 10.0),
                //     decoration: BoxDecoration(
                //       borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                //       color: Theme.of(context).expansionTileTheme.backgroundColor,
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         // Text('General', style: largeTextStyle),
                //         // space,
                //         // LabeledTextField(
                //         //   label: 'Store Name',
                //         //   controller: storeCtrl,
                //         //   validator: (value) {
                //         //     if (value != null && value.removeAllWhitespace.isEmpty) {
                //         //       return "Store name can't be empty ";
                //         //     }
                //         //     return null;
                //         //   },
                //         // ),
                //         // const Divider(),
                //         // Text('Advanced settings', style: largeTextStyle),
                //         // space,
                //         // LabeledTextField(
                //         //   label: 'Swap link template',
                //         //   controller: swapLinkCtrl,
                //         //   hintText: 'https://acme.inc/swap={swap_id}',
                //         //   validator: (value) {
                //         //     if (value != null &&
                //         //         value.removeAllWhitespace.isNotEmpty &&
                //         //         !value.isUrl) {
                //         //       return "Invalid URL";
                //         //     }
                //         //     return null;
                //         //   },
                //         // ),
                //         // LabeledTextField(
                //         //   label: 'Draft order link template',
                //         //   controller: draftOrderCtrl,
                //         //   hintText: 'https://acme.inc/payment={payment_id}',
                //         //   validator: (value) {
                //         //     if (value != null &&
                //         //         value.removeAllWhitespace.isNotEmpty &&
                //         //         !value.isUrl) {
                //         //       return "Invalid URL";
                //         //     }
                //         //     return null;
                //         //   },
                //         // ),
                //         // LabeledTextField(
                //         //   label: 'Invite link template',
                //         //   controller: inviteLinkCtrl,
                //         //   hintText: 'https://acme.inc/invite?token={invite_token}',
                //         //   textInputAction: TextInputAction.done,
                //         //   validator: (value) {
                //         //     if (value != null &&
                //         //         value.removeAllWhitespace.isNotEmpty &&
                //         //         !value.isUrl) {
                //         //       return "Invalid URL";
                //         //     }
                //         //     return null;
                //         //   },
                //         // ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
