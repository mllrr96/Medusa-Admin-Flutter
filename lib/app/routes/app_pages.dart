import 'package:get/get.dart';

import '../modules/collections/bindings/collections_binding.dart';
import '../modules/collections/collection_details/bindings/collection_details_binding.dart';
import '../modules/collections/collection_details/views/collection_details_view.dart';
import '../modules/collections/create_collection/bindings/create_collection_binding.dart';
import '../modules/collections/create_collection/views/create_collection_view.dart';
import '../modules/customers/bindings/customers_binding.dart';
import '../modules/customers/customer_details/bindings/customer_details_binding.dart';
import '../modules/customers/customer_details/views/customer_details_view.dart';
import '../modules/customers/views/customers_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/discounts/bindings/discounts_binding.dart';
import '../modules/discounts/views/discounts_view.dart';
import '../modules/gift_cards/bindings/gift_cards_binding.dart';
import '../modules/gift_cards/views/gift_cards_view.dart';
import '../modules/orders/bindings/orders_binding.dart';
import '../modules/orders/order_details/bindings/order_details_binding.dart';
import '../modules/orders/order_details/views/order_details_view.dart';
import '../modules/pricing/bindings/pricing_binding.dart';
import '../modules/pricing/views/pricing_view.dart';
import '../modules/products/add_update_product/bindings/add_update_product_binding.dart';
import '../modules/products/add_update_product/components/product_add_variant.dart';
import '../modules/products/add_update_product/views/add_update_product_view.dart';
import '../modules/products/bindings/products_binding.dart';
import '../modules/products/product_details/bindings/product_details_binding.dart';
import '../modules/products/product_details/views/product_details_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/currencies/bindings/currencies_binding.dart';
import '../modules/settings/currencies/views/currencies_view.dart';
import '../modules/settings/store_details/bindings/store_details_binding.dart';
import '../modules/settings/store_details/views/store_details_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/sign_in_view.dart';
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
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
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
        name: _Paths.SEARCH,
        page: () => const SearchView(),
        binding: SearchBinding(),
        fullscreenDialog: true,
        transition: Transition.upToDown),

  ];
}
