import 'package:get/get.dart';
import 'package:medusa_admin/data/models/settings.dart';
import 'package:medusa_admin/data/service/storage_service.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class OrderSettingsController extends GetxController {
  late OrderSettings orderSettings;
  @override
  void onInit() {
    super.onInit();
   orderSettings =  StorageService.orderSettings.copyWith();
  }

  Order order = Order(
    customerId: '',
    email: 'Medusa@js.com',
    regionId: '',
    currencyCode: 'usd',
    customer: const Customer(email: 'Medusa@js.com', firstName: 'Medusa', lastName: 'Js'),
    total: 12345,
    shippingAddress: const Address(countryCode: 'us'),
    cart: Cart(
      createdAt: DateTime.now(),
    ),
    currency: const Currency(
      name: 'US Dollars',
      symbol: '\$',
      symbolNative: '\$',
      code: 'us',
    ),
    fulfillmentStatus: FulfillmentStatus.notFulfilled,
    paymentStatus: PaymentStatus.captured,
    displayId: 69,
  );



}
