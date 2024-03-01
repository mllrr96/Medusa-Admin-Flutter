part of 'sales_channel_crud_bloc.dart';

@freezed
class SalesChannelCrudEvent with _$SalesChannelCrudEvent {
  const factory SalesChannelCrudEvent.load(String id) = _Load;
  const factory SalesChannelCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory SalesChannelCrudEvent.create(
      UserSalesChannelCreateReq userSalesChannelCreateReq) = _Create;
  const factory SalesChannelCrudEvent.update(
      String id, UserSalesChannelUpdateReq userSalesChannelUpdateReq) = _Update;
  const factory SalesChannelCrudEvent.delete(String id) = _Delete;
  const factory SalesChannelCrudEvent.deleteProducts(
      String id, List<String> productIds) = _DeleteProducts;
  const factory SalesChannelCrudEvent.addProducts(
      String id, List<String> productIds) = _AddProducts;
}
