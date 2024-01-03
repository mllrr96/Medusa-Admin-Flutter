import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/medusa_stepper.dart';
import 'package:medusa_admin/core/utils/extension.dart';
import 'package:medusa_admin/domain/use_case/create_draft_use_case.dart';
import '../components/index.dart';
import '../controllers/create_draft_order_controller.dart';

@RoutePage()
class CreateDraftOrderView extends StatefulWidget {
  const CreateDraftOrderView({super.key});

  @override
  State<CreateDraftOrderView> createState() => _CreateDraftOrderViewState();
}

class _CreateDraftOrderViewState extends State<CreateDraftOrderView> {
  int currentStep = 0;
  Future<bool> willPop(CreateDraftOrderController controller) async {
    if (controller.tabController.index > 0) {
      controller.tabController.animateTo(controller.tabController.index - 1);
      return false;
    }
    if (controller.customLineItems.isNotEmpty ||
        controller.lineItems.isNotEmpty) {
      return await showOkCancelAlertDialog(
              context: context,
              title: 'Discard changes?',
              message: 'Are you sure you want to discard changes?',
              isDestructiveAction: true)
          .then((result) {
        switch (result) {
          case OkCancelResult.ok:
            Navigator.of(context).pop();
            return true;
          case OkCancelResult.cancel:
            return false;
        }
      });
    }
    return true;
  }

  Future<void> onCloseTap(CreateDraftOrderController controller) async {
    if (controller.customLineItems.isNotEmpty ||
        controller.lineItems.isNotEmpty) {
      await showOkCancelAlertDialog(
              context: context,
              title: 'Discard changes?',
              message: 'Are you sure you want to discard changes?',
              isDestructiveAction: true)
          .then((result) {
        switch (result) {
          case OkCancelResult.ok:
            context.popRoute();
          case OkCancelResult.cancel:
        }
      });
    } else {
      context.popRoute();
    }
  }

  goStep(int index) => setState(() => currentStep = index);

  MedusaStepState getStepState(int index) {
    if (currentStep == index) {
      return MedusaStepState.editing;
    }
    if (currentStep > index) {
      return MedusaStepState.complete;
    }
    return MedusaStepState.indexed;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateDraftOrderController>(
        init: CreateDraftOrderController(createDraftUseCase: CreateDraftUseCase.instance),
        builder: (controller) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: context.theme.appBarTheme.systemOverlayStyle!.copyWith(
              systemNavigationBarColor:
                  context.theme.appBarTheme.backgroundColor,
              statusBarColor: context.theme.appBarTheme.backgroundColor,
            ),
            child: GestureDetector(
              onTap: () => context.unfocus(),
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Create Draft Order'),
                ),
                body: SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: MedusaStepper(
                      stepContentPadding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      titlePadding: const EdgeInsets.symmetric(horizontal: 16),
                      currentStep: currentStep,
                      type: MedusaStepperType.horizontal,
                      controlsBuilder: (context, details) {
                        final currentStep = details.stepIndex;
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          color: context.theme.appBarTheme.backgroundColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextButton(
                                onPressed: currentStep == 0
                                    ? null
                                    : details.onStepCancel,
                                child: const Text('Back'),
                              ),
                              FilledButton(
                                onPressed: details.onStepContinue,
                                child: currentStep == 2
                                    ? const Text('  Create  ')
                                    : const Text('Continue'),
                              ),
                            ],
                          ),
                        );
                      },
                      onStepContinue: () {
                        if (currentStep == 0 &&
                            controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();
                          context.unfocus();
                          goStep(currentStep + 1);
                          return;
                        }

                        if (currentStep == 1 &&
                            controller.formKey2.currentState!.validate()) {
                          controller.formKey2.currentState!.save();
                          context.unfocus();
                          goStep(currentStep + 1);
                          return;
                        }
                        if (currentStep == 2) {
                          context.unfocus();
                          controller.createDraftOrder(context);
                          return;
                        }
                      },
                      onStepCancel: () {
                        if (currentStep > 0) {
                          goStep(currentStep - 1);
                        }
                      },
                      steps: [
                        MedusaStep(
                          title: const Text('Add items'),
                          state: getStepState(0),
                          content: Form(
                              key: controller.formKey,
                              child: CreateDraftOrderItemsView(
                                onSaved: (lineItems, customLineItem,
                                    selectedRegion, selectedShippingOption) {
                                  controller.lineItems = lineItems;
                                  controller.customLineItems = customLineItem;
                                  controller.selectedRegion = selectedRegion;
                                  controller.selectedShippingOption =
                                      selectedShippingOption;
                                },
                              )),
                          isActive: currentStep >= 0,
                        ),
                        MedusaStep(
                          title: const Text('Choose Customer'),
                          state: getStepState(1),
                          content: Form(
                              key: controller.formKey2,
                              child: CreateDraftOrderAddressView(controller)),
                          isActive: currentStep >= 1,
                        ),
                        MedusaStep(
                          state: getStepState(2),
                          title: const Text('Draft Order Overview'),
                          content: CreateDraftOrderOverViewView(controller),
                          isActive: currentStep >= 2,
                        ),
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
