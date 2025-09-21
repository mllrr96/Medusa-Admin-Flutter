import 'package:auto_route/auto_route.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:medusa_admin/src/core/extensions/string_extension.dart';
import 'package:medusa_admin/src/features/fulfillment_providers/presentation/bloc/fulfillment_providers_bloc.dart';
import 'package:medusa_admin/src/features/stock_locations/presentation/bloc/stock_locations_bloc.dart';
import 'package:medusa_admin/src/features/stock_locations/presentation/widgets/stock_location_shipping_tile.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class StockLocationDetailsScreen extends StatefulWidget {
  const StockLocationDetailsScreen(this.stockLocation, {super.key});

  final StockLocation stockLocation;

  @override
  State<StockLocationDetailsScreen> createState() => _StockLocationDetailsScreenState();
}

class _StockLocationDetailsScreenState extends State<StockLocationDetailsScreen> {
  StockLocation get stockLocation => widget.stockLocation;
  late final StockLocationsBloc _stockLocationsBloc;
  late final FulfillmentProvidersBloc _fulfillmentProvidersBloc = FulfillmentProvidersBloc.instance;

  @override
  void initState() {
    _stockLocationsBloc = StockLocationsBloc.instance;
    _stockLocationsBloc.add(StockLocationsEvent.retrieve(
      stockLocation.id,
      query: {
        'fields': 'name,*sales_channels,*address,*fulfillment_sets,*fulfillment_sets.service_zones,'
            '*fulfillment_sets.service_zones.geo_zones,*fulfillment_sets.service_zones.shipping_options,'
            '*fulfillment_sets.service_zones.shipping_options.rules,*fulfillment_sets.service_zones.shipping_options.shipping_profile'
      },
    ));
    _fulfillmentProvidersBloc.add(FulfillmentProvidersEvent.load(query: {
      'stock_location_id': stockLocation.id,
    }));
    super.initState();
  }

  @override
  void dispose() {
    _stockLocationsBloc.close();
    _fulfillmentProvidersBloc.close();
    super.dispose();
  }

  FulfillmentSet? getShippingFulfillmentSet(List<FulfillmentSet>? sets) {
    if (sets == null || sets.isEmpty) {
      return null;
    }
    final shippingSet = sets.firstWhere(
      (element) => element.type == 'shipping',
      orElse: () => FulfillmentSet(type: 'none'),
    );
    if (shippingSet.type != 'shipping') {
      return null;
    }
    return shippingSet;
  }

