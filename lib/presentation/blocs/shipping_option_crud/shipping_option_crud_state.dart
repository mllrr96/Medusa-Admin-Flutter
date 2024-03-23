part of 'shipping_option_crud_bloc.dart';

@freezed
class ShippingOptionCrudState with _$ShippingOptionCrudState {
  const factory ShippingOptionCrudState.initial() = _Initial;
  const factory ShippingOptionCrudState.loading() = _Loading;
  const factory ShippingOptionCrudState.deleted() = _Deleted;
  const factory ShippingOptionCrudState.shippingOption(
      ShippingOption shippingOption) = _ShippingOption;
  const factory ShippingOptionCrudState.shippingOptions(
      List<ShippingOption> shippingOptions, int count) = _ShippingOptions;
  const factory ShippingOptionCrudState.error(Failure failure) = _Error;
}
