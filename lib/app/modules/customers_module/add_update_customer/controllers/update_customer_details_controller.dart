import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/req/user_customer_req.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/data/repository/customer/customer_repo.dart';
import 'package:medusa_admin/app/modules/components/easy_loading.dart';

class AddUpdateCustomerController extends GetxController {
  AddUpdateCustomerController({required this.customerRepo, this.customer});
  final Customer? customer;
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final emailNameCtrl = TextEditingController();
  final phoneNameCtrl = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  final CustomerRepo customerRepo;
  bool get updateMode => customer != null;
  @override
  void onInit() {
    if (updateMode) {
      firstNameCtrl.text = customer!.firstName ?? '';
      lastNameCtrl.text = customer!.lastName ?? '';
      emailNameCtrl.text = customer!.email;
      phoneNameCtrl.text = customer!.phone ?? '';
    }
    super.onInit();
  }

  @override
  void onClose() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    emailNameCtrl.dispose();
    phoneNameCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }

  Future<void> updateCustomer(BuildContext context) async {
    if (emailNameCtrl.text == customer!.email &&
        firstNameCtrl.text == (customer!.firstName ?? '') &&
        lastNameCtrl.text == (customer!.lastName ?? '') &&
        phoneNameCtrl.text == (customer!.phone ?? '')) {
      context.popRoute();
      return;
    }
    if (!keyForm.currentState!.validate()) {
      return;
    }

    loading();
    final result = await customerRepo.update(
        id: customer!.id!,
        userUpdateCustomerReq: UserUpdateCustomerReq(
          email: emailNameCtrl.text == (customer!.email) ? null : emailNameCtrl.text,
          firstName: firstNameCtrl.text == (customer!.firstName ?? '') ? null : firstNameCtrl.text,
          lastName: lastNameCtrl.text == (customer!.lastName ?? '') ? null : lastNameCtrl.text,
          phone: phoneNameCtrl.text == (customer!.phone ?? '') ? null : phoneNameCtrl.text,
        ));

    result.when((success) {
      EasyLoading.showSuccess('Updated');
      context.popRoute(true);
    }, (error) {
      dismissLoading();
      Get.snackbar('Error updating customer details ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  Future<void> createCustomer(BuildContext context) async {
    if (!keyForm.currentState!.validate()) {
      return;
    }

    loading();
    final result = await customerRepo.create(
        userCreateCustomerReq: UserCreateCustomerReq(
      email: emailNameCtrl.text,
      firstName: firstNameCtrl.text,
      lastName: lastNameCtrl.text,
      password: passwordCtrl.text,
      phone: phoneNameCtrl.text,
    ));

    result.when((success) {
      EasyLoading.showSuccess('Customer created');
      context.popRoute(true);
    }, (error) {
      dismissLoading();
      Get.snackbar('Error creating customer details ${error.code ?? ''}', error.message,
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
