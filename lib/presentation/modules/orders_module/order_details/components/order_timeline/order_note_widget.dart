import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:medusa_admin/core/extension/text_style_extension.dart';

import '../../../../../../core/constant/colors.dart';
import 'package:medusa_admin/core/extension/date_time_extension.dart';

class OrderNoteWidget extends StatelessWidget {
  const OrderNoteWidget(this.note, {super.key, this.onNoteDelete});
  final Note note;
  final void Function()? onNoteDelete;
  @override
  Widget build(BuildContext context) {
    final user = note.author;
    final name = '${user?.firstName ?? ''} ${user?.lastName ?? ''}';
    final email = user?.email;
    final text = name.removeAllWhitespace.isNotEmpty ? '$name ($email)' : email;
    final durationDiff =
        DateTime.now().difference(note.createdAt ?? DateTime.now());
    const manatee = ColorManager.manatee;
    final smallTextStyle = context.bodySmall;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: ColorManager.getAvatarColor(text),
                        child: Text(text?[0].toUpperCase() ?? '',
                            style:
                                smallTextStyle?.copyWith(color: Colors.white)),
                      ),
                      const Gap(8),
                      Flexible(
                          child: Text(text ?? '',
                              style: smallTextStyle?.copyWith(
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.transparent,
                        child: Text(text?[0].toUpperCase() ?? '',
                            style: smallTextStyle?.copyWith(
                                color: Colors.transparent)),
                      ),
                      const Gap(8),
                      Text(DateTime.now().subtract(durationDiff).timeAgo(),
                          style: smallTextStyle?.copyWith(color: manatee)),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () async {
                  await showOkCancelAlertDialog(
                    context: context,
                    title: 'Delete note',
                    message: 'Are you sure you want to delete this note?',
                    okLabel: 'Yes, Delete',
                    isDestructiveAction: true,
                  ).then((result) async {
                    if (result == OkCancelResult.ok) {
                      onNoteDelete?.call();
                    }
                  });
                },
                icon: const Icon(Icons.delete_forever, color: Colors.red))
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.transparent,
              child: Text(text?[0].toUpperCase() ?? '',
                  style: smallTextStyle?.copyWith(color: Colors.transparent)),
            ),
            const Gap(8),
            Flexible(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  // color: context.theme.scaffoldBackgroundColor,
                  color: Get.isDarkMode
                      ? context.theme.scaffoldBackgroundColor
                      : ColorManager.primaryOpacity,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  note.value ?? '',
                  style: smallTextStyle?.copyWith(
                      color:
                          Get.isDarkMode ? Colors.white : ColorManager.primary),
                ),
              ),
            ),
          ],
        ),
        const Gap(8),
      ],
    );
  }
}
