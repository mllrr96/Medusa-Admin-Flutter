import 'dart:io';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/presentation/blocs/collection_crud/collection_crud_bloc.dart';
import 'package:medusa_admin/presentation/blocs/sales_channel_crud/sales_channel_crud_bloc.dart';
import 'package:medusa_admin/presentation/cubits/product_types/product_types_cubit.dart';
import 'package:medusa_admin/presentation/widgets/labeled_chip_input_text_field.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:flex_expansion_tile/flex_expansion_tile.dart';

class ProductOrganize extends StatefulWidget {
  const ProductOrganize({
    super.key,
    required this.updateMode,
    this.controller,
    this.product,
    this.onSaved,
  });

  final bool updateMode;
  final FlexExpansionTileController? controller;
  final Product? product;
  final void Function(Product product)? onSaved;

  @override
  State<ProductOrganize> createState() => _ProductOrganizeState();
}

class _ProductOrganizeState extends State<ProductOrganize> {
  bool get updateMode => widget.updateMode;
  bool enableSalesChannels = false;
  late ProductTypesCubit productTypesCubit;
  late CollectionCrudBloc collectionCrudBloc;
  late SalesChannelCrudBloc salesChannelCrudBloc;
  ProductType? selectedType;
  ProductCollection? selectedCollection;
  List<ProductTag> tags = [];
  Product? get product => widget.product;
  List<String> selectedSalesChannels = [];
  final key = GlobalKey();

  @override
  void initState() {
    productTypesCubit = ProductTypesCubit.instance;
    collectionCrudBloc = CollectionCrudBloc.instance;
    salesChannelCrudBloc = SalesChannelCrudBloc.instance;
    productTypesCubit.load();
    collectionCrudBloc.add(const CollectionCrudEvent.loadAll());
    super.initState();
  }

  @override
  void dispose() {
    productTypesCubit.close();
    collectionCrudBloc.close();
    salesChannelCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final mediumTextStyle = context.bodyMedium;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    return FlexExpansionTile(
      key : key,
      controller: widget.controller,
      onExpansionChanged: (expanded) async {
        if (expanded) {
          await key.currentContext.ensureVisibility();
        }
      },
      title: const Text('Organize'),
      child: Column(
        children: [
          Row(
            children: [
              Text('Organize Product', style: largeTextStyle),
            ],
          ),
          space,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Type', style: mediumTextStyle),
                ],
              ),
              const SizedBox(height: 6.0),
              BlocBuilder<ProductTypesCubit, ProductTypesState>(
                bloc: productTypesCubit,
                builder: (context, state) {
                  return state.maybeMap(
                      loading: (_) => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                      types: (state) {
                        selectedType = state.types.where(
                            (element) => element.id == product?.type?.id).firstOrNull;
                        return DropdownButtonFormField<ProductType>(
                          style: context.bodyMedium,
                          value: selectedType,
                          disabledHint: const Text('No options'),
                          onChanged: (type) {
                            if (type != null) {
                              setState(() => selectedType = type);
                            }
                          },
                          items: state.types
                              .map((e) => DropdownMenuItem<ProductType>(
                                  value: e,
                                  child: Text(e.value?.capitalize ?? e.value!)))
                              .toList(),
                          decoration:
                              const InputDecoration(hintText: 'Choose a type'),
                        );
                      },
                      error: (state) => Column(
                            children: [
                              const Center(
                                child: Text('Error loading types'),
                              ),
                              TextButton(
                                  onPressed: () async =>
                                      await productTypesCubit.load(),
                                  child: const Text('Retry'))
                            ],
                          ),
                      orElse: () => const SizedBox.shrink());
                },
              )
            ],
          ),
          space,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Collection', style: mediumTextStyle),
                ],
              ),
              const SizedBox(height: 6.0),
              BlocBuilder<CollectionCrudBloc, CollectionCrudState>(
                bloc: collectionCrudBloc,
                builder: (context, state) {
                  return state.maybeMap(
                      loading: (_) => const Center(
                            child: CircularProgressIndicator.adaptive(),
                          ),
                      collections: (state) {
                        return DropdownButtonFormField<ProductCollection>(
                          style: context.bodyMedium,
                          onSaved: (_) {
                            widget.onSaved?.call(Product(
                              type: selectedType,
                              collection: selectedCollection,
                              tags: tags,
                              salesChannels: selectedSalesChannels.isNotEmpty
                                  ? selectedSalesChannels
                                      .map((e) => SalesChannel(name: '', id: e))
                                      .toList()
                                  : null,
                            ));
                          },
                          value: selectedCollection,
                          disabledHint: const Text('No options'),
                          onChanged: (collection) {
                            if (collection != null) {
                              setState(() => selectedCollection = collection);
                            }
                          },
                          items: state.collections
                              .map((e) => DropdownMenuItem<ProductCollection>(
                                  value: e,
                                  child: Text(e.title!.capitalize)))
                              .toList(),
                          decoration: InputDecoration(
                            hintText: 'Choose a collection',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                        );
                      },
                      error: (state) => Column(
                            children: [
                              const Center(
                                child: Text('Error loading collections'),
                              ),
                              TextButton(
                                  onPressed: () async =>
                                  collectionCrudBloc.add(const CollectionCrudEvent.loadAll()),
                                  child: const Text('Retry'))
                            ],
                          ),
                      orElse: () => const SizedBox.shrink());
                },
              )
            ],
          ),
          space,
          LabeledChipTextField(
            label: 'Tags',
            initialValue:
                product?.tags?.map((e) => e.value ?? '').toList() ?? [],
            onChanged: (List<String> value) {
              final tags = value.map((e) => ProductTag(value: e)).toList();
              setState(() => this.tags = tags);
            },
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            inputDecoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              hintText: 'Tags (comma separated)',
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
            ),
          ),
          space,
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: Text('Sales channels', style: largeTextStyle),
            subtitle: const Text(
              'This product will only be available in the default sales channel if left untouched.',
              style: TextStyle(color: manatee),
            ),
            value: enableSalesChannels,
            onChanged: updateMode
                ? null
                : (val) async => setState(() => enableSalesChannels = val),
            activeColor: Platform.isIOS ? ColorManager.primary : null,
          ),
          BlocBuilder<SalesChannelCrudBloc, SalesChannelCrudState>(
            bloc: salesChannelCrudBloc,
            builder: (context, state) {
              return state.maybeMap(
                  loading: (_) => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                  salesChannels: (state) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: enableSalesChannels
                          ? Column(
                              children: [
                                ...state.salesChannels
                                    .map((channel) => CheckboxListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Text(channel.name ?? ''),
                                          value: selectedSalesChannels
                                              .contains(channel.id),
                                          onChanged: (val) {
                                            if (val != null) {
                                              if (val) {
                                                selectedSalesChannels
                                                    .add(channel.id!);
                                              } else {
                                                selectedSalesChannels
                                                    .remove(channel.id);
                                              }
                                              setState(() {});
                                            }
                                          },
                                        ))
                              ],
                            )
                          : const SizedBox.shrink(),
                    );
                  },
                  orElse: () => const SizedBox.shrink());
            },
          )
        ],
      ),
    );
  }
}
