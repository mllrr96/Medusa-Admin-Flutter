import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/constant/colors.dart';
import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/domain/use_case/collection_use_case.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import '../controllers/create_collection_controller.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

@RoutePage()
class CreateCollectionView extends StatelessWidget {
  const CreateCollectionView({super.key, this.updateCollectionReq});
  final UpdateCollectionReq? updateCollectionReq;
  @override
  Widget build(BuildContext context) {
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    final largeTextStyle = context.bodyLarge;
    const space = Gap(12);
    final tr = context.tr;
    return GetBuilder<CreateCollectionController>(
        init: CreateCollectionController(
            updateCollectionReq: updateCollectionReq,
            collectionUseCase: CollectionUseCase.instance),
        builder: (controller) {
          return GestureDetector(
            onTap: () => context.unfocus(),
            child: Scaffold(
              appBar: AppBar(
                leading: const CloseButton(),
                title: controller.updateCollection
                    ? Text(tr.collectionModalEditCollection)
                    : Text(tr.collectionModalAddCollection),
                actions: [
                  TextButton(
                      onPressed: controller.updateCollection
                          ? () async => await controller.edit(context)
                          : () async => await controller.publish(context),
                      child: controller.updateCollection
                          ? Text(tr.collectionModalSaveCollection)
                          : Text(tr.collectionModalPublishCollection))
                ],
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      color: context.theme.cardColor,
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(tr.collectionModalDetails,
                                  style: largeTextStyle),
                            ],
                          ),
                          // Text('Add Collection', style: Theme.of(context).textTheme.bodyLarge),
                          if (!controller.updateCollection)
                            Text(tr.collectionModalDescription,
                                style: smallTextStyle!
                                    .copyWith(color: manatee)),
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
                          LabeledTextField(
                              label: tr.collectionModalHandleLabel,
                              controller: controller.handleCtrl,
                              hintText: tr.collectionModalHandlePlaceholder),
                          Row(
                            children: [
                              Text(tr.collectionModalMetadata,
                                  style: largeTextStyle),
                            ],
                          ),
                          space,
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12.0)),
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.delete_forever,
                                        color: Colors.red)),
                                LabeledTextField(
                                    label: 'Key',
                                    controller: TextEditingController(),
                                    hintText: 'Key'),
                                LabeledTextField(
                                    label: 'Value',
                                    controller: TextEditingController(),
                                    hintText: 'Value'),
                              ],
                            ),
                          ),
                          TextButton(
                              child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
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
        });
  }
}
