import 'package:medusa_admin_flutter/medusa_admin.dart';

class PickRegionsReq {
  final bool multipleSelect;
  final List<Region>? selectedRegions;
  PickRegionsReq({this.multipleSelect = false, this.selectedRegions});
}