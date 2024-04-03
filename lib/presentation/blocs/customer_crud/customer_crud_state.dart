part of 'customer_crud_bloc.dart';

@freezed
class CustomerCrudState with _$CustomerCrudState {
  const factory CustomerCrudState.initial() = _Initial;
  const factory CustomerCrudState.loading() = _Loading;
  const factory CustomerCrudState.customer(Customer customer) = _Customer;
  const factory CustomerCrudState.customers(List<Customer> customers, int count) = _Customers;
  const factory CustomerCrudState.deleted() = _Deleted;
  const factory CustomerCrudState.error(Failure failure) = _Error;
}
