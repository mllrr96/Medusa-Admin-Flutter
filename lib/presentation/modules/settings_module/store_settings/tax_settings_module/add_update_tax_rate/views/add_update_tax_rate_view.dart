import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/domain/use_case/update_tax_rate_use_case.dart';
import 'package:medusa_admin/presentation/widgets/custom_text_field.dart';
import 'package:medusa_admin/presentation/widgets/labeled_numeric_text_field.dart';
import '../controllers/add_update_tax_rate_controller.dart';
import 'package:medusa_admin/core/extension/extension.dart';

@RoutePage()
class AddUpdateTaxRateView extends StatelessWidget {
  const AddUpdateTaxRateView(this.addUpdateTaxRateReq, {super.key});
  final AddUpdateTaxRateReq addUpdateTaxRateReq;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddUpdateTaxRateController>(
        init: AddUpdateTaxRateController(
            updateTaxRateUseCase: UpdateTaxRateUseCase.instance,
            addUpdateTaxRateReq: addUpdateTaxRateReq),
        builder: (controller) {
          return GestureDetector(
            onTap: () => context.unfocus(),
            child: Scaffold(
              appBar: AppBar(
                leading: const CloseButton(),
                title: controller.updateMode
                    ? const Text('Update Tax Rate')
                    : const Text('Add Tax Rate'),
                actions: [
                  TextButton(
                    onPressed: () async => controller.updateMode
                        ? await controller.updateTaxRate(context)
                        : await controller.create(context),
                    child: controller.updateMode
                        ? const Text('Update')
                        : const Text('Create'),
                  ),
                ],
              ),
              body: SafeArea(
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('Details'),
                            ),
                            LabeledTextField(
                              label: 'Name',
                              controller: controller.nameCtrl,
                              required: true,
                              hintText: 'Rate name',
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                            ),
                            LabeledNumericTextField(
                              label: 'Tax Rate',
                              controller: controller.taxRateCtrl,
                              prefixText: '  %  ',
                              required: true,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
                                }

                                if (double.tryParse(val) == null) {
                                  return 'Invalid tax rate';
                                }

                                if (double.parse(val).isGreaterThan(100)) {
                                  return 'Invalid tax rate';
                                }

                                return null;
                              },
                              onPlusPressed: () {
                                var val = double.tryParse(controller
                                    .taxRateCtrl.text.removeAllWhitespace);
                                if (val != null) {
                                  val = val + 0.01;
                                  controller.taxRateCtrl.text =
                                      val.toStringAsFixed(2);
                                } else {
                                  controller.taxRateCtrl.text = '0.01';
                                }
                              },
                              onMinusPressed: () {
                                var val = double.tryParse(controller
                                    .taxRateCtrl.text.removeAllWhitespace);
                                if (val != null && val.isGreaterThan(0.01)) {
                                  val = val - 0.01;
                                  controller.taxRateCtrl.text =
                                      val.toStringAsFixed(2);
                                }
                              },
                            ),
                            LabeledTextField(
                              label: 'Tax Code',
                              controller: controller.taxCodeCtrl,
                              keyboardType: TextInputType.number,
                              required: true,
                              hintText: '1000',
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('Override'),
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Platform.isIOS
                                          ? CupertinoIcons.add
                                          : Icons.add),
                                      const Text(' Add Overrides')
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
