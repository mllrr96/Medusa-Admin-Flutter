import '../store/store.dart';

class UserStoreRes {
  const UserStoreRes({required this.store});
  final Store store;

  factory UserStoreRes.fromJson(Map<String, dynamic> json) {
    return UserStoreRes(store: Store.fromJson(json['store']));
  }
}
