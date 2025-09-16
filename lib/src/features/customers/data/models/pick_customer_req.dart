import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

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
