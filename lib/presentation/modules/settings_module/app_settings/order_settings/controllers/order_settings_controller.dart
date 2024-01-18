import 'package:get/get.dart';
import 'package:medusa_admin/data/models/order_preference.dart';
import 'package:medusa_admin/data/service/preference_service.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

class OrderSettingsController extends GetxController {
  late OrderPreference orderPreference;
  @override
  void onInit() {
    super.onInit();
    orderPreference = PreferenceService.orderPreference.copyWith();
  }

  Order order = Order(
    customerId: '',
    email: 'Medusa@js.com',
    regionId: '',
    currencyCode: 'usd',
    customer: const Customer(
        email: 'Medusa@js.com', firstName: 'Medusa', lastName: 'Js'),
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
