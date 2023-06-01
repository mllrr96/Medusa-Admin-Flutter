import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final tr = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: controller.updateCollection ?  Text(tr.updateCollection) : Text(tr.newCollection),
          centerTitle: true,
          actions: [
            AdaptiveButton(
                onPressed: controller.updateCollection
                    ? () async => await controller.edit()
                    : () async => await controller.publish(),
                child: controller.updateCollection ?  Text(tr.update) : Text(tr.publish))
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
                        Text(tr.details, style: largeTextStyle),
                      ],
                    ),
                    // Text('Add Collection', style: Theme.of(context).textTheme.bodyLarge),
                    if (!controller.updateCollection)
                      Text(tr.createCollectionInstruction,
                          style: smallTextStyle!.copyWith(color: lightWhite)),
                    space,
                    LabeledTextField(
                      label: tr.title,
                      controller: controller.titleCtrl,
                      required: true,
                      hintText: 'Sunglasses',
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return tr.fieldRequired;
                        }
                        return null;
                      },
                    ),
                    LabeledTextField(label: tr.handle, controller: controller.handleCtrl, hintText: '/sunglasses'),
                    Row(
                      children: [
                        Text(tr.metadata, style: largeTextStyle),
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
                          LabeledTextField(label: tr.key, controller: TextEditingController(), hintText: tr.keyHint),
                          LabeledTextField(label: tr.value, controller: TextEditingController(), hintText: tr.valueHint),
                        ],
                      ),
                    ),
                    AdaptiveButton(
                        child:  Row(mainAxisSize: MainAxisSize.min, children: [
                          const Icon(Icons.add),
                          Text(tr.addMetadata),
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
