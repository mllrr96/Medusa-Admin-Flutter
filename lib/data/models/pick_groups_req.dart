import 'package:medusa_admin_flutter/medusa_admin.dart';

class PickGroupsReq {
  PickGroupsReq({this.selectedGroups, this.multipleSelect = false});
  final List<CustomerGroup>? selectedGroups;
  final bool multipleSelect;
}