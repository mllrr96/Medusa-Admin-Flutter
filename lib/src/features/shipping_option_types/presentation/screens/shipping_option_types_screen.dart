import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/src/features/shipping_option_types/presentation/bloc/shipping_option_types_bloc.dart';

@RoutePage()
class ShippingOptionTypesScreen extends StatelessWidget {
  const ShippingOptionTypesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShippingOptionTypesBloc.instance..add( ShippingOptionTypesEvent.load(null)),
      child: const Scaffold(
        body: Center(
          child: Text('Shipping Option Types'),
        ),
      ),
    );
  }
}
