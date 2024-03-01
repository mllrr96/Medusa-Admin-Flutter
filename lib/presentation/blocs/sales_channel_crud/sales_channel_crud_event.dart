part of 'sales_channel_crud_bloc.dart';

@freezed
class SalesChannelCrudEvent with _$SalesChannelCrudEvent {
  const factory SalesChannelCrudEvent.started() = _Started;
}
