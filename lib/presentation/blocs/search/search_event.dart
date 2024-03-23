part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.searchProducts({Map<String,dynamic>? queryParameters}) = _SearchProducts;
  const factory SearchEvent.searchOrders({Map<String,dynamic>? queryParameters}) = _SearchOrders;
  const factory SearchEvent.searchDrafts({Map<String,dynamic>? queryParameters}) = _SearchDrafts;
  const factory SearchEvent.searchCollections({Map<String,dynamic>? queryParameters}) = _SearchCollections;
  const factory SearchEvent.searchCustomers({Map<String,dynamic>? queryParameters}) = _SearchCustomers;
  const factory SearchEvent.searchGroups({Map<String,dynamic>? queryParameters}) = _SearchGroups;
  const factory SearchEvent.searchGiftCards({Map<String,dynamic>? queryParameters}) = _SearchGiftCards;
  const factory SearchEvent.searchDiscounts({Map<String,dynamic>? queryParameters}) = _SearchDiscounts;
  const factory SearchEvent.searchPriceLists({Map<String,dynamic>? queryParameters}) = _SearchPriceLists;
  const factory SearchEvent.searchTags({Map<String,dynamic>? queryParameters}) = _SearchTags;
  const factory SearchEvent.searchRegions({Map<String,dynamic>? queryParameters}) = _SearchRegions;
  const factory SearchEvent.searchSalesChannels({Map<String,dynamic>? queryParameters}) = _SearchSalesChannels;
}
