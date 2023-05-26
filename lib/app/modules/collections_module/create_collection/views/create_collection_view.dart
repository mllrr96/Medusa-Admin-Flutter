import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import '../../../components/adaptive_close_button.dart';
import '../../../components/custom_text_field.dart';
import '../controllers/create_collection_controller.dart';

class CreateCollectionView extends GetView<CreateCollectionController> {
  const CreateCollectionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: controller.updateCollection ? const Text('Update Collection') : const Text('New Collection'),
          centerTitle: true,
          actions: [
            AdaptiveButton(
                onPressed: controller.updateCollection
                    ? () async => await controller.edit()
                    : () async => await controller.publish(),
                child: controller.updateCollection ? const Text('Update') : const Text('Publish'))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                color: Theme.of(context).expansionTileTheme.backgroundColor,
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text('Details', style: largeTextStyle),
                      ],
                    ),
                    // Text('Add Collection', style: Theme.of(context).textTheme.bodyLarge),
                    if (!controller.updateCollection)
                      Text('To create a collection, all you need is a title and a handle.',
                          style: smallTextStyle!.copyWith(color: lightWhite)),
                    space,
                    LabeledTextField(
                      label: 'Title',
                      controller: controller.titleCtrl,
                      required: true,
                      hintText: 'Sunglasses',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field required';
                        }
                        return null;
                      },
                    ),
                    LabeledTextField(label: 'Handle', controller: controller.handleCtrl, hintText: '/sunglasses'),
                    Row(
                      children: [
                        Text('Metadata', style: largeTextStyle),
                      ],
                    ),
                    space,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever, color: Colors.red)),
                          LabeledTextField(label: 'Key', controller: TextEditingController(), hintText: 'Some key'),
                          LabeledTextField(label: 'Value', controller: TextEditingController(), hintText: 'Some value'),
                        ],
                      ),
                    ),
                    AdaptiveButton(
                        child: const Row(mainAxisSize: MainAxisSize.min, children: [
                          Icon(Icons.add),
                          Text('Add Metadata'),
                        ]),
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
