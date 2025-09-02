import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/models/add_update_tax_rate_req.dart';
import 'package:medusa_admin/data/models/pick_customer_req.dart';
import 'package:medusa_admin/data/models/pick_groups_req.dart';
import 'package:medusa_admin/data/models/pick_products_req.dart';
import 'package:medusa_admin/data/models/pick_region_req.dart';
import 'package:medusa_admin/data/models/product_variant_req.dart';
import 'package:medusa_admin/data/models/select_country_req.dart';
import 'package:medusa_admin/data/models/select_products_req.dart';
import 'package:medusa_admin/data/models/update_product_req.dart';
import 'package:medusa_admin/presentation/views/auth/authentication_wrapper.dart';
import 'package:medusa_admin/presentation/views/categories/categories_view.dart';
import 'package:medusa_admin/presentation/views/create_update_custom_gift_card/create_update_custom_gift_card_view.dart';
import 'package:medusa_admin/presentation/views/main_app_wrapper.dart';
import 'package:medusa_admin/presentation/views/order_details/components/order_create_fulfillment.dart';
import 'package:medusa_admin/presentation/views/order_details/order_details_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/add_update_tax_rate/add_update_tax_rate_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/store_settings_view.dart';
import 'package:medusa_admin/presentation/views/add_update_customer/update_customer_details_view.dart';
import 'package:medusa_admin/presentation/views/add_update_discount/add_update_discount_view.dart';
import 'package:medusa_admin/presentation/views/add_update_group/create_update_group_view.dart';
import 'package:medusa_admin/presentation/views/add_update_price_list/add_update_price_list_view.dart';
import 'package:medusa_admin/presentation/views/add_update_product/components/image_card.dart';
import 'package:medusa_admin/presentation/views/add_update_product/components/product_add_variant.dart';
import 'package:medusa_admin/presentation/views/add_update_product/add_update_product_view.dart';
import 'package:medusa_admin/presentation/views/app_settings/app_dev_settings.dart';
import 'package:medusa_admin/presentation/views/app_settings/order_settings/order_settings_view.dart';
import 'package:medusa_admin/presentation/views/app_settings/ui_settings/app_bar_style_view.dart';
import 'package:medusa_admin/presentation/views/app_settings/app_settings_view.dart';
import 'package:medusa_admin/presentation/views/auth/components/url_configure_view.dart';
import 'package:medusa_admin/presentation/views/auth/reset_password_view.dart';
import 'package:medusa_admin/presentation/views/auth/sign_in_view.dart';
import 'package:medusa_admin/presentation/views/collection_details/collection_details_view.dart';
import 'package:medusa_admin/presentation/views/collections/collections_view.dart';
import 'package:medusa_admin/presentation/views/create_collection/create_collection_view.dart';
import 'package:medusa_admin/presentation/views/create_draft_order/create_draft_order_view.dart';
import 'package:medusa_admin/presentation/views/custom_gift_cards/custom_gift_cards_view.dart';
import 'package:medusa_admin/presentation/views/customer_details/customer_details_view.dart';
import 'package:medusa_admin/presentation/views/customers/customers_view.dart';
import 'package:medusa_admin/presentation/views/dashboard_view.dart';
import 'package:medusa_admin/presentation/views/discount_details/discount_details_view.dart';
import 'package:medusa_admin/presentation/views/discounts/discounts_view.dart';
import 'package:medusa_admin/presentation/views/draft_order_details/draft_order_details_view.dart';
import 'package:medusa_admin/presentation/views/draft_orders/draft_orders_view.dart';
import 'package:medusa_admin/presentation/views/group_details/group_details_view.dart';
import 'package:medusa_admin/presentation/views/groups/groups_view.dart';
import 'package:medusa_admin/presentation/views/orders/orders_view.dart';
import 'package:medusa_admin/presentation/views/price_list_details/price_list_details_view.dart';
import 'package:medusa_admin/presentation/views/pricing_lists/pricing_view.dart';
import 'package:medusa_admin/presentation/views/product_details/product_details_view.dart';
import 'package:medusa_admin/presentation/views/product_gift_cards/product_gift_cards_view.dart';
import 'package:medusa_admin/presentation/views/products/products_view.dart';
import 'package:medusa_admin/presentation/views/search/medusa_search_view.dart';
import 'package:medusa_admin/presentation/views/splash/splash_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/add_update_api_key/add_update_api_key_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/add_update_region/add_update_region_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/add_update_sales_channel/add_update_sales_channel_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/api_key_management/api_key_management_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/create_update_return_reason/create_update_return_reason_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/currencies/currencies_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/invites/invites_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/personal_information/personal_information_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/region_details/region_details_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/regions/regions_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/return_reasons/return_reasons_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/sales_channel_details/sales_channel_details_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/sales_channels/sales_channels_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/shipping/shipping_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/store_details/store_details_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/tax_settings/tax_settings_select_region_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/tax_settings/tax_settings_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/team/team_view.dart';
import 'package:medusa_admin/presentation/views/transfer_order/transfer_order_view.dart';
import 'package:medusa_admin/presentation/widgets/app_update_view.dart';
import 'package:medusa_admin/presentation/widgets/countries/country_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_customer/pick_customer_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_groups_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_product_variants/pick_product_vairants_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_products_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_regions_view.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart' hide UpdateProductReq;

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Screen|Wrapper|Page,Route')
class AppRouter extends RootStackRouter {
  // @override
  // void onNavigation(NavigationResolver resolver, StackRouter router) {
  //   if (resolver.routeName == SignInRoute.name ||
  //       resolver.routeName == SplashRoute.name ||
  //       resolver.routeName == ResetPasswordRoute.name ||
  //       resolver.routeName == UrlConfigureRoute.name ||
  //       resolver.routeName == AppUpdateRoute.name ||
  //       AuthPreferenceService.isAuthenticatedGetter) {
  //     resolver.next();
  //   } else {
  //     Fluttertoast.showToast(msg: 'Session expired, please login again');
  //     resolver.redirect(
  //         SignInRoute(onResult: (didLogin) => resolver.next(didLogin)));
  //   }
  // }

