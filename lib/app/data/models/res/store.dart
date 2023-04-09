import 'package:medusa_admin/app/data/models/store/index.dart';

import '../store/payment_provider.dart';
import '../store/store.dart';

class UserStoreRes {
  const UserStoreRes({required this.store});
  final Store store;

  factory UserStoreRes.fromJson(Map<String, dynamic> json) {
    return UserStoreRes(store: Store.fromJson(json['store']));
  }
}

class UserStoreRetrievePaymentProvidersRes {
  UserStoreRetrievePaymentProvidersRes({required this.paymentProviders});

  final List<PaymentProvider>? paymentProviders;

  factory UserStoreRetrievePaymentProvidersRes.fromJson(Map<String, dynamic> json) {
    List<PaymentProvider> paymentProviders = [];
    if (json['payment_providers'] != null) {
      json['payment_providers'].forEach((v) => paymentProviders.add(PaymentProvider.fromJson(v)));
    }
    return UserStoreRetrievePaymentProvidersRes(paymentProviders: paymentProviders.isEmpty ? null : paymentProviders);
  }
}

class UserStoreRetrieveTaxProvidersRes {
  UserStoreRetrieveTaxProvidersRes({required this.taxProviders});

  final List<TaxProvider>? taxProviders;

  factory UserStoreRetrieveTaxProvidersRes.fromJson(Map<String, dynamic> json) {
    List<TaxProvider> taxProviders = [];
    if (json['tax_providers'] != null) {
      json['tax_providers'].forEach((v) => taxProviders.add(TaxProvider.fromJson(v)));
    }
    return UserStoreRetrieveTaxProvidersRes(taxProviders: taxProviders.isEmpty ? null : taxProviders);
  }
}
