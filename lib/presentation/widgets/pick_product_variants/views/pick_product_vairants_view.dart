import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:medusa_admin/presentation/widgets/pagination_error_page.dart';
import 'package:medusa_admin/domain/use_case/product/product_variants_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import '../components/product_variant_list_tile.dart';
import '../controllers/pick_product_variants_controller.dart';

@RoutePage()
class PickProductVariantsView extends StatelessWidget {
  const PickProductVariantsView({super.key, this.selectProductsReq});
  final SelectProductsReq? selectProductsReq;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PickProductVariantsController>(
      init: PickProductVariantsController(productVariantsUseCase: ProductVariantsUseCase.instance, selectProductsReq: selectProductsReq ?? SelectProductsReq()),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: const CloseButton(),
            title: const Text('Add Products'),
            actions: [
              TextButton(
                  onPressed: controller.isEqual
                      ? null
                      : () => context.popRoute(
                           SelectProductsRes(selectedProductVariants: controller.newlySelectedProducts)),
                  child: const Text('Add'))
            ],
          ),
          body: SafeArea(
              child: PagedListView.separated(
            pagingController: controller.pagingController,
            separatorBuilder: (_, __) => const Divider(height: 0, indent: 16.0),
            builderDelegate: PagedChildBuilderDelegate<ProductVariant>(
                itemBuilder: (context, productVariant, index) => ProductVariantListTile(
                      productVariant: productVariant,
                      value: controller.newlySelectedProducts.map((e) => e.id).toList().contains(productVariant.id),
                      onChanged: (value) {
                        if (value != null && value) {
                          controller.newlySelectedProducts.add(productVariant);
                        } else if (value != null && !value) {
                          controller.newlySelectedProducts.removeWhere((element) => element.id == productVariant.id);
                        }
                        controller.update();
                      },
                      index: index,
                    ),
                firstPageProgressIndicatorBuilder: (context) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
              firstPageErrorIndicatorBuilder: (_) => PaginationErrorPage(
                  pagingController: controller.pagingController),
            ),
          )),
        );
      },
    );
  }
}
