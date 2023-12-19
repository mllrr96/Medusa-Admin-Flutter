import 'package:get/get.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/components/add_update_order_edit/bindings/add_update_order_edit_binding.dart';
import 'package:medusa_admin/app/modules/orders_module/order_details/components/add_update_order_edit/views/add_update_order_edit_view.dart';
import 'package:medusa_admin/core/utils/enums.dart';

import '../modules/auth_module/reset_password/bindings/reset_password_binding.dart';
import '../modules/auth_module/reset_password/views/reset_password_view.dart';
import '../modules/auth_module/sign_in/bindings/sign_in_binding.dart';
import '../modules/auth_module/sign_in/views/sign_in_view.dart';
import '../modules/categories/views/categories_view.dart';
import '../modules/collections_module/collection_details/views/collection_details_view.dart';
import '../modules/collections_module/collections/bindings/collections_binding.dart';
import '../modules/collections_module/collections/views/collections_view.dart';
import '../modules/components/countries/bindings/country_binding.dart';
import '../modules/components/countries/view/country_view.dart';
import '../modules/components/pick_groups/bindings/pick_groups_binding.dart';
import '../modules/components/pick_groups/views/pick_groups_view.dart';
import '../modules/components/pick_products/bindings/pick_products_binding.dart';
import '../modules/components/pick_products/views/pick_products_view.dart';
import '../modules/components/pick_regions/bindings/pick_regions_binding.dart';
import '../modules/components/pick_regions/views/pick_regions_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/discount_module/add_update_discount/bindings/add_update_discount_binding.dart';
import '../modules/discount_module/add_update_discount/views/add_update_discount_view.dart';
import '../modules/discount_module/discount_conditions/bindings/discount_conditions_binding.dart';
import '../modules/discount_module/discount_conditions/views/discount_conditions_view.dart';
import '../modules/discount_module/discount_details/views/discount_details_view.dart';
import '../modules/discount_module/discounts/views/discounts_view.dart';
import '../modules/discount_module/update_condition/bindings/update_condition_binding.dart';
import '../modules/discount_module/update_condition/views/update_condition_view.dart';
import '../modules/draft_orders_module/create_draft_order/bindings/create_draft_order_binding.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_customer/bindings/pick_customer_binding.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_customer/views/pick_customer_view.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_product_variants/bindings/pick_product_variants_binding.dart';
import '../modules/draft_orders_module/create_draft_order/components/pick_product_variants/views/pick_product_vairants_view.dart';
import '../modules/draft_orders_module/create_draft_order/views/create_draft_order_view.dart';
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
import '../modules/groups_module/groups/bindings/groups_binding.dart';
import '../modules/groups_module/groups/views/groups_view.dart';
import '../modules/medusa_search/views/medusa_search_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/orders_module/order_details/bindings/order_details_binding.dart';
import '../modules/orders_module/order_details/views/order_details_view.dart';
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
import '../modules/products_module/product_details/views/product_details_view.dart';
import '../modules/products_module/products/views/products_view.dart';
import '../modules/settings_module/app_settings/bindings/app_settings_binding.dart';
import '../modules/settings_module/app_settings/order_settings/views/order_settings_view.dart';
import '../modules/settings_module/app_settings/views/app_settings_view.dart';
import '../modules/settings_module/store_settings/api_key_module/add_update_api_key/views/add_update_api_key_view.dart';
import '../modules/settings_module/store_settings/api_key_module/api_key_management/views/api_key_management_view.dart';
import '../modules/settings_module/store_settings/currencies/views/currencies_view.dart';
import '../modules/settings_module/store_settings/personal_information/views/personal_information_view.dart';
import '../modules/settings_module/store_settings/regions_module/add_region/views/add_region_view.dart';
import '../modules/settings_module/store_settings/regions_module/add_update_shipping_option/bindings/add_update_shipping_option_binding.dart';
import '../modules/settings_module/store_settings/regions_module/add_update_shipping_option/views/add_update_shipping_option_view.dart';
import '../modules/settings_module/store_settings/regions_module/regions/views/regions_view.dart';
import '../modules/settings_module/store_settings/return_reasons_module/create_update_return_reason/bindings/create_update_return_reason_binding.dart';
import '../modules/settings_module/store_settings/return_reasons_module/create_update_return_reason/views/create_update_return_reason_view.dart';
import '../modules/settings_module/store_settings/return_reasons_module/return_reasons/views/return_reasons_view.dart';
import '../modules/settings_module/store_settings/sales_channel_module/add_update_sales_channel/bindings/add_update_sales_channel_binding.dart';
import '../modules/settings_module/store_settings/sales_channel_module/add_update_sales_channel/views/add_update_sales_channel_view.dart';
import '../modules/settings_module/store_settings/shipping/bindings/shipping_binding.dart';
import '../modules/settings_module/store_settings/shipping/views/shipping_view.dart';
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

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.ORDERS,
      page: () => const OrdersView(),
    ),
    GetPage(
      name: _Paths.DRAFT_ORDERS,
      page: () => const DraftOrdersView(),
      binding: DraftOrdersBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => const ProductsView(),
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
          DraftOrdersBinding(),
          CollectionsBinding(),
          GroupsBinding(),
          MoreBinding(),
          // CurrenciesBinding(),
        ],
        children: [
          GetPage(
            name: _Paths.ORDER_DETAILS,
            page: () =>  const OrderDetailsView(''),
            binding: OrderDetailsBinding(),
          ),
          GetPage(
            name: _Paths.DRAFT_ORDER_DETAILS,
            page: () => const DraftOrderDetailsView(''),
          ),
          GetPage(
            name: _Paths.CREATE_DRAFT_ORDER,
            page: () => const CreateDraftOrderView(),
            binding: CreateDraftOrderBinding(),
            fullscreenDialog: true,
          ),
          GetPage(
            name: _Paths.PRODUCT_DETAILS,
            page: () => const ProductDetailsView(''),
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
          ),
          GetPage(
            name: _Paths.CURRENCIES,
            page: () => const CurrenciesView(),
          ),
          GetPage(
            name: _Paths.COLLECTION_DETAILS,
            page: () => const CollectionDetailsView(''),
          ),
          GetPage(
            name: _Paths.REGIONS,
            page: () => const RegionsView(),
            children: [
              GetPage(
                name: _Paths.ADD_REGION,
                page: () => const AddRegionView(),
              ),
            ],
          ),
          GetPage(
            name: _Paths.PERSONAL_INFORMATION,
            page: () => const PersonalInformationView(),
          ),
          GetPage(
            name: _Paths.RETURN_REASONS,
            page: () => const ReturnReasonsView(),
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
      name: _Paths.DISCOUNTS,
      page: () => const DiscountsView(),
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
      name: _Paths.ADD_UPDATE_DISCOUNT,
      page: () => const AddUpdateDiscountView(),
      binding: AddUpdateDiscountBinding(),
      fullscreenDialog: true,
    ),
    GetPage(
      name: _Paths.DISCOUNT_DETAILS,
      page: () => const DiscountDetailsView(''),
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
      name: _Paths.ADD_UPDATE_SALES_CHANNEL,
      page: () => const AddUpdateSalesChannelView(),
      binding: AddUpdateSalesChannelBinding(),
    ),
    GetPage(
      name: _Paths.API_KEY_MANAGEMENT,
      page: () => const ApiKeyManagementView(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_API_KEY,
      page: () => const AddUpdateApiKeyView(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_TAX_RATE,
      page: () => const AddUpdateTaxRateView(),
      binding: AddUpdateTaxRateBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => const CategoriesView(),
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
      name: _Paths.MEDUSA_SEARCH,
      transition: Transition.native,
      page: () => const MedusaSearchView(searchCategory: SearchCategory.giftCards)
      // fullscreenDialog: true,
      // binding: MedusaSearchBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_SETTINGS,
      page: () => const OrderSettingsView(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_ORDER_EDIT,
      page: () => const AddUpdateOrderEditView(),
      binding: AddUpdateOrderEditBinding(),
    ),
  ];
}
