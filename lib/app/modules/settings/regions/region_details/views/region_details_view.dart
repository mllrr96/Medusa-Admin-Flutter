import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/region_details_controller.dart';

class RegionDetailsView extends GetView<RegionDetailsController> {
  const RegionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegionDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RegionDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
