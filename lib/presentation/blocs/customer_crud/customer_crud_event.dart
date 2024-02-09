part of 'customer_crud_bloc.dart';

@freezed
class CustomerCrudEvent with _$CustomerCrudEvent {
  const factory CustomerCrudEvent.create(UserCreateCustomerReq userCreateCustomerReq) = _Create;
  const factory CustomerCrudEvent.update(String id,
      UserUpdateCustomerReq userUpdateCustomerReq) = _Update;
  const factory CustomerCrudEvent.delete(String id) = _Delete;
  const factory CustomerCrudEvent.load(String id) = _Load;
}
