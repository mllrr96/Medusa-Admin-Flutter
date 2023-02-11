import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/products/add_update_product/components/product_components.dart';

import '../controllers/store_details_controller.dart';

class StoreDetailsView extends GetView<StoreDetailsController> {
  const StoreDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediumTextStyle = Theme.of(context).textTheme.titleMedium;
    final largeTextStyle = Theme.of(context).textTheme.titleLarge;
    const space = SizedBox(height: 12.0);
    Color lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Details'),
        centerTitle: true,
        actions: [
          if (GetPlatform.isIOS) CupertinoButton(child: const Text('Save'), onPressed: () {}),
          if (GetPlatform.isAndroid) TextButton(child: const Text('Save'), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('Manage your business details', style: mediumTextStyle!.copyWith(color: lightWhite)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                color: Theme.of(context).expansionTileTheme.backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('General', style: largeTextStyle),
                  space,
                  ProductTextField(label: 'Store Name', controller: controller.storeCtrl),
                  space,
                  space,
                  Text('Advanced settings', style: largeTextStyle),
                  space,
                  ProductTextField(
                      label: 'Swap link template',
                      controller: controller.swapLinkCtrl,
                      hintText: 'https://acme.inc/swap={swap_id}'),
                  ProductTextField(
                      label: 'Draft order link template',
                      controller: controller.draftOrderCtrl,
                      hintText: 'https://acme.inc/payment={payment_id}'),
                  ProductTextField(
                      label: 'Invite link template',
                      controller: controller.inviteLinkCtrl,
                      hintText: 'https://acme.inc/invite?token={invite_token}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
