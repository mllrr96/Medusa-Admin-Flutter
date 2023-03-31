import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/adaptive_back_button.dart';
import '../controllers/tax_settings_controller.dart';

class TaxSettingsView extends GetView<TaxSettingsController> {
  const TaxSettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AdaptiveBackButton(),
        title: const Text('TaxSettingsView'),
      ),
      body: const Center(
        child: Text(
          'TaxSettingsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
