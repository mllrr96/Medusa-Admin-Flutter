import 'package:medusa_admin_dart_client/medusa_admin.dart';

class PickRegionsReq {
  final bool multipleSelect;
  final List<Region>? selectedRegions;
  PickRegionsReq({this.multipleSelect = false, this.selectedRegions});
}