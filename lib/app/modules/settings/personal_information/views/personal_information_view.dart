import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/product_components.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../../data/models/store/user.dart';
import '../controllers/personal_information_controller.dart';

class PersonalInformationView extends GetView<PersonalInformationController> {
  const PersonalInformationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    Future<void> updatePersonalInformation(User user) async {
      controller.firstNameCtrl.text = user.firstName ?? '';
      controller.lastNameCtrl.text = user.lastName ?? '';
      widgetBuilder(context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 8.0,
              left: 12.0,
              right: 12.0,
              bottom: MediaQuery.of(context).viewInsets.bottom + MediaQuery.of(context).padding.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdaptiveButton(child: const Text('Cancel'), onPressed: () => Get.back()),
                  AdaptiveButton(
                      child: const Text('Add'),
                      onPressed: () async {
                        if (!controller.formKey.currentState!.validate()) {
                          return;
                        }
                        if (controller.firstNameCtrl.text == user.firstName &&
                            controller.lastNameCtrl.text == user.lastName) {
                          Get.back();
                        } else {
                          await controller.updateUser();
                          Get.back();
                        }
                      }),
                ],
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      ProductTextField(
                        label: 'First Name',
                        hintText: 'First Name ...',
                        controller: controller.firstNameCtrl,
                        autoFocus: true,
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                      ),
                      ProductTextField(
                        label: 'Last Name',
                        hintText: 'Last Name ...',
                        controller: controller.lastNameCtrl,
                        validator: (val) {
                          if (val != null && val.isEmpty) {
                            return 'Field is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ))
            ],
          ),
        );
      }

      if (GetPlatform.isIOS) {
        await showCupertinoModalBottomSheet(context: context, builder: widgetBuilder);
      } else {
        await showModalBottomSheet(context: context, builder: widgetBuilder, isScrollControlled: true);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
        centerTitle: true,
        actions: [
          controller.obx(
              (user) => AdaptiveButton(
                  onPressed: controller.state != null ? () async => await updatePersonalInformation(user!) : null,
                  child: const Text('Edit')),
              onLoading: const SizedBox.shrink(),
              onError: (_) => const SizedBox.shrink())
        ],
      ),
      body: SafeArea(
          child: controller.obx(
              (user) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: GestureDetector(
                      onTap: () async => await updatePersonalInformation(user),
                      child: EditCard(
                        editMode: true,
                        label: '',
                        children: [
                          Text('Manage your Medusa profile', style: smallTextStyle!.copyWith(color: lightWhite)),
                          const Divider(),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: Text(
                                    user!.firstName != null
                                        ? user.firstName![0].capitalize!
                                        : user.email![0].capitalize!,
                                    style: largeTextStyle),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (user.firstName != null && user.lastName != null)
                                      Text('${user.firstName!} ${user.lastName!}'),
                                    if (user.firstName != null && user.lastName != null) const SizedBox(height: 6.0),
                                    Text(user.email!),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              onError: (e) => Center(child: Text(e ?? 'Error loading user')),
              onLoading: const Center(child: CircularProgressIndicator.adaptive()))),
    );
  }
}
