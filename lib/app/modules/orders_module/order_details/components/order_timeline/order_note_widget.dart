import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';
import 'package:medusa_admin/app/modules/components/adaptive_icon.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../../core/utils/colors.dart';

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
    final smallTextStyle = Theme.of(context).textTheme.titleSmall;
    final durationDiff = DateTime.now().difference(note.createdAt ?? DateTime.now());
    final lightWhite = Get.isDarkMode ? Colors.white54 : Colors.black54;
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
                        child: Text(text?[0].toUpperCase() ?? '', style: smallTextStyle?.copyWith(color: Colors.white)),
                      ),
                      const SizedBox(width: 8.0),
                      Flexible(child: Text(text ?? '', style: smallTextStyle?.copyWith(fontWeight: FontWeight.bold))),
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
                      const SizedBox(width: 8.0),
                      Text(timeago.format(DateTime.now().subtract(durationDiff)),
                          style: smallTextStyle?.copyWith(color: lightWhite)),
                    ],
                  ),
                ],
              ),
            ),
            AdaptiveIcon(
                onPressed: () async {
                  await showOkCancelAlertDialog(
                    context: context,
                    title: 'Delete note',
                    message: 'Are you sure you want to delete this note?',
                    okLabel: 'Yes, Delete',
                    isDestructiveAction: true,
                  ).then((result) async{
                    if (result == OkCancelResult.ok) {
                      if (onNoteDelete != null) {
                        onNoteDelete!();
                      }
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
              child: Text(text?[0].toUpperCase() ?? '', style: smallTextStyle?.copyWith(color: Colors.transparent)),
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  // color: context.theme.scaffoldBackgroundColor,
                  color: Get.isDarkMode ? context.theme.scaffoldBackgroundColor : ColorManager.primaryOpacity,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  note.value ?? '',
                  style: smallTextStyle?.copyWith(color: Get.isDarkMode ? Colors.white : ColorManager.primary),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