  @override
  List<AutoRouteGuard> get guards => [];

  List<AutoRoute> dashboardChildren = [
    AutoRoute(page: OrdersRoute.page),
    AutoRoute(page: DraftOrdersRoute.page),
    AutoRoute(page: ProductsRoute.page),
    AutoRoute(page: CategoriesRoute.page),
    AutoRoute(page: CollectionsRoute.page),
    AutoRoute(page: CustomersRoute.page),
    AutoRoute(page: GroupsRoute.page),
    AutoRoute(page: DiscountsRoute.page),
    AutoRoute(page: ProductGiftCardsRoute.page),
    AutoRoute(page: PricingRoute.page),
    AutoRoute(page: StoreSettingsRoute.page),
    AutoRoute(page: AppSettingsRoute.page),
  ];

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: SplashRoute.page, initial: true),

      // Auth module
      AutoRoute(page: AuthenticationRoute.page, children: [
        AutoRoute(page: SignInRoute.page, initial: true),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(page: UrlConfigureRoute.page),
      ]),

      AutoRoute(page: MainAppRoute.page, children: [
        AutoRoute(page: DashboardRoute.page, children: dashboardChildren),
        AutoRoute(page: PickProductsRoute.page),
        AutoRoute(page: SelectCountryRoute.page),
        AutoRoute(page: PickGroupsRoute.page),
        AutoRoute(page: PickRegionsRoute.page),
        // AutoRoute(page: ActivityRoute.page),
        AutoRoute(page: AppUpdateRoute.page),

        // collections module
        AutoRoute(page: CollectionDetailsRoute.page),
        AutoRoute(page: CreateCollectionRoute.page),

        // customers module
        AutoRoute(page: AddUpdateCustomerRoute.page),
        AutoRoute(page: CustomerDetailsRoute.page),
        AutoRoute(page: TransferOrderRoute.page),

        // Discount module
        AutoRoute(page: AddUpdateDiscountRoute.page),
        AutoRoute(page: DiscountDetailsRoute.page),
        // AutoRoute(page: DiscountConditionsRoute.page),
        // AutoRoute(page: UpdateConditionRoute.page),
        // AutoRoute(page: ConditionProductRoute.page),
        // AutoRoute(page: ConditionCustomerGroupRoute.page),
        // AutoRoute(page: ConditionTagRoute.page),
        // AutoRoute(page: ConditionTypeRoute.page),
        // AutoRoute(page: ConditionCollectionRoute.page),

        // Draft orders module
        AutoRoute(page: CreateDraftOrderRoute.page, fullscreenDialog: true),
        AutoRoute(page: DraftOrderDetailsRoute.page),
        AutoRoute(page: PickCustomerRoute.page),
        AutoRoute(page: PickProductVariantsRoute.page),

        // Gift cards module
        AutoRoute(page: CreateUpdateCustomGiftCardRoute.page),
        AutoRoute(page: CustomGiftCardsRoute.page),

        // Groups module
        AutoRoute(page: GroupDetailsRoute.page),
        AutoRoute(page: CreateUpdateGroupRoute.page),

        // Medusa Search
        AutoRoute(page: MedusaSearchRoute.page),

        // Orders module
        AutoRoute(page: OrderDetailsRoute.page),
        // AutoRoute(page: AddUpdateOrderEditRoute.page),
        AutoRoute(page: OrderCreateFulfillmentRoute.page),

        // Pricing module
        // AutoRoute(page: AddUpdateVariantsPriceRoute.page),
        AutoRoute(page: AddUpdatePriceListRoute.page),
        AutoRoute(page: PriceListDetailsRoute.page),

        // Products module
        AutoRoute(page: AddUpdateProductRoute.page),
        AutoRoute(page: ProductDetailsRoute.page, fullscreenDialog: true),
        AutoRoute(page: ImagePreviewRoute.page),
        AutoRoute(page: ProductAddVariantRoute.page),
        // AutoRoute(page: ImportProductsRoute.page),

        // Store settings
        AutoRoute(page: RegionsRoute.page),
        AutoRoute(page: RegionDetailsRoute.page),
        AutoRoute(page: AddUpdateRegionRoute.page),
        // AutoRoute(page: AddUpdateShippingOptionRoute.page),

        AutoRoute(page: StoreDetailsRoute.page),

        AutoRoute(page: ReturnReasonsRoute.page),
        AutoRoute(page: CreateUpdateReturnReasonRoute.page),

        AutoRoute(page: PersonalInformationRoute.page),

        AutoRoute(page: TaxSettingsRoute.page),
        AutoRoute(page: AddUpdateTaxRateRoute.page),
        AutoRoute(page: TaxSettingsSelectRegionRoute.page),

        AutoRoute(page: CurrenciesRoute.page),

        AutoRoute(page: SalesChannelsRoute.page),
        AutoRoute(page: AddUpdateSalesChannelRoute.page),
        AutoRoute(page: SalesChannelDetailsRoute.page),

        AutoRoute(page: ApiKeyManagementRoute.page),
        AutoRoute(page: AddUpdateApiKeyRoute.page),

        AutoRoute(page: TeamRoute.page),
        AutoRoute(page: InvitesRoute.page),

        // App Settings
        AutoRoute(page: OrderSettingsRoute.page),
        AutoRoute(page: AppDevSettingsRoute.page),
        AutoRoute(page: AppBarStyleRoute.page),
      ]),
    ];
  }
}
