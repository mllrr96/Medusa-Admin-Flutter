import 'package:medusa_admin_flutter/medusa_admin.dart';

class PickCustomerReq {
  final List<Customer>? selectedCustomers;
  final List<Customer>? disabledCustomers;
  final bool multipleSelection;
  PickCustomerReq({
    this.multipleSelection = false,
    this.selectedCustomers,
    this.disabledCustomers,
  });
}