import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/features/stock_locations/presentation/bloc/stock_locations_bloc.dart';
import 'package:medusa_admin/src/features/store_settings/presentation/widgets/countries/country_view.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

@RoutePage()
class CreateUpdateStockLocationView extends StatefulWidget {
  const CreateUpdateStockLocationView({super.key, this.stockLocation});

  final StockLocation? stockLocation;

  @override
  State<CreateUpdateStockLocationView> createState() => _CreateUpdateStockLocationViewState();
}

class _CreateUpdateStockLocationViewState extends State<CreateUpdateStockLocationView> {
  StockLocation? get stockLocation => widget.stockLocation;
  Country? selectedCountry;

  bool get isUpdate => stockLocation != null;
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _address2Ctrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _postalCodeCtrl = TextEditingController();

  final _countryCtrl = TextEditingController();
  final _stateCtrl = TextEditingController();
  final _companyCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final flexCtrl = FlexExpansionTileController();
  late final StockLocationsBloc _stockLocationsBloc;

  @override
  void initState() {
    _stockLocationsBloc = StockLocationsBloc.instance;
    if (isUpdate){
      _nameCtrl.text = stockLocation!.name;
      _addressCtrl.text = stockLocation!.address?.address1 ?? '';
      _address2Ctrl.text = stockLocation!.address?.address2 ?? '';
      _cityCtrl.text = stockLocation!.address?.city ?? '';
      _postalCodeCtrl.text = stockLocation!.address?.postalCode ?? '';
      _stateCtrl.text = stockLocation!.address?.province ?? '';
      _companyCtrl.text = stockLocation!.address?.company ?? '';
      _phoneCtrl.text = stockLocation!.address?.phone ?? '';
      if (stockLocation!.address?.countryCode != null) {
        selectedCountry = stockLocation!.address!.countryCode?.getCountry;
        _countryCtrl.text = selectedCountry!.displayOnStore;
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    _stockLocationsBloc.close();
    _nameCtrl.dispose();
    _addressCtrl.dispose();
    _address2Ctrl.dispose();
    _cityCtrl.dispose();
    _postalCodeCtrl.dispose();
    _stateCtrl.dispose();
    _companyCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StockLocationsBloc, StockLocationsState>(
      bloc: _stockLocationsBloc,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            loading();
          },
          stockLocation: (stockLocation) {
            dismissLoading();
            context.showSnackBar(
              isUpdate
                  ? 'Stock location updated successfully'
                  : 'Stock location created successfully',
            );
            context.pop(true);
          },
          error: (e) {
            context.showSnackBar(e.toSnackBarString());
            dismissLoading();
          },
        );
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Create Stock Location'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                      'A stock location is a physical site where products are stored and shipped from.')),
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 12.0),
              child: FilledButton(
                  onPressed: () {
                    !flexCtrl.isExpanded ? flexCtrl.expand() : null;
                    if (!_formKey.currentState!.validate()) return;
                    assert(selectedCountry != null);
                    isUpdate ? _update() : _create();
                  },
                  child: const Text('Save')),
            ),
          ),
          body: HideKeyboard(
            child: Form(
              key: _formKey,
              child: SafeArea(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    FlexExpansionTile(
                      controller: flexCtrl,
                      maintainState: true,
                      initiallyExpanded: true,
                      title: const Text('Stock Location Details'),
                      child: Column(
                        children: [
                          LabeledTextField(
                            label: 'Name',
                            controller: _nameCtrl,
                            required: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                          ),
                          LabeledTextField(
                            label: 'Address',
                            controller: _addressCtrl,
                            required: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter an address';
                              }
                              return null;
                            },
                          ),
                          LabeledTextField(
                              label: 'Apartment, suite, etc', controller: _address2Ctrl),
                          LabeledTextField(label: 'City', controller: _cityCtrl),
                          LabeledTextField(label: 'Postal Code', controller: _postalCodeCtrl),
                          LabeledTextField(
                            label: 'Country',
                            required: true,
                            controller: _countryCtrl,
                            validator: (_) {
                              if (selectedCountry == null) {
                                return 'Please select a country';
                              }
                              return null;
                            },
                            readOnly: true,
                            onTap: () async {
                              final result = await showBarModalBottomSheet<List<Country>>(
                                  context: context,
                                  backgroundColor: context.theme.scaffoldBackgroundColor,
                                  overlayStyle: context.theme.appBarTheme.systemOverlayStyle,
                                  builder: (context) => const SelectCountryView());

                              if (result is List<Country> && result.isNotEmpty) {
                                selectedCountry = result.first;
                                _countryCtrl.text = selectedCountry!.displayOnStore;
                                setState(() {});
                              }
                            },
                          ),
                          LabeledTextField(label: 'State', controller: _stateCtrl),
                          LabeledTextField(label: 'Company', controller: _companyCtrl),
                          LabeledTextField(
                            label: 'Phone',
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void _create() {
    _stockLocationsBloc.add(
      StockLocationsEvent.create(
        CreateStockLocation(
          name: _nameCtrl.text,
          address: StockLocationAddress(
            address1: _addressCtrl.text,
            address2: _address2Ctrl.text.isEmpty ? null : _address2Ctrl.text,
            city: _cityCtrl.text.isEmpty ? null : _cityCtrl.text,
            postalCode: _postalCodeCtrl.text.isEmpty ? null : _postalCodeCtrl.text,
            phone: _phoneCtrl.text.isEmpty ? null : _phoneCtrl.text,
            company: _companyCtrl.text.isEmpty ? null : _companyCtrl.text,
            province: _stateCtrl.text.isEmpty ? null : _stateCtrl.text,
            countryCode: selectedCountry!.iso2,
          ),
        ),
      ),
    );
  }

  void _update() {
    _stockLocationsBloc.add(
      StockLocationsEvent.update(
        stockLocation!.id,
        UpdateStockLocation(
          name: _nameCtrl.text,
          address: StockLocationAddress(
            address1: _addressCtrl.text,
            address2: _address2Ctrl.text.isEmpty ? null : _address2Ctrl.text,
            city: _cityCtrl.text.isEmpty ? null : _cityCtrl.text,
            postalCode: _postalCodeCtrl.text.isEmpty ? null : _postalCodeCtrl.text,
            phone: _phoneCtrl.text.isEmpty ? null : _phoneCtrl.text,
            company: _companyCtrl.text.isEmpty ? null : _companyCtrl.text,
            province: _stateCtrl.text.isEmpty ? null : _stateCtrl.text,
            countryCode: selectedCountry!.iso2,
          ),
        ),
      ),
    );
  }
}
