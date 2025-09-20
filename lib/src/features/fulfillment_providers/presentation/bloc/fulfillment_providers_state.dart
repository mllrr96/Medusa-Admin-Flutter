
part of 'fulfillment_providers_bloc.dart';

@freezed
class FulfillmentProvidersState with _$FulfillmentProvidersState {
  const factory FulfillmentProvidersState.initial() = _Initial;
  const factory FulfillmentProvidersState.loading() = _Loading;
  const factory FulfillmentProvidersState.fulfillmentProviders(FulfillmentProviderListRes fulfillmentProviders) = _FulfillmentProviders;
  const factory FulfillmentProvidersState.fulfillmentOptions(FulfillmentProviderOptionListRes fulfillmentOptions) = _FulfillmentOptions;
  const factory FulfillmentProvidersState.error(MedusaError error) = _Error;
}
