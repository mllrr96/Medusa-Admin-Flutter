import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_back_button.dart';

import '../controllers/draft_order_details_controller.dart';

class DraftOrderDetailsView extends GetView<DraftOrderDetailsController> {
  const DraftOrderDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('Draft Order Details'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'DraftOrderDetailsView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
