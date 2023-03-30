import '../store/invite.dart';

class UserRetrieveInvitesRes {
  List<Invite>? invites;

  UserRetrieveInvitesRes(this.invites);

  UserRetrieveInvitesRes.fromJson(Map<String, dynamic> json) {
    if (json['invites'] != null) {
      invites = <Invite>[];
      json['invites'].forEach((v) => invites!.add(Invite.fromJson(v)));
    }
  }
}

class UserDeleteInvitesRes{
  /// The ID of the deleted Invite.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "invite"
  final String? object;

  /// Whether or not the Invite was deleted.
  final bool deleted;
  UserDeleteInvitesRes({required this.deleted, this.id, this.object});
  factory UserDeleteInvitesRes.fromJson(json) {
    return UserDeleteInvitesRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}