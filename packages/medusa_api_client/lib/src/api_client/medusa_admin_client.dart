library;

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'exports.dart';

/// {
///     "title": "Medusa Admin API",
///     "version": "2.0.0"
/// }
/// http://localhost:9000
/// https://api.medusajs.com
class MedusaAdminClient {
  MedusaAdminClient(this.dio, {this.baseUrl, this.errorLogger});

  final String? baseUrl;

  final Dio dio;

  final ParseErrorLogger? errorLogger;

  ApiKeysClient get apiKeysClient {
    return ApiKeysClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  CampaignsClient get campaignsClient {
    return CampaignsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  ClaimsClient get claimsClient {
    return ClaimsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  CollectionsClient get collectionsClient {
    return CollectionsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  CurrenciesClient get currenciesClient {
    return CurrenciesClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  CustomerGroupsClient get customerGroupsClient {
    return CustomerGroupsClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  CustomersClient get customersClient {
    return CustomersClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  DraftOrdersClient get draftOrdersClient {
    return DraftOrdersClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  ExchangesClient get exchangesClient {
    return ExchangesClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  FulfillmentProvidersClient get fulfillmentProvidersClient {
    return FulfillmentProvidersClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  FulfillmentSetsClient get fulfillmentSetsClient {
    return FulfillmentSetsClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  FulfillmentsClient get fulfillmentsClient {
    return FulfillmentsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  InventoryItemsClient get inventoryItemsClient {
    return InventoryItemsClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  InvitesClient get invitesClient {
    return InvitesClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  NotificationsClient get notificationsClient {
    return NotificationsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  OrderEditsClient get orderEditsClient {
    return OrderEditsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  OrdersClient get ordersClient {
    return OrdersClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  PaymentCollectionsClient get paymentCollectionsClient {
    return PaymentCollectionsClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  PaymentsClient get paymentsClient {
    return PaymentsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  PluginsClient get pluginsClient {
    return PluginsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  PriceListsClient get priceListsClient {
    return PriceListsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  PricePreferencesClient get pricePreferencesClient {
    return PricePreferencesClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  ProductCategoriesClient get productCategoriesClient {
    return ProductCategoriesClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  ProductTagsClient get productTagsClient {
    return ProductTagsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  ProductTypesClient get productTypesClient {
    return ProductTypesClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  ProductVariantsClient get productVariantsClient {
    return ProductVariantsClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  ProductsClient get productsClient {
    return ProductsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  PromotionsClient get promotionsClient {
    return PromotionsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  RefundReasonsClient get refundReasonsClient {
    return RefundReasonsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  RegionsClient get regionsClient {
    return RegionsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  ReservationsClient get reservationsClient {
    return ReservationsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  ReturnReasonsClient get returnReasonsClient {
    return ReturnReasonsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  ReturnsClient get returnsClient {
    return ReturnsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  SalesChannelsClient get salesChannelsClient {
    return SalesChannelsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  ShippingOptionsClient get shippingOptionsClient {
    return ShippingOptionsClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  ShippingProfilesClient get shippingProfilesClient {
    return ShippingProfilesClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  StockLocationsClient get stockLocationsClient {
    return StockLocationsClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  StoresClient get storesClient {
    return StoresClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  TaxProvidersClient get taxProvidersClient {
    return TaxProvidersClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  TaxRatesClient get taxRatesClient {
    return TaxRatesClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  TaxRegionsClient get taxRegionsClient {
    return TaxRegionsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  UploadsClient get uploadsClient {
    return UploadsClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  UsersClient get usersClient {
    return UsersClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }

  WorkflowsExecutionsClient get workflowsExecutionsClient {
    return WorkflowsExecutionsClient(
      dio,
      baseUrl: baseUrl,
      errorLogger: errorLogger,
    );
  }

  AuthClient get authClient {
    return AuthClient(dio, baseUrl: baseUrl, errorLogger: errorLogger);
  }
}
