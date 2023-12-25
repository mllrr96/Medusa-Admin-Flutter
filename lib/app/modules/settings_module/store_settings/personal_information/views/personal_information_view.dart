import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/settings_module/store_settings/personal_information/components/personal_info_tile.dart';
import 'package:medusa_admin/core/utils/medusa_icons_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../../data/models/store/user.dart';
import '../../../../../data/repository/auth/auth_repo.dart';
import '../../../../../data/repository/user/user_repo.dart';
import '../../../../components/adaptive_back_button.dart';
import '../../../../components/custom_text_field.dart';
import '../controllers/personal_information_controller.dart';

@RoutePage()
class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> updatePersonalInformation(
        User user, PersonalInformationController controller) async {
      controller.firstNameCtrl.text = user.firstName ?? '';
      controller.lastNameCtrl.text = user.lastName ?? '';
      widgetBuilder(context) {
        return Padding(
          padding: EdgeInsets.only(
              top: 8.0,
              left: 12.0,
              right: 12.0,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  MediaQuery.of(context).viewPadding.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdaptiveButton(
                      child: const Text('Cancel'),
                      onPressed: () => context.popRoute()),
                  AdaptiveButton(
                      child: const Text('Update'),
                      onPressed: () async {
                        if (!controller.formKey.currentState!.validate()) {
                          return;
                        }
                        if (controller.firstNameCtrl.text == user.firstName &&
                            controller.lastNameCtrl.text == user.lastName) {
                          context.popRoute();
                        } else {
                          context.unfocus();
                          await controller.updateUser();
                          context.popRoute();
                        }
                      }),
                ],
              ),
              Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      LabeledTextField(
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
                      LabeledTextField(
                        label: 'Last Name',
                        hintText: 'Last Name ...',
                        controller: controller.lastNameCtrl,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) async {
                          if (!controller.formKey.currentState!.validate()) {
                            return;
                          }
                          if (controller.firstNameCtrl.text == user.firstName &&
                              controller.lastNameCtrl.text == user.lastName) {
                            context.popRoute();
                          } else {
                            context.unfocus();
                            await controller.updateUser();
                            context.popRoute();
                          }
                        },
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
        await showCupertinoModalBottomSheet(
            context: context, builder: widgetBuilder);
      } else {
        await showModalBottomSheet(
            context: context, builder: widgetBuilder, isScrollControlled: true);
      }
    }

    return GetBuilder<PersonalInformationController>(
        init: PersonalInformationController(
            userRepo: UserRepo(), authRepo: AuthRepo()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: const AdaptiveBackButton(),
              title: const Text('Personal Information'),
            ),
            floatingActionButton: controller.obx(
                (user) => FloatingActionButton.extended(
                      onPressed: controller.state != null
                          ? () async =>
                              await updatePersonalInformation(user!, controller)
                          : null,
                      label: const Text('Edit'),
                      icon: const Icon(MedusaIcons.pencil_square_solid),
                    ),
                onLoading: const SizedBox.shrink(),
                onError: (_) => const SizedBox.shrink()),
            body: SafeArea(
                child: controller.obx(
              (user) => PersonalInfoTile(
                user,
                onTap: () async =>
                    await updatePersonalInformation(user!, controller),
              ),
              onError: (e) => Center(child: Text(e ?? 'Error loading user')),
              onLoading: Skeletonizer(
                  enabled: true,
                  child: PersonalInfoTile(User(
                      email: 'admin@medusa-test.com',
                      firstName: 'Medusa',
                      lastName: 'Js'))),
            )),
          );
        });
  }
}
