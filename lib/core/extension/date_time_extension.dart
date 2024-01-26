import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart' hide TextDirection;

extension FormatDate on DateTime? {
  String formatDate() {
    final formatOption = PreferenceService.appSettingsGetter.dateFormatOptions;
    if (this == null) {
      return '';
    }
    return DateFormat(formatOption.toPattern()).format(this!);
  }

  String formatTime() {
    final format = PreferenceService.appSettingsGetter.timeFormatOptions;
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
