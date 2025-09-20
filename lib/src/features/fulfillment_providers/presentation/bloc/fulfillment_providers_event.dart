
part of 'fulfillment_providers_bloc.dart';

@freezed
class FulfillmentProvidersEvent with _$FulfillmentProvidersEvent {
  const factory FulfillmentProvidersEvent.load({Map<String,dynamic>? query}) = _Load;
  const factory FulfillmentProvidersEvent.loadOptions(String id) = _LoadOptions;
}
