import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

class PickGroupsReq {
  PickGroupsReq({this.selectedGroups, this.multipleSelect = false});
  final List<CustomerGroup>? selectedGroups;
  final bool multipleSelect;
}