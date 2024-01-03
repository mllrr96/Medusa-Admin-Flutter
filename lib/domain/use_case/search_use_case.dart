import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class SearchUseCase {
  final ProductsRepository _productsRepository =
      getIt<MedusaAdmin>().productsRepository;
  final OrdersRepository _ordersRepository =
      getIt<MedusaAdmin>().orderRepository;
  final DraftOrderRepository _draftOrderRepository =
      getIt<MedusaAdmin>().draftOrderRepository;
  final CollectionRepository _collectionRepository =
      getIt<MedusaAdmin>().collectionRepository;
  final CustomerRepository _customerRepository =
      getIt<MedusaAdmin>().customerRepository;
  final CustomerGroupRepository _customerGroupRepository =
      getIt<MedusaAdmin>().customerGroupRepository;
  final GiftCardRepository _giftCardRepository =
      getIt<MedusaAdmin>().giftCardRepository;
  final DiscountRepository _discountRepository =
      getIt<MedusaAdmin>().discountRepository;
  final PriceListRepository _priceListRepository =
      getIt<MedusaAdmin>().priceListRepository;
  final ProductTagRepository _tagRepository =
      getIt<MedusaAdmin>().productTagRepository;
  final RegionsRepository _regionsRepository =
      getIt<MedusaAdmin>().regionsRepository;
  final SalesChannelRepository _salesChannelRepository =
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
