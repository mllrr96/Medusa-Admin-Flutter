import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/data/service/store_service.dart';
import 'package:medusa_admin/app/modules/components/adaptive_button.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/product_general_info.dart';
import 'package:medusa_admin/app/routes/app_pages.dart';

import '../controllers/add_region_controller.dart';

class AddRegionView extends GetView<AddRegionController> {
  const AddRegionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Region'),
            centerTitle: true,
            actions: [
              AdaptiveButton(onPressed: () async => await controller.createRegion(), child: const Text('Create'))
            ],
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EditCard(label: 'Details', required: true, initiallyExpanded: true, children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text('Add the region details.', style: smallTextStyle!.copyWith(color: lightWhite))),
                      ],
                    ),
                    space,
                    ProductTextField(
                      label: 'Title',
                      controller: TextEditingController(),
                      required: true,
                      hintText: 'Europe',
                      validator: (val) {
                        if (val == null || val.removeAllWhitespace.isEmpty) {
                          return 'Field required';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Text('Currency', style: mediumTextStyle),
                        Text('*', style: mediumTextStyle!.copyWith(color: Colors.red)),
                      ],
                    ),
                    const SizedBox(height: 6.0),
                    DropdownButtonFormField(
                      validator: (val) {
                        if (val == null) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      items: StoreService.store.currencies!
                          .map((e) => DropdownMenuItem(value: e, child: Text(e.name!)))
                          .toList(),
                      hint: const Text('Choose currency'),
                      onChanged: (value) {
                        if (value != null) {
                          // controller.selectedOptionsValue[index] = value;
                        }
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                      ),
                    ),
                    space,
                    ProductTextField(
                      label: 'Default Tax Rate',
                      controller: TextEditingController(),
                      required: true,
                      hintText: '% 25',
                      validator: (val) {
                        if (val == null || val.removeAllWhitespace.isEmpty) {
                          return 'Field required';
                        }
                        return null;
                      },
                    ),
                    ProductTextField(
                      label: 'Default Tax Code',
                      controller: TextEditingController(),
                      hintText: '1000',
                      validator: (val) {
                        if (val == null || val.removeAllWhitespace.isEmpty) {
                          return 'Field required';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Text('Countries', style: mediumTextStyle),
                        Text('*', style: mediumTextStyle.copyWith(color: Colors.red)),
                      ],
                    ),
                    const SizedBox(height: 6.0),
                    AdaptiveButton(
                        onPressed: () => Get.toNamed(Routes.SELECT_COUNTRY, arguments: true),
                        child: Text('Select country')),
                    // DropdownButtonFormField(
                    //   validator: (val) {
                    //     if (val == null) {
                    //       return 'Field is required';
                    //     }
                    //     return null;
                    //   },
                    //   items: countries.map((e) => DropdownMenuItem(value: e, child: Text(e.name!))).toList(),
                    //   hint: const Text('Choose Countries'),
                    //   onChanged: (value) {
                    //     if (value != null) {
                    //       // controller.selectedOptionsValue[index] = value;
                    //     }
                    //   },
                    //   decoration: const InputDecoration(
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    //     ),
                    //   ),
                    // ),
                    space,
                  ]),
                  space,
                  EditCard(
                    label: 'Providers',
                    required: true,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                                  'Add which fulfillment and payment providers should be available in this region.',
                                  style: smallTextStyle.copyWith(color: lightWhite))),
                        ],
                      ),
                      space,
                      ProductTextField(
                          label: 'Payment Providers',
                          controller: TextEditingController(),
                          required: true,
                          hintText: 'Europe'),
                      ProductTextField(
                          label: 'Fulfillment Providers',
                          controller: TextEditingController(),
                          required: true,
                          hintText: 'Europe'),
                    ],
                  ),
                ],
              ),
            ),
          ))),
    );
  }
}
