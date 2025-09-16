part of 'promotion_condition_bloc.dart';

@freezed
sealed class PromotionConditionEvent with _$PromotionConditionEvent {
  const factory PromotionConditionEvent.loadProducts(
      {Map<String, dynamic>? queryParameters}) = _LoadProducts;
  const factory PromotionConditionEvent.loadTypes(
      {Map<String, dynamic>? queryParameters}) = _LoadTypes;
  const factory PromotionConditionEvent.loadCollections(
      {Map<String, dynamic>? queryParameters}) = _LoadCollections;
  const factory PromotionConditionEvent.loadTags(
      {Map<String, dynamic>? queryParameters}) = _LoadTags;
  const factory PromotionConditionEvent.loadGroups(
      {Map<String, dynamic>? queryParameters}) = _LoadGroups;
}
