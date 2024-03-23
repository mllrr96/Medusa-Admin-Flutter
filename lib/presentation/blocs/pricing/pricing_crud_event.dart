part of 'pricing_crud_bloc.dart';

@freezed
class PricingCrudEvent with _$PricingCrudEvent {
  const factory PricingCrudEvent.create(
      UserCreatePriceListReq userCreatePriceListReq) = _Create;
  const factory PricingCrudEvent.update(
      String id, UserUpdatePriceListReq userUpdatePriceListReq) = _Update;
  const factory PricingCrudEvent.updatePrices(
      String id, UserUpdatePricesReq userUpdatePricesReq) = _UpdatePrices;
  const factory PricingCrudEvent.load(String id) = _Load;
  const factory PricingCrudEvent.loadProducts(String id) = _LoadProducts;
  const factory PricingCrudEvent.delete(String id) = _Delete;
  const factory PricingCrudEvent.deleteProduct(String id, String productId) =
      _DeleteProduct;
  const factory PricingCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
}
