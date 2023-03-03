import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';

import '../controllers/region_details_controller.dart';

class RegionDetailsView extends GetView<RegionDetailsController> {
  const RegionDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Region Details'),
          centerTitle: true,
          actions: [
            AdaptiveIcon(
                icon: const Icon(Icons.more_horiz_outlined),
                onPressed: () async {
                  await showModalActionSheet<int>(context: context, actions: <SheetAction<int>>[
                    const SheetAction(label: 'Edit', key: 0),
                    const SheetAction(label: 'Delete', isDestructiveAction: true, key: 1),
                  ]).then((result) {
                    if (result == null) return;
                    if (result == 0) {

                    } else if (result == 1) {}
                  });
                })
          ],
        ),
        body: SafeArea(child: SizedBox()));
  }
}
