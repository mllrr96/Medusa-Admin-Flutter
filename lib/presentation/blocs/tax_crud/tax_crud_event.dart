part of 'tax_crud_bloc.dart';

@freezed
class TaxCrudEvent with _$TaxCrudEvent {
  const factory TaxCrudEvent.load(String id) = _Load;
  const factory TaxCrudEvent.create(UserCreateTaxRateReq userCreateTaxRateReq) =
      _Create;
  const factory TaxCrudEvent.delete(String id) = _Delete;
  const factory TaxCrudEvent.update(
      String id, UserUpdateTaxRateReq userUpdateTaxRateReq) = _Update;
  const factory TaxCrudEvent.loadAll({Map<String, dynamic>? queryParameters}) =
      _LoadAll;
}
