part of 'customer_crud_bloc.dart';

@freezed
class CustomerCrudEvent with _$CustomerCrudEvent {
  const factory CustomerCrudEvent.create(CreateCustomerReq userCreateCustomerReq) = _Create;
  const factory CustomerCrudEvent.update(String id,
      UpdateCustomerReq userUpdateCustomerReq) = _Update;
  const factory CustomerCrudEvent.delete(String id) = _Delete;
  const factory CustomerCrudEvent.load(String id) = _Load;
  const factory CustomerCrudEvent.loadAll({Map<String,dynamic>? queryParameters}) = _LoadAll;
}
