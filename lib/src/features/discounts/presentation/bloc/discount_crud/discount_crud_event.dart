part of 'discount_crud_bloc.dart';

@freezed
class DiscountCrudEvent with _$DiscountCrudEvent {
  const factory DiscountCrudEvent.load(String id) = _Load;
  const factory DiscountCrudEvent.loadAll({Map<String, dynamic>? queryParameters}) = _LoadAll;
  const factory DiscountCrudEvent.update(
      String id, PostPromotionReq payload) = _Update;
  const factory DiscountCrudEvent.create(
      PostPromotionReq payload) = _Create;
  const factory DiscountCrudEvent.delete(String discountId) = _Delete;
  // const factory DiscountCrudEvent.addCondition(
  //         String discountId, CreateConditionReq userCreateConditionReq) =
  //     _AddCondition;
  // const factory DiscountCrudEvent.removeCondition(
  //     String discountId, String conditionId) = _RemoveCondition;
  const factory DiscountCrudEvent.addItemsToCondition(
    String discountId,
    String conditionId,
    List<String> itemIds,
  ) = _AddItemsToCondition;
  const factory DiscountCrudEvent.removeItemsFromCondition(
    String discountId,
    String conditionId,
    List<String> itemIds,
  ) = _RemoveItemsFromCondition;
}
