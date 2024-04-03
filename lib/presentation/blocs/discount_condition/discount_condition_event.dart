part of 'discount_condition_bloc.dart';

@freezed
class DiscountConditionEvent with _$DiscountConditionEvent {
  const factory DiscountConditionEvent.loadProducts({Map<String, dynamic>? queryParameters}) = _LoadProducts;
  const factory DiscountConditionEvent.loadTypes({Map<String, dynamic>? queryParameters}) = _LoadTypes;
  const factory DiscountConditionEvent.loadCollections({Map<String, dynamic>? queryParameters}) = _LoadCollections;
  const factory DiscountConditionEvent.loadTags({Map<String, dynamic>? queryParameters}) = _LoadTags;
  const factory DiscountConditionEvent.loadGroups({Map<String, dynamic>? queryParameters}) = _LoadGroups;
}
