import 'package:get/get.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/data/repository/customer/customer_repo.dart';

class CustomerDetailsController extends GetxController with StateMixin<Customer> {
  CustomerDetailsController({required this.customerRepo});
  final CustomerRepository customerRepo;
  String customerId = Get.arguments;
  @override
  Future<void> onInit() async {
    await _loadCustomer();
    super.onInit();
  }

  Future<void> _loadCustomer() async {
    change(null, status: RxStatus.loading());
    final result = await customerRepo.retrieve(id: customerId, queryParameters: {
      'expand':
          'orders,shipping_addresses,groups,billing_address,orders.items,orders.cart,orders.customer,orders.shipping_address,orders.sales_channel,orders.currency',
    });
    result.when((success) => change(success.customer, status: RxStatus.success()),
        (error) => change(null, status: RxStatus.error()));
  }
}
