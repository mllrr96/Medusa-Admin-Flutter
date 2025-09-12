import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/features/regions/presentation/bloc/region_crud/region_crud_bloc.dart';
import 'package:medusa_admin/src/features/store_details/presentation/bloc/store/store_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StoreUpdateView extends StatefulWidget {
  const StoreUpdateView(this.store, {super.key});

  final Store store;

  @override
  State<StoreUpdateView> createState() => _StoreUpdateViewState();
}

class _StoreUpdateViewState extends State<StoreUpdateView> {
  final nameController = TextEditingController();
  late final RegionCrudBloc _regionCrudBloc;
  late final StoreBloc _storeBloc;
  StoreCurrency? defaultCurrency;
  Region? defaultRegion;
  final _formKey = GlobalKey<FormState>();

  List<StoreCurrency> get currencies => widget.store.supportedCurrencies ?? [];

  String? get defaultRegionId => widget.store.defaultRegionId;

  @override
  void initState() {
    _regionCrudBloc = RegionCrudBloc.instance;
    _storeBloc = StoreBloc.instance;
    _regionCrudBloc.add(RegionCrudEvent.loadAll());
    nameController.text = widget.store.name;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    _storeBloc.close();
    _regionCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreBloc, StoreState>(
      bloc: _storeBloc,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            loading();
          },
          store: (_){
            context.showSnackBar('Store updated successfully');
            dismissLoading();
            context.pop(true);
          },
          error: (err) {
            context.showSnackBar(err.toSnackBarString());
            dismissLoading();
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Update Store'),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: FilledButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  if (_formKey.currentState?.validate() != true) {
                    return;
                  }
                  var storeCurrencies = List<StoreCurrency>.from(currencies);
                  if (defaultCurrency != null) {
                    for (var i = 0; i < storeCurrencies.length; i++) {
                      var currency = storeCurrencies[i];
                      storeCurrencies[i] = currency.copyWith(
                          isDefault: currency.currencyCode == defaultCurrency!.currencyCode);
                    }
                  }
                  _storeBloc.add(
                    StoreEvent.updateStore(
                      widget.store.id,
                      UpdateStoreReq(
                        name: nameController.text,
                        defaultRegionId: defaultRegion?.id,
                        supportedCurrencies: storeCurrencies,
                      ),
                    ),
                  );
                },
                child: Text('Update')),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LabeledTextField(
                  label: 'Store Name',
                  controller: nameController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Store name is required';
                    }
                    return null;
                  },
                ),
                const Gap(10),
                DropdownMenuFormField<StoreCurrency>(
                    label: Text('Default currency'),
                    width: double.maxFinite,
                    initialSelection: currencies.singleWhere((currency) => currency.isDefault),
                    onSaved: (value) {
                      defaultCurrency = value;
                    },
                    dropdownMenuEntries: currencies
                        .map(
                          (storeCurrency) =>
                          DropdownMenuEntry<StoreCurrency>(
                            value: storeCurrency,
                            label: storeCurrency.currencyCode.capitalize,
                          ),
                    )
                        .toList()),
                const Gap(20),
                BlocBuilder<RegionCrudBloc, RegionCrudState>(
                  bloc: _regionCrudBloc,
                  builder: (context, state) {
                    return state.maybeWhen(
                      regions: (regions, _) {
                        final defaultRegion = regions
                            .where((region) => region.id == defaultRegionId)
                            .toList()
                            .firstOrNull;
                        return DropdownMenuFormField<Region>(
                          label: Text('Default region'),
                          width: double.maxFinite,
                          initialSelection: defaultRegion,
                          onSaved: (value) {
                            this.defaultRegion = value;
                          },
                          dropdownMenuEntries: regions
                              .map((region) =>
                              DropdownMenuEntry<Region>(value: region, label: region.name))
                              .toList(),
                        );
                      },
                      orElse: () =>
                          Skeletonizer(
                            enabled: state.maybeWhen(regions: (_, __) => false, orElse: () => true),
                            child: DropdownMenuFormField(
                              width: double.maxFinite,
                              dropdownMenuEntries: [DropdownMenuEntry(value: null, label: '')],
                            ),
                          ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
