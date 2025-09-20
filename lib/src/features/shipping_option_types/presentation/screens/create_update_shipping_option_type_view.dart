import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/features/shipping_option_types/presentation/bloc/shipping_option_types_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@RoutePage()
class CreateUpdateShippingOptionTypeView extends StatefulWidget {
  const CreateUpdateShippingOptionTypeView({super.key, this.shippingOptionType});

  final ShippingOptionType? shippingOptionType;

  @override
  State<CreateUpdateShippingOptionTypeView> createState() =>
      _CreateUpdateShippingOptionTypeViewState();
}

class _CreateUpdateShippingOptionTypeViewState extends State<CreateUpdateShippingOptionTypeView> {
  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();
  final _codeController = TextEditingController();
  final _descriptionController = TextEditingController();
  late final ShippingOptionTypesBloc _crudBloc;

  bool get isUpdate => widget.shippingOptionType != null;

  @override
  void initState() {
    _crudBloc = ShippingOptionTypesBloc.instance;
    if (isUpdate) {
      _labelController.text = widget.shippingOptionType!.label ?? '';
      _codeController.text = widget.shippingOptionType!.code ?? '';
      _descriptionController.text = widget.shippingOptionType!.description ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    _crudBloc.close();
    _labelController.dispose();
    _codeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShippingOptionTypesBloc, ShippingOptionTypesState>(
      bloc: _crudBloc,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            loading();
          },
          option: (_) {
            dismissLoading();
            context.showSnackBar(isUpdate
                ? 'Shipping Option Type updated successfully'
                : 'Shipping Option Type created successfully');
            context.pop(true);
          },
          error: (e) {
            dismissLoading();
            context.showSnackBar(e.toSnackBarString());
          },
        );
      },
      child: HideKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: Text(isUpdate ? 'Update Shipping Option Type' : 'Create Shipping Option Type'),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (isUpdate) {
                      _crudBloc.add(
                        ShippingOptionTypesEvent.update(
                          widget.shippingOptionType!.id!,
                          UpdateShippingOptionTypeReq(
                            label: _labelController.text,
                            code: _codeController.text,
                            description: _descriptionController.text,
                          ),
                        ),
                      );
                    } else {
                      _crudBloc.add(
                        ShippingOptionTypesEvent.create(
                          CreateShippingOptionTypeReq(
                            label: _labelController.text,
                            code: _codeController.text,
                            description: _descriptionController.text,
                          ),
                        ),
                      );
                    }
                  }
                },
                child: Text('Save'),
              ),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Form(
                key: _formKey,
                child: FlexExpansionTile(
                  title: const Text('General Information'),
                  initiallyExpanded: true,
                  child: Column(
                    children: [
                      LabeledTextField(
                        label: 'Label',
                        controller: _labelController,
                        required: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a label';
                          }
                          return null;
                        },
                      ),
                      LabeledTextField(
                        label: 'Code',
                        controller: _codeController,
                        required: !isUpdate,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a code';
                          }
                          return null;
                        },
                      ),
                      LabeledTextField(
                        label: 'Description',
                        controller: _descriptionController,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
