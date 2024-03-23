import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';

import 'components/index.dart';

@RoutePage()
class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView(this.productId, {super.key});
  final String productId;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late final ProductCrudBloc productCrudBloc;
  @override
  void initState() {
    productCrudBloc = ProductCrudBloc.instance;
    productCrudBloc.add(ProductCrudEvent.loadWithVariants(widget.productId));
    super.initState();
  }

  @override
  void dispose() {
    productCrudBloc.close();
    super.dispose();
  }

  final GlobalKey variantsKey = GlobalKey();
  final GlobalKey attributesKey = GlobalKey();
  final GlobalKey thumbnailKey = GlobalKey();
  final GlobalKey imagesKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    const space = Gap(12);
    return BlocProvider(
      create: (context) => productCrudBloc,
      child: BlocBuilder<ProductCrudBloc, ProductCrudState>(
        bloc: productCrudBloc,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              systemOverlayStyle: context.defaultSystemUiOverlayStyle,
              title: const Text('Product Details'),
              actions: [
                BlocBuilder<ProductCrudBloc, ProductCrudState>(
                  bloc: productCrudBloc,
                  builder: (context, state) {
                    return state.maybeMap(
                      product: (state) {
                        final isPublished =
                            state.product.status == ProductStatus.published;
                        return TextButton(
                          onPressed: () async {
                            await showOkCancelAlertDialog(
                              context: context,
                              title: isPublished
                                  ? 'Unpublish product?'
                                  : 'Publish product?',
                              message:
                                  'Are you sure you want to ${isPublished ? 'unpublish' : 'publish'} this product?',
                              isDestructiveAction: true,
                            ).then((result) async {
                              if (result == OkCancelResult.ok) {
                                productCrudBloc.add(ProductCrudEvent.update(
                                    widget.productId,
                                    UserPostUpdateProductReq(
                                        status: isPublished
                                            ? ProductStatus.draft
                                            : ProductStatus.published)));
                              }
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _getStatusIcon(state.product.status),
                              const SizedBox(width: 4.0),
                              Text(
                                state.product.status.name.capitalize,
                                style: context.bodySmall,
                              ),
                            ],
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ),
            body: SafeArea(
              child: BlocConsumer<ProductCrudBloc, ProductCrudState>(
                bloc: productCrudBloc,
                listener: (context, state) {
                  state.maybeWhen(
                    deleted: () {
                      context.popRoute();
                    },
                    updated: (product) {
                      productCrudBloc
                          .add(ProductCrudEvent.loadWithVariants(product.id!));
                    },
                    orElse: () {},
                  );
                },
                builder: (context, state) {
                  return state.maybeMap(
                      product: (_) => SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10.0),
                            child: Column(
                              children: [
                                ProductDetailsOverview(product: _.product),
                                space,
                                ProductDetailsVariants(
                                    product: _.product, key: variantsKey),
                                space,
                                ProductDetailsAttributes(
                                    product: _.product, key: attributesKey),
                                space,
                                ProductDetailsThumbnail(
                                    product: _.product, key: thumbnailKey),
                                space,
                                ProductDetailsImages(
                                    product: _.product, key: imagesKey),
                              ],
                            ),
                          ),
                      loading: (_) => const ProductDetailsLoadingPage(),
                      error: (e) => Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Error loading product'),
                                FilledButton(
                                    child: const Text('Retry'),
                                    onPressed: () {
                                      productCrudBloc.add(
                                          ProductCrudEvent.loadWithVariants(
                                              widget.productId));
                                    }),
                              ],
                            ),
                          ),
                      orElse: () {
                        return const SizedBox.shrink();
                      });
                },
              ),
            ),
          );
        },
      ),
    );
  }

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
