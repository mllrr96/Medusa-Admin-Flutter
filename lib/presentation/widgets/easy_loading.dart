import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:medusa_admin/data/service/preference_service.dart';

import '../../../core/utils/enums.dart';

Future<void> loading({String? status}) async {
  final color = FlexColor.schemes[PreferenceService.appSettings.colorScheme]!.light.primary;
  await EasyLoading.show(
      status: status,
      maskType: EasyLoadingMaskType.black,
      indicator: LoadingAnimationWidget.threeArchedCircle(
          color: color, size: 50));
}

Future<void> dismissLoading() async {
  await EasyLoading.dismiss();
}

Future<SortOptions?> selectSortOptions(
    BuildContext context, SortOptions sortOption,
    {bool disableAZ = false,
    bool disableZA = false,
    bool disabledDate = false,
    bool disableDateAsc = false}) async {
  return await showModalActionSheet<SortOptions>(
      context: context,
      title: 'Sort results',
      actions: <SheetAction<SortOptions>>[
        if (!disableAZ)
          SheetAction(
              label: 'A-Z',
              key: SortOptions.aZ,
              isDestructiveAction: sortOption == SortOptions.aZ),
        if (!disableZA)
          SheetAction(
              label: 'Z-A',
              key: SortOptions.zA,
              isDestructiveAction: sortOption == SortOptions.zA),
        if (!disabledDate)
          SheetAction(
              label: 'Creation Date',
              key: SortOptions.dateRecent,
              isDestructiveAction: sortOption == SortOptions.dateRecent),
        if (!disableDateAsc)
          SheetAction(
              label: 'Creation Date - Ascending',
              key: SortOptions.dateOld,
              isDestructiveAction: sortOption == SortOptions.dateOld),
      ]);
}
