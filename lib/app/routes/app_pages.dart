import 'package:get/get.dart';

import '../modules/auth_module/sign_in/bindings/sign_in_binding.dart';
import '../modules/auth_module/sign_in/views/sign_in_view.dart';
import '../modules/collections_module/collection_details/bindings/collection_details_binding.dart';
import '../modules/collections_module/collection_details/views/collection_details_view.dart';
import '../modules/collections_module/collections/bindings/collections_binding.dart';
import '../modules/collections_module/create_collection/bindings/create_collection_binding.dart';
import '../modules/collections_module/create_collection/views/create_collection_view.dart';
import '../modules/components/countries/bindings/country_binding.dart';
import '../modules/components/countries/view/country_view.dart';
import '../modules/customers_module/customer_details/bindings/customer_details_binding.dart';
import '../modules/customers_module/customer_details/views/customer_details_view.dart';
import '../modules/customers_module/customers/bindings/customers_binding.dart';
import '../modules/customers_module/customers/views/customers_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/discounts/bindings/discounts_binding.dart';
import '../modules/discounts/views/discounts_view.dart';
import '../modules/gift_cards/bindings/gift_cards_binding.dart';
import '../modules/gift_cards/views/gift_cards_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/orders_module/order_details/bindings/order_details_binding.dart';
import '../modules/orders_module/order_details/views/order_details_view.dart';
import '../modules/orders_module/orders/bindings/orders_binding.dart';
import '../modules/pricing/bindings/pricing_binding.dart';
import '../modules/pricing/views/pricing_view.dart';
import '../modules/products_module/add_update_product/bindings/add_update_product_binding.dart';
import '../modules/products_module/add_update_product/components/product_add_variant.dart';
import '../modules/products_module/add_update_product/views/add_update_product_view.dart';
import '../modules/products_module/product_details/bindings/product_details_binding.dart';
import '../modules/products_module/product_details/views/product_details_view.dart';
import '../modules/products_module/products/bindings/products_binding.dart';
import '../modules/settings_module/settings/views/settings_view.dart';
import '../modules/settings_module/store_settings/currencies/bindings/currencies_binding.dart';
import '../modules/settings_module/store_settings/currencies/views/currencies_view.dart';
import '../modules/settings_module/store_settings/personal_information/bindings/personal_information_binding.dart';
import '../modules/settings_module/store_settings/personal_information/views/personal_information_view.dart';
import '../modules/settings_module/store_settings/regions/add_region/bindings/add_region_binding.dart';
import '../modules/settings_module/store_settings/regions/add_region/views/add_region_view.dart';
import '../modules/settings_module/store_settings/regions/bindings/regions_binding.dart';
import '../modules/settings_module/store_settings/regions/region_details/bindings/region_details_binding.dart';
import '../modules/settings_module/store_settings/regions/region_details/views/region_details_view.dart';
import '../modules/settings_module/store_settings/regions/views/regions_view.dart';
import '../modules/settings_module/store_settings/return_reasons/bindings/return_reasons_binding.dart';
import '../modules/settings_module/store_settings/return_reasons/create_update_return_reason/bindings/create_update_return_reason_binding.dart';
import '../modules/settings_module/store_settings/return_reasons/create_update_return_reason/views/create_update_return_reason_view.dart';
import '../modules/settings_module/store_settings/return_reasons/views/return_reasons_view.dart';
import '../modules/settings_module/store_settings/shipping/bindings/shipping_binding.dart';
import '../modules/settings_module/store_settings/shipping/views/shipping_view.dart';
import '../modules/settings_module/store_settings/store_details/bindings/store_details_binding.dart';
import '../modules/settings_module/store_settings/store_details/views/store_details_view.dart';
import '../modules/settings_module/store_settings/tax_settings/bindings/tax_settings_binding.dart';
import '../modules/settings_module/store_settings/tax_settings/views/tax_settings_view.dart';
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
        name: _Paths.DASHBOARD,
        page: () => const DashboardView(),
        bindings: [
          DashboardBinding(),
          OrdersBinding(),
          ProductsBinding(),
          CustomersBinding(),
          CollectionsBinding(),
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
            name: _Paths.TAX_SETTINGS,
            page: () => const TaxSettingsView(),
            binding: TaxSettingsBinding(),
          ),
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
  ];
}
