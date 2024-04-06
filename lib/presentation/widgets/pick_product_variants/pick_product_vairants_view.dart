import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/data/models/select_products_req.dart';
import 'package:medusa_admin/data/models/select_products_res.dart';
import 'package:medusa_admin/presentation/cubits/product_variants/product_variants_cubit.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'components/product_variant_list_tile.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

@RoutePage()
class PickProductVariantsView extends StatefulWidget {
  const PickProductVariantsView({super.key, this.selectProductsReq});
  final SelectProductsReq? selectProductsReq;

  @override
  State<PickProductVariantsView> createState() =>
      _PickProductVariantsViewState();
}

class _PickProductVariantsViewState extends State<PickProductVariantsView> {
  late ProductVariantsCubit productVariantsCubit;
  final PagingController<int, ProductVariant> pagingController =
      PagingController(firstPageKey: 0, invisibleItemsThreshold: 4);
  SelectProductsReq get selectProductsReq =>
      widget.selectProductsReq ?? SelectProductsReq();
  final List<ProductVariant> newlySelectedProducts = [];
  // final List<String> originalProductsIds = [];
  Function eq = const SetEquality().equals;
  bool get isEqual => eq(
      newlySelectedProducts.map((e) => e.id).toList().toSet(),
      selectProductsReq.selectedProducts?.map((e) => e.id).toList().toSet());

  void _loadPage(int pageKey) {
    productVariantsCubit.retrieveProductVariants(
      queryParameters: {
        'offset': pagingController.itemList?.length ?? 0,
      },
    );
  }

  @override
  void initState() {
    productVariantsCubit = ProductVariantsCubit.instance;
    pagingController.addPageRequestListener(_loadPage);
    if (selectProductsReq.selectedProducts?.isNotEmpty ?? false) {
      newlySelectedProducts.addAll(selectProductsReq.selectedProducts!);
    }
    super.initState();
  }

  @override
  void dispose() {
    productVariantsCubit.close();
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductVariantsCubit, ProductVariantsState>(
      bloc: productVariantsCubit,
      listener: (context, state) {
        state.maybeWhen(
          variants: (variants, _) {
            final isLastPage =
                variants.length < ProductVariantsCubit.pageSize;
            if (isLastPage) {
              pagingController.appendLastPage(variants);
            } else {
              final nextPageKey =
                  pagingController.nextPageKey ?? 0 + variants.length;
              pagingController.appendPage(variants, nextPageKey);
            }
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          title: const Text('Add Products'),
          actions: [
            TextButton(
                onPressed: isEqual
                    ? null
                    : () => context.maybePop(SelectProductsRes(
                    selectedProductVariants: newlySelectedProducts)),
                child: const Text('Add'))
          ],
        ),
        body: SafeArea(
            child: PagedListView.separated(
              pagingController: pagingController,
              separatorBuilder: (_, __) =>
              const Divider(height: 0, indent: 16.0),
              builderDelegate: PagedChildBuilderDelegate<ProductVariant>(
                animateTransitions: true,
                itemBuilder: (context, productVariant, index) =>
                    ProductVariantListTile(
                      productVariant: productVariant,
                      value: newlySelectedProducts
                          .map((e) => e.id)
                          .toList()
                          .contains(productVariant.id),
                      onChanged: (value) {
                        if (value != null && value) {
                          newlySelectedProducts.add(productVariant);
                        } else if (value != null && !value) {
                          newlySelectedProducts.removeWhere(
                                  (element) => element.id == productVariant.id);
                        }
                        setState(() {});
                      },
                      index: index,
                    ),
                firstPageProgressIndicatorBuilder: (context) =>
                const Center(child: CircularProgressIndicator.adaptive()),
                firstPageErrorIndicatorBuilder: (_) =>
                    PaginationErrorPage(pagingController: pagingController),
              ),
            )),
      ),
    );

  }
}
