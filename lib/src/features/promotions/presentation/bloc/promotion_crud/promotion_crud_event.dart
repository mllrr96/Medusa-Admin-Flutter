part of 'promotion_crud_bloc.dart';

@freezed
class PromotionCrudEvent with _$PromotionCrudEvent {
  const factory PromotionCrudEvent.load(String id) = _Load;
  const factory PromotionCrudEvent.loadAll(
      {Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory PromotionCrudEvent.update(String id, PostPromotionReq payload) =
      _Update;
  const factory PromotionCrudEvent.create(PostPromotionReq payload) = _Create;
  const factory PromotionCrudEvent.delete(String discountId) = _Delete;
  // const factory PromotionCrudEvent.addCondition(
  //         String discountId, CreateConditionReq userCreateConditionReq) =
  //     _AddCondition;
  // const factory PromotionCrudEvent.removeCondition(
  //     String discountId, String conditionId) = _RemoveCondition;
  const factory PromotionCrudEvent.addItemsToCondition(
    String discountId,
    String conditionId,
    List<String> itemIds,
  ) = _AddItemsToCondition;
  const factory PromotionCrudEvent.removeItemsFromCondition(
    String discountId,
    String conditionId,
    List<String> itemIds,
  ) = _RemoveItemsFromCondition;
}
