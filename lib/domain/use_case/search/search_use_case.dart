import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class SearchUseCase {
  ProductsRepository get _productsRepository =>
      getIt<MedusaAdmin>().productsRepository;
  OrdersRepository get _ordersRepository =>
      getIt<MedusaAdmin>().orderRepository;
  DraftOrderRepository get _draftOrderRepository =>
      getIt<MedusaAdmin>().draftOrderRepository;
  CollectionRepository get _collectionRepository =>
      getIt<MedusaAdmin>().collectionRepository;
  CustomerRepository get _customerRepository =>
      getIt<MedusaAdmin>().customerRepository;
  CustomerGroupRepository get _customerGroupRepository =>
      getIt<MedusaAdmin>().customerGroupRepository;
  GiftCardRepository get _giftCardRepository =>
      getIt<MedusaAdmin>().giftCardRepository;
  DiscountRepository get _discountRepository =>
      getIt<MedusaAdmin>().discountRepository;
  PriceListRepository get _priceListRepository =>
      getIt<MedusaAdmin>().priceListRepository;
  ProductTagRepository get _tagRepository =>
      getIt<MedusaAdmin>().productTagRepository;
  RegionsRepository get _regionsRepository =>
      getIt<MedusaAdmin>().regionsRepository;
  SalesChannelRepository get _salesChannelRepository =>
      getIt<MedusaAdmin>().salesChannelRepository;

  static SearchUseCase get instance => getIt<SearchUseCase>();

  Future<Result<UserSalesChannelRetrieveAllRes, Failure>> fetchSalesChannels({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _salesChannelRepository.retrieveAll(
          queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserRetrieveProductTagsRes, Failure>> fetchTags({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _tagRepository.retrieveProductTags(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserProductsListRes, Failure>> fetchProducts({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserGiftCardsRes, Failure>> fetchGiftCards({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _giftCardRepository.retrieveGiftCards(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserRetrieveCustomerGroupsRes, Failure>> fetchCustomerGroups(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.retrieveCustomerGroups(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserPriceListsRes, Failure>> fetchPriceLists({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _priceListRepository.retrievePriceLists(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserRegionsRes, Failure>> fetchRegions(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _regionsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<CustomersRes, Failure>> fetchCustomers(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerRepository.retrieveCustomers(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserRetrieveOrdersRes, Failure>> fetchOrders(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _ordersRepository.retrieveOrders(
          queryParameters: queryParameters);
      if (result?.orders == null) {
        return Error(Failure.from(result));
      } else {
        return Success(result!);
      }
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserCollectionsRes, Failure>> fetchCollections({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _collectionRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserRetrieveDiscountsRes, Failure>> fetchDiscounts(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _discountRepository.retrieveDiscounts(
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserDraftOrdersRes, Failure>> fetchDraftOrders({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _draftOrderRepository.retrieveDraftOrders(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