  FulfillmentSet? getPickupFulfillmentSet(List<FulfillmentSet>? sets) {
    if (sets == null || sets.isEmpty) {
      return null;
    }
    final pickupSet = sets.firstWhere(
      (element) => element.type == 'pickup',
      orElse: () => FulfillmentSet(type: 'none'),
    );
    if (pickupSet.type != 'pickup') {
      return null;
    }
    return pickupSet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockLocation.name),
      ),
      body: SafeArea(
        child: BlocBuilder<StockLocationsBloc, StockLocationsState>(
          bloc: _stockLocationsBloc,
          builder: (context, state) {
            final currentStockLocation = state.maybeWhen(
              stockLocation: (stockLocation) => stockLocation,
              orElse: () => stockLocation,
            );

            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                FlexExpansionTile(
                    initiallyExpanded: true,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(currentStockLocation.name),
                          contentPadding: EdgeInsetsDirectional.only(start: 16),
                          subtitle: Text(
                              '${currentStockLocation.address?.city ?? ''}, ${currentStockLocation.address?.countryCode.getCountry.displayOnStore ?? ''}'),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(LucideIcons.ellipsisVertical),
                              padding: EdgeInsets.all(16.0)),
                        ),
                      ],
                    )),
                const Gap(16),
                FlexExpansionTile(
                  initiallyExpanded: true,
                  title: Text('Pickup'),
                  childPadding: EdgeInsets.symmetric(vertical: 4),
                  child: state.maybeWhen(
                    loading: () => Skeletonizer(
                      child: Container(
                        width: double.infinity,
                        height: 16.0,
                        color: Colors.grey[300],
                      ),
                    ),
                    error: (error) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(error.toSnackBarString()),
                    ),
                    stockLocation: (stockLocation) {
                      final pickupSet = getPickupFulfillmentSet(stockLocation.fulfillmentSets);

                      if (pickupSet == null) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('Pickup is disabled'),
                        );
                      }
                      return _buildShippingSetSection(pickupSet, 'Pickup');
                    },
                    orElse: () => SizedBox.shrink(),
                  ),
                ),
                const Gap(16),
                FlexExpansionTile(
                  initiallyExpanded: true,
                  title: Text('Shipping'),
                  childPadding: EdgeInsets.symmetric(vertical: 4),
                  child: state.maybeWhen(
                    loading: () => Skeletonizer(
                      child: Container(
                        width: double.infinity,
                        height: 16.0,
                        color: Colors.grey[300],
                      ),
                    ),
                    error: (error) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(error.toSnackBarString()),
                    ),
                    stockLocation: (stockLocation) {
                      final shippingSet = getShippingFulfillmentSet(stockLocation.fulfillmentSets);

                      if (shippingSet == null) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text('Shipping is disabled'),
                        );
                      }

                      return _buildShippingSetSection(shippingSet, 'Shipping');
                    },
                    orElse: () => SizedBox.shrink(),
                  ),
                ),
                const Gap(16),
                FlexExpansionTile(
                  initiallyExpanded: true,
                  title: Text('Sales Channels'),
                  child: state.maybeWhen(
                    loading: () => Skeletonizer(
                      child: Column(
                        children: List.generate(
                          3,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ListTile(
                              leading: Icon(LucideIcons.store),
                              title: Text('Loading...'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    error: (error) => Center(child: Text(error.toSnackBarString())),
                    stockLocation: (stockLocation) => Column(
                      children: stockLocation.salesChannels?.map((e) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: ListTile(
                                leading: Icon(LucideIcons.store),
                                title: Text(e.name),
                              ),
                            );
                          }).toList() ??
                          [
                            ListTile(title: Text('No Sales Channels')),
                          ],
                    ),
                    orElse: () => SizedBox.shrink(),
                  ),
                ),
                const Gap(16),
                FlexExpansionTile(
                    maintainState: true,
                    initiallyExpanded: true,
                    title: Text('Fulfillment Providers'),
                    child: BlocBuilder<FulfillmentProvidersBloc, FulfillmentProvidersState>(
                      bloc: _fulfillmentProvidersBloc,
                      builder: (context, state) {
                        return state.maybeWhen(
                            loading: () => Skeletonizer(
                                  child: Column(
                                    children: List.generate(
                                      3,
                                      (index) => Padding(
                                        padding: const EdgeInsets.only(bottom: 8.0),
                                        child: ListTile(
                                          leading: Icon(LucideIcons.box),
                                          title: Text('Loading...'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            error: (error) => Center(child: Text(error.toSnackBarString())),
                            fulfillmentProviders: (result) {
                              if (result.fulfillmentProviders.isEmpty) {
                                return ListTile(title: Text('No Fulfillment Providers'));
                              }
                              return Column(
                                  children: result.fulfillmentProviders.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: ListTile(
                                    leading: Icon(LucideIcons.box),
                                    title: Text(e.id ?? ''),
                                  ),
                                );
                              }).toList());
                            },
                            orElse: () => SizedBox.shrink());
                      },
                    )),
              ],
            );
          },
        ),
      ),
    );
  }

  Column _buildShippingSetSection(FulfillmentSet shippingSet, String s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (shippingSet.serviceZones != null && shippingSet.serviceZones!.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final zone = shippingSet.serviceZones![index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: StockLocationShippingTile(zone),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: shippingSet.serviceZones!.length,
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text('No service zones available'),
          ),
      ],
    );
  }
}
