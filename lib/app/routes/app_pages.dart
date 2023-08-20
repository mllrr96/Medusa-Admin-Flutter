import 'package:get/get.dart';

import '../modules/auth_module/reset_password/bindings/reset_password_binding.dart';
import '../modules/auth_module/reset_password/views/reset_password_view.dart';
import '../modules/auth_module/sign_in/bindings/sign_in_binding.dart';
import '../modules/auth_module/sign_in/views/sign_in_view.dart';
import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/collections_module/collection_details/bindings/collection_details_binding.dart';
import '../modules/collections_module/collection_details/views/collection_details_view.dart';
import '../modules/collections_module/collections/bindings/collections_binding.dart';
import '../modules/collections_module/collections/views/collections_view.dart';
import '../modules/collections_module/create_collection/bindings/create_collection_binding.dart';
import '../modules/collections_module/create_collection/views/create_collection_view.dart';
import '../modules/components/countries/bindings/country_binding.dart';
import '../modules/components/countries/view/country_view.dart';
import '../modules/components/pick_groups/bindings/pick_groups_binding.dart';
import '../modules/components/pick_groups/views/pick_groups_view.dart';
import '../modules/components/pick_products/bindings/pick_products_binding.dart';
import '../modules/components/pick_products/views/pick_products_view.dart';
import '../modules/components/pick_regions/bindings/pick_regions_binding.dart';
import '../modules/components/pick_regions/views/pick_regions_view.dart';
import '../modules/customers_module/add_update_customer/bindings/update_customer_details_binding.dart';
import '../modules/customers_module/add_update_customer/views/update_customer_details_view.dart';
import '../modules/customers_module/customer_details/bindings/customer_details_binding.dart';
import '../modules/customers_module/customer_details/views/customer_details_view.dart';
import '../modules/customers_module/customers/bindings/customers_binding.dart';
import '../modules/customers_module/customers/views/customers_view.dart';
import '../modules/customers_module/transfer_order/bindings/transfer_order_binding.dart';
import '../modules/customers_module/transfer_order/views/transfer_order_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/discount_module/add_update_discount/bindings/add_update_discount_binding.dart';
import '../modules/discount_module/add_update_discount/views/add_update_discount_view.dart';
import '../modules/discount_module/discount_conditions/bindings/discount_conditions_binding.dart';
import '../modules/discount_module/discount_conditions/views/discount_conditions_view.dart';
import '../modules/discount_module/discount_details/bindings/discount_details_binding.dart';
import '../modules/discount_module/discount_details/views/discount_details_view.dart';
import '../modules/discount_module/discounts/bindings/discounts_binding.dart';
import '../modules/discount_module/discounts/views/discounts_view.dart';
import '../modules/discount_module/update_condition/bindings/update_condition_binding.dart';
import '../modules/discount_module/update_condition/views/update_condition_view.dart';
import '../modules/draft_orders_module/create_draft_order/bindings/create_draft_order_binding.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_customer/bindings/pick_customer_binding.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_customer/views/pick_customer_view.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_product_variants/bindings/pick_product_variants_binding.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_product_variants/views/pick_product_vairants_view.dart';
import '../modules/draft_orders_module/create_draft_order/views/create_draft_order_view.dart';
import '../modules/draft_orders_module/draft_order_details/bindings/draft_order_details_binding.dart';
import '../modules/draft_orders_module/draft_order_details/views/draft_order_details_view.dart';
import '../modules/draft_orders_module/draft_orders/bindings/draft_orders_binding.dart';
import '../modules/draft_orders_module/draft_orders/views/draft_orders_view.dart';
import '../modules/gift_cards_module/create_update_custom_gift_card/bindings/create_update_custom_gift_card_binding.dart';
import '../modules/gift_cards_module/create_update_custom_gift_card/views/create_update_custom_gift_card_view.dart';
import '../modules/gift_cards_module/custom_gift_cards/bindings/custom_gift_cards_binding.dart';
import '../modules/gift_cards_module/custom_gift_cards/views/custom_gift_cards_view.dart';
import '../modules/gift_cards_module/gift_cards/bindings/gift_cards_binding.dart';
import '../modules/gift_cards_module/gift_cards/components/create_gift_card/create_gift_card_binding.dart';
import '../modules/gift_cards_module/gift_cards/components/create_gift_card/create_gift_card_view.dart';
import '../modules/gift_cards_module/gift_cards/views/gift_cards_view.dart';
import '../modules/groups_module/create_update_group/bindings/create_update_group_binding.dart';
import '../modules/groups_module/create_update_group/views/create_update_group_view.dart';
import '../modules/groups_module/group_details/bindings/group_details_binding.dart';
import '../modules/groups_module/group_details/views/group_details_view.dart';
import '../modules/groups_module/groups/bindings/groups_binding.dart';
import '../modules/groups_module/groups/views/groups_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/orders_module/order_details/bindings/order_details_binding.dart';
import '../modules/orders_module/order_details/views/order_details_view.dart';
import '../modules/orders_module/orders/bindings/orders_binding.dart';
import '../modules/orders_module/orders/views/orders_view.dart';
import '../modules/pricing_module/add_update_price_list/bindings/add_update_price_list_binding.dart';
import '../modules/pricing_module/add_update_price_list/views/add_update_price_list_view.dart';
import '../modules/pricing_module/price_list_details/bindings/price_list_details_binding.dart';
import '../modules/pricing_module/price_list_details/views/price_list_details_view.dart';
import '../modules/pricing_module/pricing/bindings/pricing_binding.dart';
import '../modules/pricing_module/pricing/views/pricing_view.dart';
import '../modules/products_module/add_update_product/bindings/add_update_product_binding.dart';
import '../modules/products_module/add_update_product/components/product_add_variant.dart';
import '../modules/products_module/add_update_product/views/add_update_product_view.dart';
import '../modules/products_module/product_details/bindings/product_details_binding.dart';
import '../modules/products_module/product_details/views/product_details_view.dart';
import '../modules/products_module/products/bindings/products_binding.dart';
import '../modules/products_module/products/views/products_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/settings_module/app_settings/bindings/app_settings_binding.dart';
import '../modules/settings_module/app_settings/views/app_settings_view.dart';
import '../modules/settings_module/store_settings/api_key_module/add_update_api_key/bindings/add_update_api_key_binding.dart';
import '../modules/settings_module/store_settings/api_key_module/add_update_api_key/views/add_update_api_key_view.dart';
import '../modules/settings_module/store_settings/api_key_module/api_key_management/bindings/api_key_management_binding.dart';
import '../modules/settings_module/store_settings/api_key_module/api_key_management/views/api_key_management_view.dart';
import '../modules/settings_module/store_settings/currencies/bindings/currencies_binding.dart';
import '../modules/settings_module/store_settings/currencies/views/currencies_view.dart';
import '../modules/settings_module/store_settings/personal_information/bindings/personal_information_binding.dart';
import '../modules/settings_module/store_settings/personal_information/views/personal_information_view.dart';
import '../modules/settings_module/store_settings/regions_module/add_region/bindings/add_region_binding.dart';
import '../modules/settings_module/store_settings/regions_module/add_region/views/add_region_view.dart';
import '../modules/settings_module/store_settings/regions_module/add_update_shipping_option/bindings/add_update_shipping_option_binding.dart';
import '../modules/settings_module/store_settings/regions_module/add_update_shipping_option/views/add_update_shipping_option_view.dart';
import '../modules/settings_module/store_settings/regions_module/region_details/bindings/region_details_binding.dart';
import '../modules/settings_module/store_settings/regions_module/region_details/views/region_details_view.dart';
import '../modules/settings_module/store_settings/regions_module/regions/bindings/regions_binding.dart';
import '../modules/settings_module/store_settings/regions_module/regions/views/regions_view.dart';
import '../modules/settings_module/store_settings/return_reasons_module/create_update_return_reason/bindings/create_update_return_reason_binding.dart';
import '../modules/settings_module/store_settings/return_reasons_module/create_update_return_reason/views/create_update_return_reason_view.dart';
import '../modules/settings_module/store_settings/return_reasons_module/return_reasons/bindings/return_reasons_binding.dart';
import '../modules/settings_module/store_settings/return_reasons_module/return_reasons/views/return_reasons_view.dart';
import '../modules/settings_module/store_settings/sales_channel_module/add_update_sales_channel/bindings/add_update_sales_channel_binding.dart';
import '../modules/settings_module/store_settings/sales_channel_module/add_update_sales_channel/views/add_update_sales_channel_view.dart';
import '../modules/settings_module/store_settings/sales_channel_module/sales_channel_details/bindings/sales_channel_details_binding.dart';
import '../modules/settings_module/store_settings/sales_channel_module/sales_channel_details/views/sales_channel_details_view.dart';
import '../modules/settings_module/store_settings/sales_channel_module/sales_channels/bindings/sales_channels_binding.dart';
import '../modules/settings_module/store_settings/sales_channel_module/sales_channels/views/sales_channels_view.dart';
import '../modules/settings_module/store_settings/shipping/bindings/shipping_binding.dart';
import '../modules/settings_module/store_settings/shipping/views/shipping_view.dart';
import '../modules/settings_module/store_settings/store_details/bindings/store_details_binding.dart';
import '../modules/settings_module/store_settings/store_details/views/store_details_view.dart';
import '../modules/settings_module/store_settings/store_settings_view.dart';
import '../modules/settings_module/store_settings/tax_settings_module/add_update_tax_rate/bindings/add_update_tax_rate_binding.dart';
import '../modules/settings_module/store_settings/tax_settings_module/add_update_tax_rate/views/add_update_tax_rate_view.dart';
import '../modules/settings_module/store_settings/tax_settings_module/tax_settings/bindings/tax_settings_binding.dart';
import '../modules/settings_module/store_settings/tax_settings_module/tax_settings/bindings/tax_settings_select_region_binding.dart';
import '../modules/settings_module/store_settings/tax_settings_module/tax_settings/views/tax_settings_select_region_view.dart';
import '../modules/settings_module/store_settings/tax_settings_module/tax_settings/views/tax_settings_view.dart';
import '../modules/settings_module/store_settings/team/bindings/team_binding.dart';
import '../modules/settings_module/store_settings/team/views/team_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
      binding: OrdersBinding(),
    ),
    GetPage(
      name: _Paths.DRAFT_ORDERS,
      page: () => const DraftOrdersView(),
      binding: DraftOrdersBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => const ProductsView(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: _Paths.COLLECTIONS,
      page: () => const CollectionsView(),
      binding: CollectionsBinding(),
    ),
    GetPage(
      name: _Paths.GROUPS,
      page: () => const GroupsView(),
      binding: GroupsBinding(),
    ),
    GetPage(
        name: _Paths.DASHBOARD,
        page: () => const DashboardView(),
        bindings: [
          DashboardBinding(),
          OrdersBinding(),
          DraftOrdersBinding(),
          ProductsBinding(),
          CustomersBinding(),
          CollectionsBinding(),
          CategoriesBinding(),
          GroupsBinding(),
          MoreBinding(),
          // CurrenciesBinding(),
        ],
        children: [
          GetPage(
            name: _Paths.ORDER_DETAILS,
            page: () => const OrderDetailsView(),
            binding: OrderDetailsBinding(),
          ),
          GetPage(
            name: _Paths.DRAFT_ORDER_DETAILS,
            page: () => const DraftOrderDetailsView(),
            binding: DraftOrderDetailsBinding(),
          ),
          GetPage(
            name: _Paths.CREATE_DRAFT_ORDER,
            page: () => const CreateDraftOrderView(),
            binding: CreateDraftOrderBinding(),
            fullscreenDialog: true,
          ),
          GetPage(
            name: _Paths.PRODUCT_DETAILS,
            page: () => const ProductDetailsView(),
            binding: ProductDetailsBinding(),
          ),
          GetPage(
            name: _Paths.ADD_UPDATE_PRODUCT,
            page: () => const AddUpdateProductView(),
            binding: AddUpdateProductBinding(),
            fullscreenDialog: true,
          ),
          GetPage(
            name: _Paths.STORE_DETAILS,
            page: () => const StoreDetailsView(),
            binding: StoreDetailsBinding(),
          ),
          GetPage(
            name: _Paths.CUSTOMER_DETAILS,
            page: () => const CustomerDetailsView(),
            binding: CustomerDetailsBinding(),
            children: [
              GetPage(
                name: _Paths.TRANSFER_ORDER,
                page: () => const TransferOrderView(),
                binding: TransferOrderBinding(),
                fullscreenDialog: true,
              ),
            ],
          ),
          GetPage(
            name: _Paths.CURRENCIES,
            page: () => const CurrenciesView(),
            binding: CurrenciesBinding(),
          ),
          GetPage(
            name: _Paths.COLLECTION_DETAILS,
            page: () => const CollectionDetailsView(),
            binding: CollectionDetailsBinding(),
          ),
          GetPage(
            name: _Paths.CREATE_COLLECTION,
            page: () => const CreateCollectionView(),
            binding: CreateCollectionBinding(),
            fullscreenDialog: true,
          ),
          GetPage(
            name: _Paths.REGIONS,
            page: () => const RegionsView(),
            binding: RegionsBinding(),
            children: [
              GetPage(
                name: _Paths.ADD_REGION,
                page: () => const AddRegionView(),
                binding: AddRegionBinding(),
              ),
              GetPage(
                name: _Paths.REGION_DETAILS,
                page: () => const RegionDetailsView(),
                binding: RegionDetailsBinding(),
              ),
            ],
          ),
          GetPage(
            name: _Paths.PERSONAL_INFORMATION,
            page: () => const PersonalInformationView(),
            binding: PersonalInformationBinding(),
          ),
          GetPage(
            name: _Paths.RETURN_REASONS,
            page: () => const ReturnReasonsView(),
            binding: ReturnReasonsBinding(),
            children: [
              GetPage(
                name: _Paths.CREATE_UPDATE_RETURN_REASON,
                page: () => const CreateUpdateReturnReasonView(),
                binding: CreateUpdateReturnReasonBinding(),
                fullscreenDialog: true,
              ),
            ],
          ),
          GetPage(
            name: _Paths.SHIPPING,
            page: () => const ShippingView(),
            binding: ShippingBinding(),
          ),
          GetPage(
            name: _Paths.TEAM,
            page: () => const TeamView(),
            binding: TeamBinding(),
          ),
          GetPage(
              name: _Paths.TAX_SETTINGS_SELECT_REGION,
              page: () => const TaxSettingsSelectRegionView(),
              binding: TaxSettingsSelectRegionBinding(),
              children: [
                GetPage(
                  name: _Paths.TAX_SETTINGS,
                  page: () => const TaxSettingsView(),
                  binding: TaxSettingsBinding(),
                ),
              ]),
        ]),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERS,
      page: () => const CustomersView(),
      binding: CustomersBinding(),
    ),
    GetPage(
      name: _Paths.DISCOUNTS,
      page: () => const DiscountsView(),
      binding: DiscountsBinding(),
    ),
    GetPage(
      name: _Paths.GIFT_CARDS,
      page: () => const GiftCardsView(),
      binding: GiftCardsBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOM_GIFT_CARDS,
      page: () => const CustomGiftCardsView(),
      binding: CustomGiftCardsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_GIFT_CARD,
      page: () => const CreateGiftCardView(),
      binding: CreateGiftCardBinding(),
    ),
    GetPage(
      name: _Paths.PRICING,
      page: () => const PricingView(),
      binding: PricingBinding(),
    ),
    GetPage(
      name: _Paths.STORE_SETTINGS,
      page: () => const StoreSettingsView(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
      children: [
        GetPage(
          name: _Paths.RESET_PASSWORD,
          page: () => const ResetPasswordView(),
          transition: Transition.noTransition,
          binding: ResetPasswordBinding(),
          fullscreenDialog: true,
        ),
      ],
    ),
    GetPage(
      name: _Paths.PRODUCT_ADD_VARIANT,
      page: () => const ProductAddVariant(),
      binding: ProductAddVariantBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.SELECT_COUNTRY,
      page: () => const SelectCountryView(),
      binding: SelectCountryBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT_VARIANTS,
      page: () => const PickProductVariantsView(),
      binding: PickProductVariantsBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.PICK_CUSTOMER,
      page: () => const PickCustomerView(),
      binding: PickCustomerBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.CREATE_UPDATE_GROUP,
      page: () => const CreateUpdateGroupView(),
      binding: CreateUpdateGroupBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.GROUP_DETAILS,
      page: () => const GroupDetailsView(),
      binding: GroupDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_DISCOUNT,
      page: () => const AddUpdateDiscountView(),
      binding: AddUpdateDiscountBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.DISCOUNT_DETAILS,
      page: () => const DiscountDetailsView(),
      binding: DiscountDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PICK_REGIONS,
      page: () => const PickRegionsView(),
      binding: PickRegionsBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.DISCOUNT_CONDITIONS,
      page: () => const DiscountConditionsView(),
      binding: DiscountConditionsBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.UPDATE_CONDITION,
      page: () => const UpdateConditionView(),
      binding: UpdateConditionBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_CUSTOMER,
      page: () => const AddUpdateCustomerView(),
      binding: AddUpdateCustomerBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.PRICE_LIST_DETAILS,
      page: () => const PriceListDetailsView(),
      binding: PriceListDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_PRICE_LIST,
      page: () => const AddUpdatePriceListView(),
      binding: AddUpdatePriceListBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.PICK_PRODUCTS,
      page: () => const PickProductsView(),
      binding: PickProductsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_SHIPPING_OPTION,
      page: () => const AddUpdateShippingOptionView(),
      binding: AddUpdateShippingOptionBinding(),
    ),
    GetPage(
      name: _Paths.SALES_CHANNELS,
      page: () => const SalesChannelsView(),
      binding: SalesChannelsBinding(),
    ),
    GetPage(
      name: _Paths.SALES_CHANNEL_DETAILS,
      page: () => const SalesChannelDetailsView(),
      binding: SalesChannelDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_SALES_CHANNEL,
      page: () => const AddUpdateSalesChannelView(),
      binding: AddUpdateSalesChannelBinding(),
    ),
    GetPage(
      name: _Paths.API_KEY_MANAGEMENT,
      page: () => const ApiKeyManagementView(),
      binding: ApiKeyManagementBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_API_KEY,
      page: () => const AddUpdateApiKeyView(),
      binding: AddUpdateApiKeyBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_TAX_RATE,
      page: () => const AddUpdateTaxRateView(),
      binding: AddUpdateTaxRateBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.APP_SETTINGS,
      page: () => const AppSettingsView(),
      binding: AppSettingsBinding(),
    ),
    GetPage(
      name: _Paths.PICK_GROUPS,
      page: () => const PickGroupsView(),
      binding: PickGroupsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_UPDATE_CUSTOM_GIFT_CARD,
      page: () => const CreateUpdateCustomGiftCardView(),
      binding: CreateUpdateCustomGiftCardBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
  ];
}
