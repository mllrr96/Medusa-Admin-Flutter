import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/components/adaptive_close_button.dart';
import 'package:medusa_admin/app/modules/components/custom_expansion_tile.dart';
import 'package:medusa_admin/app/modules/components/custom_text_field.dart';
import 'package:medusa_admin/app/modules/components/keep_alive_widget.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../../components/adaptive_icon.dart';
import '../components/index.dart';
import '../components/pick_customer/controllers/pick_customer_controller.dart';
import '../components/pick_product_variants/controllers/pick_product_variants_controller.dart';
import '../controllers/create_draft_order_controller.dart';

class CreateDraftOrderView extends GetView<CreateDraftOrderController> {
  const CreateDraftOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateDraftOrderController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              leading: const AdaptiveCloseButton(),
              title: const Text('Create Draft Order'),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewPadding.bottom),
              color: Theme.of(context).appBarTheme.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AdaptiveButton(
                      onPressed: controller.tabController.index != 0
                          ? () {
                              controller.tabController.animateTo(0);
                              controller.update();
                            }
                          : null,
                      child: const Text('Back')),
                  AdaptiveButton(
                      onPressed: () {
                        switch(controller.tabController.index){
                          case 0:
                            if (!controller.formKey.currentState!.validate()) {
                              return;
                            }

                            if (controller.lineItems.isEmpty &&
                                controller.customLineItems.isEmpty) {
                              controller.expansionController.expand();
                              return;
                            }
                            controller.tabController.animateTo(1);
                            controller.update();
                            break;
                          case 1:
                            if (!controller.formKey2.currentState!.validate()) {
                              return;
                            }
                        }
                      },
                      child: const Text('Next')),
                ],
              ),
            ),
            body: TabBarView(
                // physics: const NeverScrollableScrollPhysics(),
                controller: controller.tabController,
                children: <Widget>[
                  KeepAliveWidget(child: FirstPage(controller)),
                  ShippingAddress(controller, context: context),
                  DraftOrderOverView()
                ]),
          ),
        );
      },
    );
  }
}

