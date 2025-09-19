import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:medusa_admin/src/core/utils/enums.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/screens/api_key_details/api_key_details_view.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/screens/publishable_api_keys/publishable_api_keys_view.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/screens/secret_api_keys/secret_api_keys_view.dart';
import 'package:medusa_admin/src/features/campaigns/presentation/screens/campaigns/campaigns_view.dart';
import 'package:medusa_admin/src/features/customers/data/models/pick_customer_req.dart';
import 'package:medusa_admin/src/features/groups/data/models/pick_groups_req.dart';
import 'package:medusa_admin/src/features/inventory/presentation/screens/inventory_details/inventory_details_view.dart';
import 'package:medusa_admin/src/features/inventory/presentation/screens/inventory_view.dart';
import 'package:medusa_admin/src/features/product_tags/presentation/screens/product_tag_details_view.dart';
import 'package:medusa_admin/src/features/product_tags/presentation/screens/add_update_product_tag_view.dart';
import 'package:medusa_admin/src/features/product_tags/presentation/screens/product_tags_view.dart';
import 'package:medusa_admin/src/features/product_types/presentation/screens/product_type_details_view.dart';
import 'package:medusa_admin/src/features/product_types/presentation/screens/add_update_product_type_view.dart';
import 'package:medusa_admin/src/features/product_types/presentation/screens/product_types_view.dart';
import 'package:medusa_admin/src/features/products/data/models/pick_products_req.dart';
import 'package:medusa_admin/src/features/products/data/models/product_variant_req.dart';
import 'package:medusa_admin/src/features/products/data/models/select_products_req.dart';
import 'package:medusa_admin/src/features/products/data/models/update_product_req.dart';
import 'package:medusa_admin/src/features/regions/data/models/pick_region_req.dart';
import 'package:medusa_admin/src/features/regions/data/models/select_country_req.dart';
import 'package:medusa_admin/src/features/app_settings/presentation/screens/app_settings/app_dev_settings.dart';
import 'package:medusa_admin/src/features/app_settings/presentation/screens/app_settings/app_settings_view.dart';
import 'package:medusa_admin/src/features/app_settings/presentation/screens/app_settings/ui_settings/app_bar_style_view.dart';
import 'package:medusa_admin/src/features/app_settings/presentation/widgets/app_update_view.dart';
import 'package:medusa_admin/src/features/auth/presentation/screens/auth/authentication_wrapper.dart';
import 'package:medusa_admin/src/features/collections/presentation/screens/collection_details/collection_details_view.dart';
import 'package:medusa_admin/src/features/collections/presentation/screens/collections/collections_view.dart';
import 'package:medusa_admin/src/features/collections/presentation/screens/create_collection/create_collection_view.dart';
import 'package:medusa_admin/src/features/customers/presentation/screens/add_update_customer/update_customer_details_view.dart';
import 'package:medusa_admin/src/features/customers/presentation/screens/customer_details/customer_details_view.dart';
import 'package:medusa_admin/src/features/customers/presentation/screens/customers/customers_view.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/screens/dashboard_view.dart';
import 'package:medusa_admin/src/features/promotions/presentation/screens/add_update_promotion/add_update_promotion_view.dart';
import 'package:medusa_admin/src/features/draft_orders/presentation/screens/create_draft_order/create_draft_order_view.dart';
import 'package:medusa_admin/src/features/groups/presentation/screens/add_update_group/create_update_group_view.dart';
import 'package:medusa_admin/src/features/pricing/presentation/screens/add_update_price_list/add_update_price_list_view.dart';
import 'package:medusa_admin/src/features/products/presentation/screens/categories/categories_view.dart';
import 'package:medusa_admin/src/features/api_keys/presentation/screens/add_update_api_key/add_update_api_key_view.dart';
import 'package:medusa_admin/src/features/regions/presentation/screens/add_update_region/add_update_region_view.dart';
import 'package:medusa_admin/src/features/reservations/presentation/screens/reservations_view.dart';
import 'package:medusa_admin/src/features/sales_channels/presentation/screens/add_update_sales_channel/add_update_sales_channel_view.dart';
import 'package:medusa_admin/src/features/shipping_option_types/presentation/screens/shipping_option_types_screen.dart';
import 'package:medusa_admin/src/features/shipping_profiles/presentation/screens/shipping_profiles_screen.dart';
import 'package:medusa_admin/src/features/tax_settings/presentation/screens/add_update_tax_rate/add_update_tax_rate_view.dart';
import 'package:medusa_admin/src/features/return_reasons/presentation/screens/create_update_return_reason/create_update_return_reason_view.dart';
import 'package:medusa_admin/src/features/currencies/presentation/screens/currencies/currencies_view.dart';
import 'package:medusa_admin/src/features/tax_settings/data/models/add_update_tax_rate_req.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:medusa_admin/src/features/auth/presentation/screens/auth/sign_in_view.dart';
import 'package:medusa_admin/src/features/auth/presentation/screens/auth/reset_password_view.dart';
import 'package:medusa_admin/src/features/auth/presentation/screens/auth/components/url_configure_view.dart';
import 'package:medusa_admin/src/features/auth/presentation/screens/splash/splash_view.dart';
import 'package:medusa_admin/src/features/dashboard/presentation/screens/main_app_wrapper.dart';
import 'package:medusa_admin/src/features/orders/presentation/screens/orders/orders_view.dart';
import 'package:medusa_admin/src/features/draft_orders/presentation/screens/draft_orders/draft_orders_view.dart';
import 'package:medusa_admin/src/features/products/presentation/screens/products/products_view.dart';
import 'package:medusa_admin/src/features/promotions/presentation/screens/promotions/promotions_view.dart';
import 'package:medusa_admin/src/features/pricing/presentation/screens/pricing_lists/pricing_view.dart';
import 'package:medusa_admin/src/features/store_settings/presentation/screens/store_settings/store_settings_view.dart';
import 'package:medusa_admin/src/features/products/presentation/screens/add_update_product/components/image_card.dart';
import 'package:medusa_admin/src/features/customers/presentation/widgets/pick_customer/pick_customer_view.dart';
import 'package:medusa_admin/src/features/groups/presentation/widgets/pick_groups_view.dart';
import 'package:medusa_admin/src/features/regions/presentation/widgets/pick_regions_view.dart';
import 'package:medusa_admin/src/features/orders/presentation/screens/transfer_order/transfer_order_view.dart';
import 'package:medusa_admin/src/features/promotions/presentation/screens/promotion_details/promotion_details_view.dart';
import 'package:medusa_admin/src/features/draft_orders/presentation/screens/draft_order_details/draft_order_details_view.dart';
import 'package:medusa_admin/src/features/groups/presentation/screens/group_details/group_details_view.dart';
import 'package:medusa_admin/src/features/orders/presentation/screens/order_details/order_details_view.dart';
import 'package:medusa_admin/src/features/pricing/presentation/screens/price_list_details/price_list_details_view.dart';
import 'package:medusa_admin/src/features/products/presentation/screens/product_details/product_details_view.dart';
import 'package:medusa_admin/src/features/regions/presentation/screens/region_details/region_details_view.dart';
import 'package:medusa_admin/src/features/sales_channels/presentation/screens/sales_channel_details/sales_channel_details_view.dart';
import 'package:medusa_admin/src/features/products/presentation/screens/add_update_product/add_update_product_view.dart';
import 'package:medusa_admin/src/features/orders/presentation/screens/order_details/components/order_create_fulfillment.dart';
import 'package:medusa_admin/src/features/products/presentation/screens/add_update_product/components/product_add_variant.dart';
import 'package:medusa_admin/src/features/store_settings/presentation/widgets/countries/country_view.dart';
import 'package:medusa_admin/src/features/products/presentation/widgets/pick_product_variants/pick_product_vairants_view.dart';
import 'package:medusa_admin/src/features/team/presentation/screens/invites/invites_view.dart';
import 'package:medusa_admin/src/features/app_settings/presentation/screens/app_settings/order_settings/order_settings_view.dart';
import 'package:medusa_admin/src/features/personal_information/presentation/screens/personal_information/personal_information_view.dart';
import 'package:medusa_admin/src/features/return_reasons/presentation/screens/return_reasons/return_reasons_view.dart';
import 'package:medusa_admin/src/features/sales_channels/presentation/screens/sales_channels/sales_channels_view.dart';
import 'package:medusa_admin/src/features/shipping/presentation/screens/shipping/shipping_view.dart';
import 'package:medusa_admin/src/features/store_details/presentation/screens/store_details/store_details_view.dart';
import 'package:medusa_admin/src/features/tax_settings/presentation/screens/tax_settings/tax_settings_select_region_view.dart';
import 'package:medusa_admin/src/features/tax_settings/presentation/screens/tax_settings/tax_settings_view.dart';
import 'package:medusa_admin/src/features/team/presentation/screens/team/team_view.dart';
import 'package:medusa_admin/src/features/groups/presentation/screens/groups/groups_view.dart';
import 'package:medusa_admin/src/features/products/presentation/widgets/pick_products_view.dart';
import 'package:medusa_admin/src/features/search/presentation/screens/search/medusa_search_view.dart';
import 'package:medusa_admin/src/features/regions/presentation/screens/regions/regions_view.dart';

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
    AutoRoute(page: InventoryRoute.page),
    AutoRoute(page: ReservationsRoute.page),
    AutoRoute(page: CustomersRoute.page),
    AutoRoute(page: GroupsRoute.page),
    AutoRoute(page: PromotionsRoute.page),
    AutoRoute(page: CampaignsRoute.page),
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
        AutoRoute(
            page: DashboardRoute.page,
            initial: true,
            children: dashboardChildren),
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

        // Promotions module
        AutoRoute(page: AddUpdatePromotionRoute.page),
        AutoRoute(page: PromotionDetailsRoute.page),
        // AutoRoute(page: PromotionConditionsRoute.page),
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
        AutoRoute(page: ShippingOptionTypesRoute.page),
        AutoRoute(page: ShippingProfilesRoute.page),

        AutoRoute(page: PersonalInformationRoute.page),
        AutoRoute(page: ProductTagsRoute.page),
        AutoRoute(page: AddUpdateProductTagRoute.page),
        AutoRoute(page: ProductTagDetailsRoute.page),
        AutoRoute(page: ProductTypesRoute.page),
        AutoRoute(page: AddUpdateProductTypeRoute.page),
        AutoRoute(page: ProductTypeDetailsRoute.page),

        AutoRoute(page: TaxSettingsRoute.page),
        AutoRoute(page: AddUpdateTaxRateRoute.page),
        AutoRoute(page: TaxSettingsSelectRegionRoute.page),

        AutoRoute(page: CurrenciesRoute.page),

        AutoRoute(page: SalesChannelsRoute.page),
        AutoRoute(page: AddUpdateSalesChannelRoute.page),
        AutoRoute(page: SalesChannelDetailsRoute.page),

        AutoRoute(page: SecretApiKeysRoute.page),
        AutoRoute(page: PublishableApiKeysRoute.page),
        AutoRoute(page: AddUpdateApiKeyRoute.page),
        AutoRoute(page: ApiKeyDetailsRoute.page),

        AutoRoute(page: TeamRoute.page),
        AutoRoute(page: InvitesRoute.page),
        AutoRoute(page: InventoryDetailsRoute.page),

        // App Settings
        AutoRoute(page: OrderSettingsRoute.page),
        AutoRoute(page: AppDevSettingsRoute.page),
        AutoRoute(page: AppBarStyleRoute.page),
      ]),
    ];
  }
}