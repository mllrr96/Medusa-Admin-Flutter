import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:medusa_admin/src/core/constants/colors.dart';
import 'package:medusa_admin/src/core/extensions/context_extension.dart';
import 'package:medusa_admin/src/core/extensions/snack_bar_extension.dart';
import 'package:medusa_admin/src/core/routing/app_router.dart';
import 'package:medusa_admin/src/features/collections/presentation/bloc/collection_crud/collection_crud_bloc.dart';
import 'package:medusa_admin/src/features/products/data/models/pick_products_req.dart';
import 'package:medusa_admin/src/features/products/data/models/pick_products_res.dart';
import 'package:medusa_admin/src/features/products/presentation/bloc/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin/src/features/products/presentation/widgets/pick_products_view.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:medusa_admin/src/core/extensions/text_style_extension.dart';

@RoutePage()
class CollectionDetailsView extends StatefulWidget {
  const CollectionDetailsView(this.collectionId, {super.key});

  final String collectionId;

  @override
  State<CollectionDetailsView> createState() => _CollectionDetailsViewState();
}

class _CollectionDetailsViewState extends State<CollectionDetailsView> {
  late final CollectionCrudBloc collectionCrudBloc;
  late final ProductCrudBloc productsBloc;

  @override
  void initState() {
    collectionCrudBloc = CollectionCrudBloc.instance;
    productsBloc = ProductCrudBloc.instance;
    _loadProducts();
    context.read<CollectionCrudBloc>().add(CollectionCrudEvent.load(widget.collectionId));
    super.initState();
  }
  @override
  void dispose() {
    collectionCrudBloc.close();
    super.dispose();
  }

