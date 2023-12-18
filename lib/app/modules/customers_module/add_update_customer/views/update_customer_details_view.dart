import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';

import '../controllers/update_customer_details_controller.dart';
@RoutePage()
class AddUpdateCustomerView extends GetView<AddUpdateCustomerController> {
  const AddUpdateCustomerView({super.key});
  @override
  Widget build(BuildContext context) {
    const halfSpace = SizedBox(height: 6.0);
    final updateMode = controller.updateMode;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AdaptiveCloseButton(),
          title: controller.updateMode ? const Text('Customer Details') : const Text('Create New Customer'),
          actions: [
            AdaptiveButton(
                onPressed: () async =>
                    updateMode ? await controller.updateCustomer() : await controller.createCustomer(),
                child: controller.updateMode ? const Text('Update') : const Text('Create'))
          ],
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            children: [
              Form(
                key: controller.keyForm,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    color: Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('General'),
                      halfSpace,
                      LabeledTextField(
                        label: 'First Name',
                        required: !updateMode,
                        textCapitalization: TextCapitalization.words,
                        controller: controller.firstNameCtrl,
                        hintText: 'Lebron',
                        validator: updateMode
                            ? null
                            : (val) {
                                if (val != null && val.isEmpty) {
                                  return 'First name is required';
                                }
                                return null;
                              },
                      ),
                      LabeledTextField(
                        label: 'Last Name',
                        required: !updateMode,
                        textCapitalization: TextCapitalization.words,
                        controller: controller.lastNameCtrl,
                        hintText: 'James',
                        validator: updateMode
                            ? null
                            : (val) {
                                if (val != null && val.isEmpty) {
                                  return 'Last name is required';
                                }
                                return null;
                              },
                      ),
                      if (!updateMode)
                        LabeledTextField(
                          label: 'Password',
                          required: !updateMode,
                          controller: controller.passwordCtrl,
                          obscureText: true,
                          hintText: 'Enter strong password',
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) {
                            if (val != null && val.length < 8) {
                              return 'Password should be at least 8 characters long';
                            }
                            return null;
                          },
                        ),
                      const Divider(),
                      const Text('Contact'),
                      halfSpace,
                      LabeledTextField(
                        label: 'Email',
                        required: true,
                        controller: controller.emailNameCtrl,
                        hintText: 'Email...',
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Email is required';
                          }
                          if (!val.isEmail) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                      ),
                      LabeledTextField(
                        label: 'Phone Number',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        controller: controller.phoneNameCtrl,
                        hintText: '+45 42 42 42 42',
                        validator: (val) {
                          if (val != null && val.isNotEmpty && !val.isPhoneNumber) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
