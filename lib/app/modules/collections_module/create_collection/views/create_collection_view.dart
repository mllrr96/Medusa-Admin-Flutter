import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/core/utils/colors.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import '../../../components/adaptive_close_button.dart';
import '../../../components/custom_text_field.dart';
import '../controllers/create_collection_controller.dart';
@RoutePage()
class CreateCollectionView extends GetView<CreateCollectionController> {
  const CreateCollectionView({super.key});
  @override
  Widget build(BuildContext context) {
    final lightWhite = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    final tr = context.tr;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: controller.updateCollection ?  Text(tr.collectionModalEditCollection) : Text(tr.collectionModalAddCollection),
          centerTitle: true,
          actions: [
            AdaptiveButton(
                onPressed: controller.updateCollection
                    ? () async => await controller.edit()
                    : () async => await controller.publish(),
                child: controller.updateCollection ?  Text(tr.collectionModalSaveCollection) : Text(tr.collectionModalPublishCollection))
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
                        Text(tr.collectionModalDetails, style: largeTextStyle),
                      ],
                    ),
                    // Text('Add Collection', style: Theme.of(context).textTheme.bodyLarge),
                    if (!controller.updateCollection)
                      Text(tr.collectionModalDescription,
                          style: smallTextStyle!.copyWith(color: lightWhite)),
                    space,
                    LabeledTextField(
                      label: tr.collectionModalTitleLabel,
                      controller: controller.titleCtrl,
                      required: true,
                      hintText: 'Sunglasses',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return tr.addressFormThisFieldIsRequired;
                        }
                        return null;
                      },
                    ),
                    LabeledTextField(label: tr.collectionModalHandleLabel, controller: controller.handleCtrl, hintText: tr.collectionModalHandlePlaceholder),
                    Row(
                      children: [
                        Text(tr.collectionModalMetadata, style: largeTextStyle),
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
                          LabeledTextField(label: 'Key', controller: TextEditingController(), hintText: 'Key'),
                          LabeledTextField(label: 'Value', controller: TextEditingController(), hintText: 'Value'),
                        ],
                      ),
                    ),
                    AdaptiveButton(
                        child:  const Row(mainAxisSize: MainAxisSize.min, children: [
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