class DraftOrderOverView extends StatelessWidget {
  const DraftOrderOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage(this.controller, {super.key});
  final CreateDraftOrderController controller;
  @override
  Widget build(BuildContext context) {
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    const space = SizedBox(height: 12.0);
    final lineItems = controller.lineItems;
    final customLineItems = controller.customLineItems;
    Future<void> addItems() async {
      final result = await Get.toNamed(Routes.PICK_PRODUCT_VARIANTS,
          arguments: SelectProductsReq(
              selectedProducts:
                  controller.lineItems.map((e) => e.variant!).toList()));
      if (result is SelectProductsRes) {
        final variants = result.selectedProductVariants;
        if (variants?.isEmpty ?? true) {
          return;
        }

        if (controller.lineItems.isEmpty) {
          for (var variant in variants!) {
            controller.lineItems.add(LineItem(
              variantId: variant.id,
              variant: variant,
              quantity: 1,
            ));
          }
        } else {
          // Checking if there's any variants got removed and remove them
          controller.lineItems
              .retainWhere((element) => variants!.contains(element.variant));
          var newItems = variants;
          newItems!.removeWhere((element) => controller.lineItems
              .map((e) => e.variantId)
              .toList()
              .contains(element.id));
          for (var element in newItems) {
            controller.lineItems.add(
                LineItem(variantId: element.id, variant: element, quantity: 1));
          }
        }
        controller.update();
      }
    }

    return SafeArea(
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            ChooseRegionView(
              onRegionChanged: (region) {
                if (controller.selectedRegion == null &&
                    lineItems.isEmpty &&
                    customLineItems.isEmpty) {
                  controller.expansionController.expand();
                }
                controller.selectedRegion = region;
                controller.update();
              },
            ),
            space,
            SlidableAutoCloseBehavior(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: CustomExpansionTile(
                  controller: controller.expansionController,
                  childrenPadding: EdgeInsets.zero,
                  title: Text('Order items', style: smallTextStyle),
                  children: [
                    if (lineItems.isEmpty && customLineItems.isEmpty)
                      Column(
                        children: [
                          Text('No items has been added yet',
                              style: smallTextStyle),
                          space,
                        ],
                      ),
                    if (lineItems.isNotEmpty || customLineItems.isNotEmpty)
                      Text('Slide left to delete a variant',
                          style: smallTextStyle?.copyWith(color: lightWhite)),
                    if (lineItems.isNotEmpty)
                      ListView.builder(
                          itemCount: lineItems.length,
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 4.0, 0.0, 4.0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final lineItem = lineItems[index];
                            return VariantListTile(
                              lineItem,
                              onDelete: () {
                                controller.lineItems.removeAt(index);
                                controller.update();
                              },
                              onAddTap: () {
                                var quantity =
                                    controller.lineItems[index].quantity;
                                quantity = quantity! + 1;
                                controller.lineItems[index].quantity = quantity;
                                controller.update();
                              },
                              onRemoveTap: lineItem.quantity! > 1
                                  ? () {
                                      var quantity =
                                          controller.lineItems[index].quantity;
                                      if (quantity! > 1) {
                                        quantity = quantity - 1;
                                        controller.lineItems[index].quantity =
                                            quantity;
                                        controller.update();
                                      }
                                    }
                                  : null,
                            );
                          }),
                    if (lineItems.isNotEmpty && customLineItems.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            Text('Custom Items',
                                style: smallTextStyle?.copyWith(
                                    color: lightWhite)),
                          ],
                        ),
                      ),
                    if (customLineItems.isNotEmpty)
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: customLineItems.length,
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          itemBuilder: (context, index) {
                            final customLineItem = customLineItems[index];
                            return CustomVariantListTile(
                              customLineItem,
                              currencyCode:
                                  controller.selectedRegion!.currencyCode!,
                              onDelete: () {
                                controller.customLineItems.removeAt(index);
                                controller.update();
                              },
                              onAddTap: () {
                                customLineItems[index].quantity =
                                    customLineItems[index].quantity! + 1;
                                controller.update();
                              },
                              onRemoveTap: customLineItems[index].quantity! > 1
                                  ? () {
                                      if (customLineItems[index].quantity! >
                                          1) {
                                        customLineItems[index].quantity =
                                            customLineItems[index].quantity! -
                                                1;
                                        controller.update();
                                      }
                                    }
                                  : null,
                            );
                          }),
                    const Divider(height: 0),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AdaptiveButton(
                              onPressed: controller.selectedRegion != null
                                  ? () async {
                                      final result =
                                          await showBarModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return AddCustomItemView(
                                                    currencyCode: controller
                                                        .selectedRegion
                                                        ?.currencyCode);
                                              });
                                      if (result is LineItem) {
                                        controller.customLineItems.add(result);
                                        controller.update();
                                      }
                                    }
                                  : null,
                              child: const Row(
                                children: [
                                  Icon(Icons.add),
                                  Text('Add Custom'),
                                ],
                              )),
                          AdaptiveButton(
                            onPressed: () async => addItems(),
                            child: const Row(
                              children: [
                                Icon(Icons.add),
                                Text('Add Existing'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            space,
            if (controller.selectedRegion != null)
              ChooseShippingOptionView(
                regionId: controller.selectedRegion!.id!,
                onShippingOptionChanged: (shippingOption) {
                  if (shippingOption != null) {
                    controller.selectedShippingOption = shippingOption;
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}

class ShippingAddress extends StatefulWidget {
  const ShippingAddress(this.controller, {super.key, this.context});
  final CreateDraftOrderController controller;
  final BuildContext? context;
  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress>
    with AutomaticKeepAliveClientMixin<ShippingAddress> {
  final customerCtrl = TextEditingController();
  final emailCtrl = TextEditingController();

  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final companyCtrl = TextEditingController();

  final address1Ctrl = TextEditingController();
  final address2Ctrl = TextEditingController();
  final postalCodeCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final provinceCtrl = TextEditingController();
  final countryCtrl = TextEditingController();
  final scrollController = ScrollController();
  final shippingGeneralKey = GlobalKey();
  final billingGeneralKey = GlobalKey();
  final shippingAddressKey = GlobalKey();
  final billingAddressKey = GlobalKey();

  final billingFirstNameCtrl = TextEditingController();
  final billingLastNameCtrl = TextEditingController();
  final billingPhoneCtrl = TextEditingController();
  final billingCompanyCtrl = TextEditingController();

  final billingAddress1Ctrl = TextEditingController();
  final billingAddress2Ctrl = TextEditingController();
  final billingPostalCodeCtrl = TextEditingController();
  final billingCityCtrl = TextEditingController();
  final billingProvinceCtrl = TextEditingController();
  final billingCountryCtrl = TextEditingController();

  @override
  void dispose() {
    scrollController.dispose();
    customerCtrl.dispose();
    emailCtrl.dispose();
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    phoneCtrl.dispose();
    companyCtrl.dispose();
    address1Ctrl.dispose();
    address2Ctrl.dispose();
    postalCodeCtrl.dispose();
    cityCtrl.dispose();
    provinceCtrl.dispose();
    countryCtrl.dispose();
    billingFirstNameCtrl.dispose();
    billingLastNameCtrl.dispose();
    billingPhoneCtrl.dispose();
    billingCompanyCtrl.dispose();
    billingAddress1Ctrl.dispose();
    billingAddress2Ctrl.dispose();
    billingPostalCodeCtrl.dispose();
    billingCityCtrl.dispose();
    billingProvinceCtrl.dispose();
    billingCountryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final controller = widget.controller;
    const space = SizedBox(height: 12.0);
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;

    Future<void> scrollToSelectedContent(
        {required GlobalKey globalKey, Duration? delay}) async {
      await Future.delayed(delay ?? const Duration(milliseconds: 240))
          .then((value) async {
        final yPosition =
            (globalKey.currentContext?.findRenderObject() as RenderBox?)
                    ?.localToGlobal(Offset.zero)
                    .dy ??
                0.0;
        var topPadding =
            (widget.context?.mediaQueryPadding.top ?? 0) + kToolbarHeight;
        final scrollPoint = scrollController.offset + yPosition - topPadding;
        if (scrollPoint <= scrollController.position.maxScrollExtent) {
          await scrollController.animateTo(scrollPoint - 10,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn);
        } else {
          await scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn);
        }
      });
    }

    return SafeArea(
        child: Form(
      key: controller.formKey2,
      child: ListView(
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        children: [
          LabeledTextField(
            label: 'Customer',
            controller: customerCtrl,
            readOnly: true,
            onTap: () async {
              final result = await Get.toNamed(Routes.PICK_CUSTOMER,
                  arguments: PickCustomerReq(
                      selectedCustomers: controller.selectedCustomer != null
                          ? [controller.selectedCustomer!]
                          : null));
              if (result is PickCustomerRes) {
                final customer = result.selectedCustomers.first;
                controller.selectedCustomer = customer;
                customerCtrl.text = customer.firstName != null
                    ? '${customer.firstName ?? ''} ${customer.lastName ?? ''} (${customer.email})'
                    : customer.email;
                emailCtrl.text = customer.email;
                firstNameCtrl.text = customer.firstName ?? '';
                lastNameCtrl.text = customer.lastName ?? '';
                phoneCtrl.text = customer.phone ?? '';
                setState(() {});
              }
            },
            decoration: InputDecoration(
              hintText: 'Choose customer',
              suffixIcon: controller.selectedCustomer != null
                  ? AdaptiveIcon(
                      onPressed: () {
                        controller.selectedCustomer = null;
                        customerCtrl.clear();
                        firstNameCtrl.clear();
                        lastNameCtrl.clear();
                        phoneCtrl.clear();
                        emailCtrl.clear();
                        setState(() {});
                      },
                      icon: const Icon(CupertinoIcons.clear_circled))
                  : const Icon(Icons.arrow_drop_down),
            ),
            validator: (val) {
              if (emailCtrl.text.removeAllWhitespace.isNotEmpty &&
                  (val?.isEmpty ?? true)) {
                return null;
              }

              if (emailCtrl.text.removeAllWhitespace.isEmpty &&
                  (val?.isEmpty ?? true)) {
                return 'Field is required';
              }

              return null;
            },
          ),
          LabeledTextField(
            label: 'Email',
            style: controller.selectedCustomer != null
                ? smallTextStyle?.copyWith(color: lightWhite)
                : null,
            onChanged: (val) {
              controller.selectedCustomer ??= Customer(email: val);
            },
            validator: (val) {
              if (customerCtrl.text.isNotEmpty && (val?.isEmpty ?? true)) {
                return null;
              }

              if (customerCtrl.text.isEmpty && (val?.isEmpty ?? true)) {
                return 'Field is required';
              }

              return null;
            },
            required: true,
            controller: emailCtrl,
            readOnly: widget.controller.selectedCustomer != null,
            hintText: 'lebron@james.com',
            decoration: InputDecoration(
                prefixIcon: widget.controller.selectedCustomer == null
                    ? null
                    : Icon(CupertinoIcons.lock_fill, color: lightWhite)),
          ),
          space,
          const Text('Shipping Details'),
          space,
          CustomExpansionTile(
            key: shippingGeneralKey,
            // label: 'General',
            title: Text('General', style: smallTextStyle),
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: shippingGeneralKey);
              }
            },
            children: [
              LabeledTextField(
                label: 'First Name',
                controller: firstNameCtrl,
                validator: (val) {
                  if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                onChanged: (val) {
                  controller.shippingAddress.firstName = val;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Last Name',
                controller: lastNameCtrl,
                onChanged: (val) {
                  controller.shippingAddress.lastName = val;
                },
                validator: (val) {
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Company',
                controller: companyCtrl,
                onChanged: (val) {
                  controller.shippingAddress.company = val;
                },
              ),
              LabeledTextField(
                label: 'Phone Number',
                controller: phoneCtrl,
                onChanged: (val) {
                  controller.shippingAddress.phone = int.tryParse(val);
                },
              ),
            ],
          ),
          space,
          CustomExpansionTile(
            key: shippingAddressKey,
            // label: 'Shipping Address',
            title: Text('Shipping Address', style: smallTextStyle),
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: shippingAddressKey);
              }
            },
            children: [
              LabeledTextField(
                label: 'Address 1',
                controller: address1Ctrl,
                onChanged: (val) {
                  controller.shippingAddress.address1 = val;
                },
                validator: (val) {
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Address 2',
                controller: address2Ctrl,
                onChanged: (val) {
                  controller.shippingAddress.address2 = val;
                },
              ),
              LabeledTextField(
                label: 'Postal Code',
                controller: postalCodeCtrl,
                onChanged: (val) {
                  controller.shippingAddress.postalCode = val;
                },
                validator: (val) {
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'City',
                controller: cityCtrl,
                onChanged: (val) {
                  controller.shippingAddress.city = val;
                },
                validator: (val) {
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Province',
                controller: provinceCtrl,
                onChanged: (val) {
                  controller.shippingAddress.province = val;
                },
              ),
              LabeledTextField(
                label: 'Country',
                controller: countryCtrl,
                onChanged: (val) {},
                validator: (val) {
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
            ],
          ),
          const Divider(),
          const Text('Billing Details'),
          space,
          CheckboxListTile(
            value: controller.sameAddress,
            onChanged: (val) {
             if (val == null) return;
              if (val) {
                controller.sameAddress = true;
                billingFirstNameCtrl.clear();
                billingLastNameCtrl.clear();
                billingCompanyCtrl.clear();
                billingPhoneCtrl.clear();
                billingAddress1Ctrl.clear();
                billingAddress2Ctrl.clear();
                billingPostalCodeCtrl.clear();
                billingCityCtrl.clear();
                billingProvinceCtrl.clear();
                billingCountryCtrl.clear();
              } else {
                controller.billingAddress = Address();
                controller.sameAddress = false;
              }
              controller.update();
            },
            title: Text('Use same as shipping', style: smallTextStyle),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
          ),
          space,
          CustomExpansionTile(
            key: billingGeneralKey,
            // label: 'General',
            title: Text('General', style: smallTextStyle),
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: billingGeneralKey);
              }
            },
            children: [
              LabeledTextField(
                label: 'First Name',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingFirstNameCtrl,
                onChanged: (val) {
                  controller.billingAddress.firstName = val;
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Last Name',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingLastNameCtrl,
                onChanged: (val) {
                  controller.billingAddress.lastName = val;
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Company',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingCompanyCtrl,
                onChanged: (val) {
                  controller.billingAddress.company = val;
                },
              ),
              LabeledTextField(
                label: 'Phone Number',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingPhoneCtrl,
                onChanged: (val) {
                  controller.billingAddress.phone = int.tryParse(val);
                },
              ),
            ],
          ),
          space,
          CustomExpansionTile(
            key: billingAddressKey,
            // label: 'Billing Address',
            title: Text('Billing Address', style: smallTextStyle),
            onExpansionChanged: (expanded) async {
              if (expanded) {
                await scrollToSelectedContent(globalKey: billingAddressKey);
              }
            },
            children: [
              LabeledTextField(
                label: 'Address 1',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingAddress1Ctrl,
                onChanged: (val) {
                  controller.billingAddress.address1 = val;
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Address 2',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingAddress2Ctrl,
                onChanged: (val) {
                  controller.billingAddress.address2 = val;
                },
              ),
              LabeledTextField(
                label: 'Postal Code',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingPostalCodeCtrl,
                onChanged: (val) {
                  controller.billingAddress.postalCode = val;
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'City',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingCityCtrl,
                onChanged: (val) {
                  controller.billingAddress.city = val;
                },
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
              LabeledTextField(
                label: 'Province',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingProvinceCtrl,
                onChanged: (val) {
                  controller.billingAddress.province = val;
                },
              ),
              LabeledTextField(
                label: 'Country',
                lightLabelColor: controller.sameAddress,
                readOnly: controller.sameAddress,
                controller: billingCountryCtrl,
                onChanged: (val) {},
                validator: (val) {
                  if (controller.sameAddress) {
                    return null;
                  }
                 if (val == null|| val.isEmpty) return 'Field is required';
                  return null;
                },
                required: true,
              ),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