  void _loadProducts(){
    productsBloc.add(
      ProductCrudEvent.loadAll(
        queryParameters: {
          'collection_id': widget.collectionId,
          'fields': 'id,title,handle,status,sales_channels,variants',
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    final tr = context.tr;

    return BlocListener<CollectionCrudBloc, CollectionCrudState>(
      bloc: collectionCrudBloc,
      listener: (context, state) {
        state.whenOrNull(
          deleted: () {
            context.showSnackBar('Collection deleted');
            context.maybePop(true);
          },
          collection: (_) {
            context.showSnackBar('Products updated');
            // context.read<CollectionCrudBloc>().add(CollectionCrudEvent.load(widget.collectionId));
            _loadProducts();
          },
        );
      },
      child: BlocBuilder<CollectionCrudBloc, CollectionCrudState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(tr.productTableCollection),
              actions: [
                state.maybeWhen(
                    collection: (collection) => IconButton(
                        padding: const EdgeInsets.all(16),
                        onPressed: () async {
                          await showModalActionSheet(context: context, actions: <SheetAction>[
                            SheetAction(label: tr.collectionModalEditCollection, key: 0),
                            SheetAction(
                                label: tr.collectionsTableDelete,
                                isDestructiveAction: true,
                                key: 1),
                          ]).then((result) async {
                            if (result == 0) {
                              if (!context.mounted) return;
                              await context
                                  .pushRoute(CreateCollectionRoute(collection: collection))
                                  .then((result) async {
                                if (result != null) {
                                  if (!context.mounted) return;
                                  context
                                      .read<CollectionCrudBloc>()
                                      .add(CollectionCrudEvent.load(widget.collectionId));
                                }
                              });
                            } else if (result == 1) {
                              if (!context.mounted) return;
                              await showOkCancelAlertDialog(
                                      context: context,
                                      title: tr.collectionsTableDeleteCollection,
                                      message: tr.collectionsTableConfirmDelete,
                                      okLabel: tr.detailsYesDelete,
                                      cancelLabel: tr.organismsNoCancel,
                                      isDestructiveAction: true)
                                  .then((result) async {
                                if (result == OkCancelResult.ok) {
                                  collectionCrudBloc
                                      .add(CollectionCrudEvent.delete(widget.collectionId));
                                }
                              });
                            }
                          });
                        },
                        icon: const Icon(Icons.more_horiz)),
                    orElse: () => const SizedBox.shrink()),
              ],
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: state.whenOrNull(
                        collection: (collection) => Container(
                          height: kToolbarHeight,
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          // color: Theme.of(context).appBarTheme.backgroundColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(collection.title, style: largeTextStyle),
                                  // const SizedBox(height: 6.0),
                                  Text('/${collection.handle ?? ''}',
                                      style: smallTextStyle!.copyWith(color: manatee)),
                                ],
                              ),
                              if (productsBloc.state is ProductCrudProducts &&
                                  (productsBloc.state as ProductCrudProducts).products.isNotEmpty)
                                TextButton(
                                    onPressed: () async {
                                      final products =
                                          (productsBloc.state as ProductCrudProducts).products;
                                      final result = await showBarModalBottomSheet(
                                          context: context,
                                          overlayStyle:
                                              context.theme.appBarTheme.systemOverlayStyle,
                                          backgroundColor: context.theme.scaffoldBackgroundColor,
                                          builder: (context) => PickProductsView(
                                                  pickProductsReq: PickProductsReq(
                                                selectedProducts: products,
                                              )));
                                      if (result is PickProductsRes) {
                                        final originalProducts = products.map((e) => e.id).toList();
                                        final selectedProducts =
                                            result.selectedProducts.map((e) => e.id).toList();
                                        final removedProducts = originalProducts
                                                .toSet()
                                                .difference(selectedProducts.toSet())
                                                .toList() ??
                                            [];
                                        if (selectedProducts.isNotEmpty && context.mounted) {
                                          collectionCrudBloc.add(CollectionCrudEvent.addProducts(
                                              widget.collectionId, selectedProducts));
                                        }
                                        if (removedProducts.isNotEmpty && context.mounted) {
                                          collectionCrudBloc.add(CollectionCrudEvent.removeProducts(
                                              widget.collectionId, removedProducts));
                                        }
                                      }
                                    },
                                    child: Text(tr.detailsEditProducts))
                            ],
                          ),
                        ),
                      ) ??
                      const SizedBox.shrink()),
            ),
            body: SafeArea(
                child: BlocBuilder<ProductCrudBloc, ProductCrudState>(
                    bloc: productsBloc,
                    builder: (context, state) {
                      return state.maybeWhen(
                        products: (products, count) {
                          if (products.isEmpty) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('No products in this collection'),
                                  TextButton(
                                      onPressed: () async {
                                        final result = await showBarModalBottomSheet(
                                            context: context,
                                            overlayStyle:
                                                context.theme.appBarTheme.systemOverlayStyle,
                                            backgroundColor: context.theme.scaffoldBackgroundColor,
                                            builder: (context) => PickProductsView(
                                                    pickProductsReq: PickProductsReq(
                                                  selectedProducts: products,
                                                )));
                                        if (result is PickProductsRes && context.mounted) {
                                          final selectedProducts =
                                              result.selectedProducts.map((e) => e.id).toList();
                                          collectionCrudBloc.add(
                                            CollectionCrudEvent.addProducts(
                                                widget.collectionId, selectedProducts),
                                          );
                                        }
                                      },
                                      child: Text(tr.collectionProductTableAddProducts))
                                ],
                              ),
                            );
                          }
                          return ListView.separated(
                              separatorBuilder: (_, __) => const Divider(height: 0),
                              itemCount: products.length,
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return ListTile(
                                  onTap: () async {
                                    await context
                                        .pushRoute(ProductDetailsRoute(productId: product.id));
                                  },
                                  title: Text(product.title),
                                  subtitle: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _getStatusIcon(product.status),
                                      const Gap(4),
                                      Text(product.status.name.capitalize,
                                          style: context.bodySmall),
                                    ],
                                  ),
                                  leading: product.thumbnail != null
                                      ? SizedBox(
                                          width: 45,
                                          child: CachedNetworkImage(
                                            key: ValueKey(product.thumbnail),
                                            imageUrl: product.thumbnail!,
                                            placeholder: (context, text) => const Center(
                                                child: CircularProgressIndicator.adaptive()),
                                            errorWidget: (context, string, error) => const Icon(
                                                Icons.warning_rounded,
                                                color: Colors.redAccent),
                                          ))
                                      : null,
                                  trailing: IconButton(
                                      padding: const EdgeInsets.all(16.0),
                                      onPressed: () async {
                                        if (await _showDeleteCollectionDialog && context.mounted) {
                                          collectionCrudBloc.add(
                                              CollectionCrudEvent.removeProducts(
                                                  widget.collectionId, [product.id]));
                                        }
                                      },
                                      icon: const Icon(Icons.delete_forever,
                                          color: Colors.redAccent)),
                                );
                              });
                        },
                        error: (error) => Center(
                          child: Text('Error loading products, ${error.toString()}'),
                        ),
                        orElse: () => const Center(child: CircularProgressIndicator.adaptive()),
                      );
                    })),
          );
        },
      ),
    );
  }

  Future<bool> get _showDeleteCollectionDialog async => await showOkCancelAlertDialog(
          context: context,
          title: context.tr.collectionProductTableRemoveProductFromCollection,
          message: 'Are you sure you want to remove products from this collection ?',
          okLabel: context.tr.organismsYesRemove,
          cancelLabel: context.tr.organismsNoCancel,
          isDestructiveAction: true)
      .then((result) => result == OkCancelResult.ok);

  Widget _getStatusIcon(ProductStatus status) {
    switch (status) {
      case ProductStatus.draft:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);
      case ProductStatus.proposed:
        return const Icon(Icons.circle, color: Colors.grey, size: 12);

      case ProductStatus.published:
        return const Icon(Icons.circle, color: Colors.green, size: 12);

      case ProductStatus.rejected:
        return const Icon(Icons.circle, color: Colors.red, size: 12);
    }
  }
}
