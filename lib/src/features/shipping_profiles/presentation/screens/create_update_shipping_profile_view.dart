import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/utils/custom_text_field.dart';
import 'package:medusa_admin/src/core/utils/easy_loading.dart';
import 'package:medusa_admin/src/core/utils/hide_keyboard.dart';
import 'package:medusa_admin/src/features/shipping/presentation/bloc/shipping_profile_crud/shipping_profile_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@RoutePage()
class CreateUpdateShippingProfileView extends StatefulWidget {
  const CreateUpdateShippingProfileView({super.key});

  @override
  State<CreateUpdateShippingProfileView> createState() => _CreateUpdateShippingProfileViewState();
}

class _CreateUpdateShippingProfileViewState extends State<CreateUpdateShippingProfileView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  late final ShippingProfileCrudBloc _profileCrudBloc;

  @override
  void initState() {
    _profileCrudBloc = ShippingProfileCrudBloc.instance;
    super.initState();
  }

  @override
  void dispose() {
    _profileCrudBloc.close();
    _nameController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShippingProfileCrudBloc, ShippingProfileCrudState>(
      bloc: _profileCrudBloc,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            loading();
          },
          shippingProfile: (_) {
            dismissLoading();
            context.showSnackBar('Shipping Profile created successfully');
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
            title: Text('Create Shipping Profile'),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _profileCrudBloc.add(
                      ShippingProfileCrudEvent.create(
                        CreateShippingProfileReq(
                          name: _nameController.text,
                          type: _typeController.text,
                        ),
                      ),
                    );
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
                  title: const Text('Shipping Profile Details'),
                  initiallyExpanded: true,
                  child: Column(
                    children: [
                      LabeledTextField(
                        label: 'Name',
                        controller: _nameController,
                        required: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      LabeledTextField(
                        label: 'Type',
                        controller: _typeController,
                        required: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a type';
                          }
                          return null;
                        },
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
