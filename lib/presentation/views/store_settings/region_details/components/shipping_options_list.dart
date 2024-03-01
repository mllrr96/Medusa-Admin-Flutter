import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/core/route/app_router.dart';
import 'package:medusa_admin/presentation/blocs/shipping_option_crud/shipping_option_crud_bloc.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/regions_module/add_update_shipping_option/controllers/add_update_shipping_option_controller.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'shipping_option_card.dart';

class ShippingOptionsList extends StatefulWidget {
  const ShippingOptionsList(this.region, {super.key, this.isReturn = false});
  final Region region;
  final bool isReturn;

  @override
  State<ShippingOptionsList> createState() => _ShippingOptionsListState();
}

class _ShippingOptionsListState extends State<ShippingOptionsList> {
  late ShippingOptionCrudBloc shippingOptionCrudBloc;

  @override
  void initState() {
    shippingOptionCrudBloc = ShippingOptionCrudBloc.instance;
    shippingOptionCrudBloc.add(
      ShippingOptionCrudEvent.loadAll(
        queryParameters: {
          'region_id': widget.region.id,
          'is_return': widget.isReturn,
        },
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    shippingOptionCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShippingOptionCrudBloc, ShippingOptionCrudState>(
      bloc: shippingOptionCrudBloc,
      listener: (context, state) {
        state.mapOrNull(deleted: (_) {
          context.showSnackBar(widget.isReturn
              ? 'Return shipping option deleted'
              : 'Shipping option deleted');
          shippingOptionCrudBloc.add(
            ShippingOptionCrudEvent.loadAll(
              queryParameters: {
                'region_id': widget.region.id,
                'is_return': widget.isReturn,
              },
            ),
          );
        });
      },
      builder: (context, state) {
        return state.maybeMap(
            loading: (_) => Skeletonizer(
                  child: ShippingOptionCard(
                    shippingOption: ShippingOption(
                        name: 'Shipping option',
                        regionId: '',
                        profileId: '',
                        providerId: '',
                        priceType: ShippingOptionPriceType.calculated,
                        amount: 1200,
                        region: const Region(
                            name: 'Test', currencyCode: 'USD', taxRate: 1000),
                        requirements: [
                          ShippingOptionRequirement(
                            type: RequirementType.minSubtotal,
                            amount: 1200,
                            shippingOptionId: null,
                          ),
                          ShippingOptionRequirement(
                            type: RequirementType.maxSubtotal,
                            amount: 2200,
                            shippingOptionId: null,
                          ),
                        ]),
                  ),
                ),
            error: (_) {
              return Column(
                children: [
                  const Center(
                    child: Text('Error loading shipping options'),
                  ),
                  ElevatedButton(
                    onPressed: () => shippingOptionCrudBloc.add(
                      ShippingOptionCrudEvent.loadAll(
                        queryParameters: {
                          'region_id': widget.region.id,
                          'is_return': widget.isReturn,
                        },
                      ),
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              );
            },
            shippingOptions: (state) {
              final shippingOptions = state.shippingOptions;

              return ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: (_, __) => const SizedBox(height: 6.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: shippingOptions.length,
                itemBuilder: (context, index) => ShippingOptionCard(
                  shippingOption: shippingOptions[index],
                  onDeleteTap: () => shippingOptionCrudBloc.add(
                    ShippingOptionCrudEvent.delete(
                      shippingOptions[index].id!,
                    ),
                  ),
                  onEditTap: () =>
                      context.pushRoute(AddUpdateShippingOptionRoute(
                    addUpdateShippingOptionReq: AddUpdateShippingOptionReq(
                      region: widget.region,
                      shippingOption: shippingOptions[index],
                    ),
                  )),
                ),
              );
            },
            orElse: () => const SizedBox.shrink());
      },
    );
  }
}
