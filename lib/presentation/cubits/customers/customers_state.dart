part of 'customers_cubit.dart';

@freezed
class CustomersState with _$CustomersState {
  const factory CustomersState.initial() = _Initial;
  const factory CustomersState.loading() = _Loading;
  const factory CustomersState.customers( List<Customer> customer, int count) = _Customers;
  const factory CustomersState.error(Failure failure) = _Error;
}
