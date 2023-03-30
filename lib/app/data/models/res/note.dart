import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/index.dart';

class UserNoteRes {
  final Note? note;

  UserNoteRes(this.note);

  factory UserNoteRes.fromJson(Map<String, dynamic> json) {
    return UserNoteRes(json['note'] != null ? Note.fromJson(json['note']) : null);
  }
}

class UserNotesRes extends PaginatedResponse {
  List<Note>? notes;

  UserNotesRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['notes'] == null) return;
    notes = <Note>[];
    json['notes'].forEach((v) => notes!.add(Note.fromJson(v)));
  }
}

class UserDeleteNoteRes {
  /// The ID of the deleted Note.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "note"
  final String? object;

  /// Whether or not the Note was deleted.
  final bool deleted;
  UserDeleteNoteRes({required this.deleted, this.id, this.object});
  factory UserDeleteNoteRes.fromJson(json) {
    return UserDeleteNoteRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
