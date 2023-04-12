import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/adaptive_button.dart';
import '../../../components/adaptive_close_button.dart';
import '../components/index.dart';
import '../controllers/add_update_product_controller.dart';

class AddUpdateProductView extends GetView<AddUpdateProductController> {
  const AddUpdateProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> scrollToSelectedContent({required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240)).then(
        (value) async {
          final yPosition =
              (globalKey.currentContext?.findRenderObject() as RenderBox?)?.localToGlobal(Offset.zero).dy ?? 0.0;
          var topPadding = context.mediaQueryPadding.top + kToolbarHeight;
          final scrollPoint = controller.scrollController.offset + yPosition - topPadding;
          if (scrollPoint <= controller.scrollController.position.maxScrollExtent) {
            await controller.scrollController
                .animateTo(scrollPoint - 10, duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
          } else {
            await controller.scrollController.animateTo(controller.scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300), curve: Curves.fastOutSlowIn);
          }
        },
      );
    }

    const space = SizedBox(height: 12.0);

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
                    onPressed: () async =>
                        controller.updateMode ? await controller.updateProduct(context) : await controller.addProduct(),
                    child: controller.updateMode ? const Text('Save') : const Text('Publish')),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: [
                      ProductGeneralInformation(
                        key: controller.generalKey,
                        onExpansionChanged: (expanded) async {
                          if (expanded) await scrollToSelectedContent(globalKey: controller.generalKey);
                        },
                      ),
                      space,
                      ProductOrganize(
                        key: controller.organizeKey,
                        onExpansionChanged: (expanded) async {
                          if (expanded) await scrollToSelectedContent(globalKey: controller.organizeKey);
                        },
                      ),
                      space,
                      ProductVariants(
                        key: controller.variantKey,
                        onExpansionChanged: (expanded) async {
                          if (expanded) await scrollToSelectedContent(globalKey: controller.variantKey);
                        },
                      ),
                      space,
                      ProductAttributes(
                        key: controller.attributesKey,
                        onExpansionChanged: (expanded) async {
                          if (expanded) await scrollToSelectedContent(globalKey: controller.attributesKey);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
