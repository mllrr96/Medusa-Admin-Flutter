import 'package:medusa_admin/data/service/storage_service.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart' hide TextDirection;

extension FormatDate on DateTime? {
  String formatDate() {
    final formatOption = StorageService.appSettings.dateFormatOptions;
    if (this == null) {
      return '';
    }
    return DateFormat(formatOption.toPattern()).format(this!);
  }

  String formatTime() {
    final format = StorageService.appSettings.timeFormatOptions;
    if (this == null) {
      return '';
    }
    return DateFormat(format.format()).format(this!);
  }

  String timeAgo() {
    if (this == null) {
      return '';
    }
    return timeago.format(this!);
  }
}
