import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medusa_admin/core/extension/context_extension.dart';
import 'package:medusa_admin/core/extension/snack_bar_extension.dart';
import 'package:medusa_admin/presentation/blocs/draft_order_crud/draft_order_crud_bloc.dart';
import 'package:medusa_admin/presentation/widgets/easy_loading.dart';
import 'package:medusa_admin/presentation/widgets/hide_keyboard.dart';
import 'package:medusa_admin/presentation/widgets/medusa_stepper.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'components/index.dart';

@RoutePage()
class CreateDraftOrderView extends StatefulWidget {
  const CreateDraftOrderView({super.key});

  @override
  State<CreateDraftOrderView> createState() => _CreateDraftOrderViewState();
}

class _CreateDraftOrderViewState extends State<CreateDraftOrderView> {
  int currentStep = 0;
  late DraftOrderCrudBloc draftOrderCrudBloc;

  Future<void> onCloseTap() async {
    if (customLineItems.isNotEmpty || lineItems.isNotEmpty) {
      await showOkCancelAlertDialog(
              context: context,
              title: 'Discard changes?',
              message: 'Are you sure you want to discard changes?',
              isDestructiveAction: true)
          .then((result) {
        switch (result) {
          case OkCancelResult.ok:
            context.maybePop();
          case OkCancelResult.cancel:
        }
      });
    } else {
      context.maybePop();
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

  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final expansionController = ExpansionTileController();
  List<LineItem> lineItems = [];
  List<LineItem> customLineItems = [];
  Region? selectedRegion;
  ShippingOption? selectedShippingOption;
  Customer? customer;
  Address? shippingAddress;
  Address? billingAddress;

  @override
  void initState() {
    draftOrderCrudBloc = DraftOrderCrudBloc.instance;
    super.initState();
  }

  @override
  void dispose() {
    draftOrderCrudBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DraftOrderCrudBloc, DraftOrderCrudState>(
      bloc: draftOrderCrudBloc,
      listener: (context, state) {
        state.mapOrNull(
          loading: (_) => loading(),
          error: (error) {
            dismissLoading();
            context.showSnackBar('Error creating draft order ${error.error}');
          },
          draftOrder: (draftOrder) {
            dismissLoading();
            context.showSnackBar('Draft order created');
            context.maybePop();
          },
        );
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: context.theme.appBarTheme.systemOverlayStyle!.copyWith(
          systemNavigationBarColor: context.theme.appBarTheme.backgroundColor,
          statusBarColor: context.theme.appBarTheme.backgroundColor,
        ),
        child: HideKeyboard(
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
                      padding: EdgeInsets.fromLTRB(
                          8, 0, 8, context.bottomViewPadding),
                      color: context.theme.appBarTheme.backgroundColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                            onPressed:
                                currentStep == 0 ? null : details.onStepCancel,
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
                    if (currentStep == 0 && formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.unfocus();
                      goStep(currentStep + 1);
                      return;
                    }

                    if (currentStep == 1 && formKey2.currentState!.validate()) {
                      formKey2.currentState!.save();
                      context.unfocus();
                      goStep(currentStep + 1);
                      return;
                    }
                    if (currentStep == 2) {
                      context.unfocus();
                      draftOrderCrudBloc.add(
                        DraftOrderCrudEvent.create(UserCreateDraftOrderReq(
                            discounts: [],
                            email: customer!.email,
                            customerId: customer?.id,
                            regionId: selectedRegion!.id!,
                            shippingMethods: [
                              ShippingMethod(
                                  shippingOptionId: selectedShippingOption!.id,
                                  price: selectedShippingOption!.amount),
                            ],
                            shippingAddress: shippingAddress,
                            billingAddress: billingAddress,
                            items: [...lineItems, ...customLineItems])),
                      );
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
                        key: formKey,
                        child: CreateDraftOrderItemsView(
                          onSaved: (lineItems, customLineItem, selectedRegion,
                              selectedShippingOption) {
                            this.lineItems = lineItems;
                            customLineItems = customLineItem;
                            this.selectedRegion = selectedRegion;
                            this.selectedShippingOption =
                                selectedShippingOption;
                          },
                        ),
                      ),
                      isActive: currentStep >= 0,
                    ),
                    MedusaStep(
                      title: const Text('Choose Customer'),
                      state: getStepState(1),
                      content: Form(
                        key: formKey2,
                        child: CreateDraftOrderAddressView(
                          selectedRegion?.countries ?? [],
                          onSaved: (customer, shippingAddress, billingAddress) {
                            this.customer = customer;
                            this.shippingAddress = shippingAddress;
                            this.billingAddress = billingAddress;
                          },
                        ),
                      ),
                      isActive: currentStep >= 1,
                    ),
                    MedusaStep(
                      state: getStepState(2),
                      title: const Text('Draft Order Overview'),
                      content: CreateDraftOrderOverViewView(
                        lineItems: lineItems + customLineItems,
                        region: selectedRegion ??
                            const Region(
                                name: 'Region', currencyCode: '', taxRate: 0),
                        shippingOption: selectedShippingOption ??
                            const ShippingOption(
                                name: '',
                                regionId: '',
                                profileId: '',
                                providerId: '',
                                priceType: null),
                        customer: customer ?? const Customer(email: 'medusa@js.com'),
                        shippingAddress: shippingAddress ?? const Address(),
                        billingAddress: billingAddress ?? const Address(),
                      ),
                      isActive: currentStep >= 2,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
