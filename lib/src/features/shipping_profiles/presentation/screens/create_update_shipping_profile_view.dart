import 'package:auto_route/annotations.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/src/features/shipping/presentation/bloc/shipping_profile_crud/shipping_profile_crud_bloc.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

@RoutePage()
class CreateUpdateShippingProfileView extends StatefulWidget {
  const CreateUpdateShippingProfileView({super.key, this.shippingProfile});

  final ShippingProfile? shippingProfile;

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.shippingProfile == null ? 'Create Shipping Profile' : 'Update Shipping Profile',
        ),
      ),
      body: ListView(padding: const EdgeInsets.all(16.0), children: [
        Form(
          key: _formKey,
          child: FlexExpansionTile(
            initiallyExpanded: true,
            title: const Text('General Information'),
          ),
        )
      ]),
    );
  }
}
