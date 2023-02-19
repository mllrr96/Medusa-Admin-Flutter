import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/collection_details_controller.dart';

class CollectionDetailsView extends GetView<CollectionDetailsController> {
  const CollectionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Details'),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Center(
          child: Text(
            'CollectionDetailsView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
