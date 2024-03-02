import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin/data/models/discount_condition_req.dart';
import 'package:medusa_admin/data/models/shipping_option_req.dart';
import 'package:medusa_admin/data/models/update_condition_req.dart';
import 'package:medusa_admin/data/models/update_product_req.dart';
import 'package:medusa_admin/data/service/auth_preference_service.dart';
import 'package:medusa_admin/presentation/modules/activity_module/activity_view.dart';
import 'package:medusa_admin/presentation/modules/categories/views/categories_view.dart';
import 'package:medusa_admin/presentation/modules/gift_cards_module/create_update_custom_gift_card/views/create_update_custom_gift_card_view.dart';
import 'package:medusa_admin/presentation/modules/orders_module/order_details/components/add_update_order_edit/views/add_update_order_edit_view.dart';
import 'package:medusa_admin/presentation/modules/orders_module/order_details/components/order_create_fulfillment.dart';
import 'package:medusa_admin/presentation/modules/orders_module/order_details/views/order_details_view.dart';
import 'package:medusa_admin/presentation/modules/products_module/import_products/import_products.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/return_reasons_module/create_update_return_reason/views/create_update_return_reason_view.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/return_reasons_module/return_reasons/views/return_reasons_view.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/store_settings_view.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/tax_settings_module/add_update_tax_rate/controllers/add_update_tax_rate_controller.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/tax_settings_module/add_update_tax_rate/views/add_update_tax_rate_view.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/tax_settings_module/tax_settings/views/tax_settings_select_region_view.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/tax_settings_module/tax_settings/views/tax_settings_view.dart';
import 'package:medusa_admin/presentation/modules/settings_module/store_settings/team/views/team_view.dart';
import 'package:medusa_admin/presentation/views/add_update_customer/update_customer_details_view.dart';
import 'package:medusa_admin/presentation/views/add_update_discount/add_update_discount_view.dart';
import 'package:medusa_admin/presentation/views/add_update_group/create_update_group_view.dart';
import 'package:medusa_admin/presentation/views/add_update_price_list/add_update_price_list_view.dart';
import 'package:medusa_admin/presentation/views/add_update_price_list/components/product_price_list.dart';
import 'package:medusa_admin/presentation/views/add_update_product/components/image_card.dart';
import 'package:medusa_admin/presentation/views/add_update_product/components/product_add_variant.dart';
import 'package:medusa_admin/presentation/views/add_update_product/views/add_update_product_view.dart';
import 'package:medusa_admin/presentation/views/app_settings/app_dev_settings.dart';
import 'package:medusa_admin/presentation/views/app_settings/order_settings/order_settings_view.dart';
import 'package:medusa_admin/presentation/views/app_settings/ui_settings/app_bar_style_view.dart';
import 'package:medusa_admin/presentation/views/app_settings/views/app_settings_view.dart';
import 'package:medusa_admin/presentation/views/auth/components/url_configure_view.dart';
import 'package:medusa_admin/presentation/views/auth/reset_password_view.dart';
import 'package:medusa_admin/presentation/views/auth/sign_in_view.dart';
import 'package:medusa_admin/presentation/views/collection_details/collection_details_view.dart';
import 'package:medusa_admin/presentation/views/collections/collections_view.dart';
import 'package:medusa_admin/presentation/views/create_collection/create_collection_view.dart';
import 'package:medusa_admin/presentation/views/create_draft_order/components/pick_customer/controllers/pick_customer_controller.dart';
import 'package:medusa_admin/presentation/views/create_draft_order/components/pick_customer/views/pick_customer_view.dart';
import 'package:medusa_admin/presentation/views/create_draft_order/components/pick_product_variants/controllers/pick_product_variants_controller.dart';
import 'package:medusa_admin/presentation/views/create_draft_order/components/pick_product_variants/views/pick_product_vairants_view.dart';
import 'package:medusa_admin/presentation/views/create_draft_order/create_draft_order_view.dart';
import 'package:medusa_admin/presentation/views/custom_gift_cards/custom_gift_cards_view.dart';
import 'package:medusa_admin/presentation/views/customer_details/customer_details_view.dart';
import 'package:medusa_admin/presentation/views/customers/customers_view.dart';
import 'package:medusa_admin/presentation/views/dashboard_view.dart';
import 'package:medusa_admin/presentation/views/discount_conditions/components/index.dart';
import 'package:medusa_admin/presentation/views/discount_conditions/views/discount_conditions_view.dart';
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
import 'package:medusa_admin/presentation/views/store_settings/add_update_shipping_option/add_update_shipping_option_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/api_key_management/api_key_management_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/currencies/currencies_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/personal_information/personal_information_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/region_details/region_details_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/regions/regions_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/sales_channel_details/sales_channel_details_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/sales_channels/sales_channels_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/shipping/shipping_view.dart';
import 'package:medusa_admin/presentation/views/store_settings/store_details/store_details_view.dart';
import 'package:medusa_admin/presentation/views/transfer_order/transfer_order_view.dart';
import 'package:medusa_admin/presentation/views/update_discount_condition/update_condition_view.dart';
import 'package:medusa_admin/presentation/widgets/app_update_view.dart';
import 'package:medusa_admin/presentation/widgets/countries/controller/country_controller.dart';
import 'package:medusa_admin/presentation/widgets/countries/view/country_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_groups/controllers/pick_groups_controller.dart';
import 'package:medusa_admin/presentation/widgets/pick_groups/views/pick_groups_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_products/controllers/pick_products_controller.dart';
import 'package:medusa_admin/presentation/widgets/pick_products/views/pick_products_view.dart';
import 'package:medusa_admin/presentation/widgets/pick_regions/controllers/pick_regions_controller.dart';
import 'package:medusa_admin/presentation/widgets/pick_regions/views/pick_regions_view.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (resolver.routeName == SignInRoute.name ||
        resolver.routeName == SplashRoute.name ||
        resolver.routeName == ResetPasswordRoute.name ||
        resolver.routeName == UrlConfigureRoute.name ||
        resolver.routeName == AppUpdateRoute.name ||
        AuthPreferenceService.isAuthenticatedGetter) {
      resolver.next();
    } else {
      Fluttertoast.showToast(msg: 'Session expired, please login again');
      resolver.redirect(
          SignInRoute(onResult: (didLogin) => resolver.next(didLogin)));
    }
  }

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
      AutoRoute(page: DashboardRoute.page, children: dashboardChildren),
      AutoRoute(page: PickProductsRoute.page),
      AutoRoute(page: SelectCountryRoute.page),
      AutoRoute(page: PickGroupsRoute.page),
      AutoRoute(page: PickRegionsRoute.page),
      AutoRoute(page: ActivityRoute.page),
      AutoRoute(page: AppUpdateRoute.page),

      // collections module
      AutoRoute(page: CollectionDetailsRoute.page),
      AutoRoute(page: CreateCollectionRoute.page),

      // customers module
      AutoRoute(page: AddUpdateCustomerRoute.page),
      AutoRoute(page: CustomerDetailsRoute.page),
      AutoRoute(page: TransferOrderRoute.page),
      // Auth module
      AutoRoute(page: SignInRoute.page),
      AutoRoute(page: ResetPasswordRoute.page),
      AutoRoute(page: UrlConfigureRoute.page),
      // Discount module
      AutoRoute(page: AddUpdateDiscountRoute.page),
      AutoRoute(page: DiscountDetailsRoute.page),
      AutoRoute(page: DiscountConditionsRoute.page),
      AutoRoute(page: UpdateConditionRoute.page),
      AutoRoute(page: ConditionProductRoute.page),
      AutoRoute(page: ConditionCustomerGroupRoute.page),
      AutoRoute(page: ConditionTagRoute.page),
      AutoRoute(page: ConditionTypeRoute.page),
      AutoRoute(page: ConditionCollectionRoute.page),

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
      AutoRoute(page: AddUpdateOrderEditRoute.page),
      AutoRoute(page: OrderCreateFulfillmentRoute.page),

      // Pricing module
      AutoRoute(page: AddUpdateVariantsPriceRoute.page),
      AutoRoute(page: AddUpdatePriceListRoute.page),
      AutoRoute(page: PriceListDetailsRoute.page),

      // Products module
      AutoRoute(page: AddUpdateProductRoute.page),
      AutoRoute(page: ProductDetailsRoute.page, fullscreenDialog: true),
      AutoRoute(page: ImagePreviewRoute.page),
      AutoRoute(page: ProductAddVariantRoute.page),
      AutoRoute(page: ImportProductsRoute.page),

      // Store settings
      AutoRoute(page: RegionsRoute.page),
      AutoRoute(page: RegionDetailsRoute.page),
      AutoRoute(page: AddUpdateRegionRoute.page),
      AutoRoute(page: AddUpdateShippingOptionRoute.page),

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

      // App Settings
      AutoRoute(page: OrderSettingsRoute.page),
      AutoRoute(page: AppDevSettingsRoute.page),
      AutoRoute(page: AppBarStyleRoute.page),
    ];
  }
}
