import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/enums.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_close_button.dart';
import '../components/product_components.dart';
import '../controllers/add_update_product_controller.dart';

class AddUpdateProductView extends StatelessWidget {
  const AddUpdateProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddUpdateProductController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const AdaptiveCloseButton(),
              title: controller.updateMode ? const Text('Update Product') : const Text('New Product'),
              centerTitle: true,
              actions: [
                  AdaptiveButton(
                      onPressed: () async => controller.updateMode
                          ? await controller.updateProduct(context)
                          : await controller.addProduct(),
                      child: controller.updateMode ? const Text('Save') : const Text('Publish')),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: buildComponents(controller),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // ignore: unused_element
  Future<void> _scrollToSelectedContent(
      {required GlobalKey expansionTileKey,
      required BuildContext context,
      required ScrollController scrollController}) async {
    await Future.delayed(const Duration(milliseconds: 240)).then((value) async {
      final box = expansionTileKey.currentContext?.findRenderObject() as RenderBox?;
      final yPosition = box?.localToGlobal(Offset.zero).dy ?? 0;
      final scrollPoint = scrollController.offset + yPosition - context.mediaQuery.padding.top - 56;
      if (scrollPoint <= scrollController.position.maxScrollExtent) {
        await scrollController.animateTo(scrollPoint,
            duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      } else {
        await scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
      }
    });
  }

  List<Widget> buildComponents(AddUpdateProductController controller) {
    const space = SizedBox(height: 12.0);
    if (!controller.updateMode) {
      return [const ProductGeneralInformation(), space, const ProductOrganize(), space, const ProductVariants()];
    }

    switch (controller.productComponents) {
      case ProductComponents.generalInfo:
        return [const ProductGeneralInformation(editMode: true)];
      case ProductComponents.salesChannel:
        return [const ProductGeneralInformation()];

      case ProductComponents.addVariant:
        return [const ProductGeneralInformation()];

      case ProductComponents.editVariants:
        return [const ProductGeneralInformation()];

      case ProductComponents.editOptions:
        return [const ProductGeneralInformation()];

      case ProductComponents.editAttributes:
        return [const ProductGeneralInformation()];

      case ProductComponents.editThumbnail:
        return [const ProductGeneralInformation()];

      case ProductComponents.editMedia:
        return [const ProductGeneralInformation()];
    }
  }
}
