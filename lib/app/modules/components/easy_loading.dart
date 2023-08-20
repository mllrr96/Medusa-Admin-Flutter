import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medusa_admin/core/utils/colors.dart';

import '../../../core/utils/enums.dart';

Future<void> loading({String? status}) async {
  await EasyLoading.show(
      // status: status ?? 'Loading',
      maskType: EasyLoadingMaskType.black,
      indicator: LoadingAnimationWidget.threeArchedCircle(color: ColorManager.primary, size: 50));
}

Future<void> dismissLoading() async {
  await EasyLoading.dismiss();
}

Future<SortOptions?> selectSortOptions(BuildContext context, SortOptions sortOption)async{
return  await showModalActionSheet<SortOptions>(
      context: context,
      title: 'Sort results',
      actions: <SheetAction<SortOptions>>[
        SheetAction(
            label: 'A-Z',
            key: SortOptions.aZ,
            isDestructiveAction:
            sortOption == SortOptions.aZ),
        SheetAction(
            label: 'Z-A',
            key: SortOptions.zA,
            isDestructiveAction:
            sortOption == SortOptions.zA),
        SheetAction(
            label: 'Creation Date',
            key: SortOptions.dateRecent,
            isDestructiveAction:
            sortOption == SortOptions.dateRecent),
        SheetAction(
            label: 'Creation Date - Ascending',
            key: SortOptions.dateOld,
            isDestructiveAction:
            sortOption == SortOptions.dateOld),
      ]);
}