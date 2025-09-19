part of 'shipping_option_types_bloc.dart';

@freezed
class ShippingOptionTypesState with _$ShippingOptionTypesState {
  const factory ShippingOptionTypesState.initial() = _Initial;
  const factory ShippingOptionTypesState.loading() = _Loading;
  const factory ShippingOptionTypesState.optionTypes(ShippingOptionTypeListResponse optionTypes) = _OptionTypes;
  const factory ShippingOptionTypesState.option(ShippingOptionType option) = _Option;
  const factory ShippingOptionTypesState.deleted() = _Deleted;
  const factory ShippingOptionTypesState.error(MedusaError error) = _Error;
}
