// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const DASHBOARD = _Paths.DASHBOARD;
  static const SPLASH = _Paths.SPLASH;
  static const ORDERS = _Paths.ORDERS;
  static const DRAFT_ORDERS = _Paths.DRAFT_ORDERS;
  static const PRODUCTS = _Paths.PRODUCTS;
  static const CUSTOMERS = _Paths.CUSTOMERS;
  static const DISCOUNTS = _Paths.DISCOUNTS;
  static const GIFT_CARDS = _Paths.GIFT_CARDS;
  static const CREATE_GIFT_CARD = _Paths.CREATE_GIFT_CARD;
  static const CUSTOM_GIFT_CARDS = _Paths.CUSTOM_GIFT_CARDS;
  static const PRICING = _Paths.PRICING;
  static const STORE_SETTINGS = _Paths.STORE_SETTINGS;
  static const SIGN_IN = _Paths.SIGN_IN;
  static const ORDER_DETAILS = _Paths.DASHBOARD + _Paths.ORDER_DETAILS;
  static const PRODUCT_DETAILS = _Paths.DASHBOARD + _Paths.PRODUCT_DETAILS;
  static const ADD_UPDATE_PRODUCT =
      _Paths.DASHBOARD + _Paths.ADD_UPDATE_PRODUCT;
  static const STORE_DETAILS = _Paths.DASHBOARD + _Paths.STORE_DETAILS;
  static const CUSTOMER_DETAILS = _Paths.DASHBOARD + _Paths.CUSTOMER_DETAILS;
  static const CURRENCIES = _Paths.DASHBOARD + _Paths.CURRENCIES;
  static const COLLECTIONS = _Paths.COLLECTIONS;
  static const COLLECTION_DETAILS =
      _Paths.DASHBOARD + _Paths.COLLECTION_DETAILS;
  static const PRODUCT_ADD_VARIANT = _Paths.PRODUCT_ADD_VARIANT;
  static const CREATE_COLLECTION = _Paths.DASHBOARD + _Paths.CREATE_COLLECTION;
  static const REGIONS = _Paths.DASHBOARD + _Paths.REGIONS;
  static const ADD_REGION =
      _Paths.DASHBOARD + _Paths.REGIONS + _Paths.ADD_REGION;
  static const REGION_DETAILS =
      _Paths.DASHBOARD + _Paths.REGIONS + _Paths.REGION_DETAILS;
  static const SELECT_COUNTRY = _Paths.SELECT_COUNTRY;
  static const PERSONAL_INFORMATION =
      _Paths.DASHBOARD + _Paths.PERSONAL_INFORMATION;
  static const RETURN_REASONS = _Paths.DASHBOARD + _Paths.RETURN_REASONS;
  static const SHIPPING = _Paths.DASHBOARD + _Paths.SHIPPING;
  static const TEAM = _Paths.DASHBOARD + _Paths.TEAM;
  static const TAX_SETTINGS = _Paths.DASHBOARD +
      _Paths.TAX_SETTINGS_SELECT_REGION +
      _Paths.TAX_SETTINGS;
  static const TAX_SETTINGS_SELECT_REGION =
      _Paths.DASHBOARD + _Paths.TAX_SETTINGS_SELECT_REGION;
  static const CREATE_UPDATE_RETURN_REASON = _Paths.DASHBOARD +
      _Paths.RETURN_REASONS +
      _Paths.CREATE_UPDATE_RETURN_REASON;
  static const RESET_PASSWORD = _Paths.SIGN_IN + _Paths.RESET_PASSWORD;
  static const TRANSFER_ORDER =
      _Paths.DASHBOARD + _Paths.CUSTOMER_DETAILS + _Paths.TRANSFER_ORDER;
  static const DRAFT_ORDER_DETAILS =
      _Paths.DASHBOARD + _Paths.DRAFT_ORDER_DETAILS;
  static const CREATE_DRAFT_ORDER =
      _Paths.DASHBOARD + _Paths.CREATE_DRAFT_ORDER;
  static const PICK_PRODUCT_VARIANTS = _Paths.ADD_PRODUCT_VARIANTS;
  static const PICK_CUSTOMER = _Paths.PICK_CUSTOMER;
  static const GROUPS = _Paths.GROUPS;
  static const CREATE_UPDATE_GROUP = _Paths.CREATE_UPDATE_GROUP;
  static const GROUP_DETAILS = _Paths.GROUP_DETAILS;
  static const ADD_UPDATE_DISCOUNT = _Paths.ADD_UPDATE_DISCOUNT;
  static const DISCOUNT_DETAILS = _Paths.DISCOUNT_DETAILS;
  static const PICK_REGIONS = _Paths.PICK_REGIONS;
  static const DISCOUNT_CONDITIONS = _Paths.DISCOUNT_CONDITIONS;
  static const UPDATE_CONDITION = _Paths.UPDATE_CONDITION;
  static const UPDATE_CUSTOMER_DETAILS = _Paths.ADD_UPDATE_CUSTOMER;
  static const PRICE_LIST_DETAILS = _Paths.PRICE_LIST_DETAILS;
  static const ADD_UPDATE_PRICE_LIST = _Paths.ADD_UPDATE_PRICE_LIST;
  static const PICK_PRODUCTS = _Paths.PICK_PRODUCTS;
  static const ADD_UPDATE_SHIPPING_OPTION = _Paths.ADD_UPDATE_SHIPPING_OPTION;
  static const SALES_CHANNELS = _Paths.SALES_CHANNELS;
  static const SALES_CHANNEL_DETAILS = _Paths.SALES_CHANNEL_DETAILS;
  static const ADD_UPDATE_SALES_CHANNEL = _Paths.ADD_UPDATE_SALES_CHANNEL;
  static const API_KEY_MANAGEMENT = _Paths.API_KEY_MANAGEMENT;
  static const ADD_UPDATE_API_KEY = _Paths.ADD_UPDATE_API_KEY;
  static const ADD_UPDATE_TAX_RATE = _Paths.ADD_UPDATE_TAX_RATE;
  static const CATEGORIES = _Paths.CATEGORIES;
  static const APP_SETTINGS = _Paths.APP_SETTINGS;
  static const PICK_GROUPS = _Paths.PICK_GROUPS;
  static const CREATE_UPDATE_CUSTOM_GIFT_CARD =
      _Paths.CREATE_UPDATE_CUSTOM_GIFT_CARD;
  static const MEDUSA_SEARCH = _Paths.MEDUSA_SEARCH;
  static const ORDER_SETTINGS = _Paths.ORDER_SETTINGS;
  static const ADD_UPDATE_ORDER_EDIT = _Paths.ADD_UPDATE_ORDER_EDIT;
}

abstract class _Paths {
  _Paths._();
  static const DASHBOARD = '/dashboard';
  static const SPLASH = '/splash';
  static const ORDERS = '/orders';
  static const DRAFT_ORDERS = '/draft-orders';
  static const PRODUCTS = '/products';
  static const CUSTOMERS = '/customers';
  static const DISCOUNTS = '/discounts';
  static const GIFT_CARDS = '/gift-cards';
  static const CREATE_GIFT_CARD = '/create-gift-cards';
  static const CUSTOM_GIFT_CARDS = '/custom-gift-cards';
  static const PRICING = '/pricing';
  static const STORE_SETTINGS = '/store-settings';
  static const SIGN_IN = '/sign-in';
  static const PRODUCT_ADD_VARIANT = '/product-add-variant';
  static const ORDER_DETAILS = '/order-details';
  static const PRODUCT_DETAILS = '/product-details';
  static const ADD_UPDATE_PRODUCT = '/add-update-product';
  static const STORE_DETAILS = '/store-details';
  static const CUSTOMER_DETAILS = '/customer-details';
  static const CURRENCIES = '/currencies';
  static const COLLECTIONS = '/collections';
  static const COLLECTION_DETAILS = '/collection-details';
  static const CREATE_COLLECTION = '/create-collection';
  static const REGIONS = '/regions';
  static const ADD_REGION = '/add-region';
  static const REGION_DETAILS = '/region-details';
  static const SELECT_COUNTRY = '/select-country';
  static const PERSONAL_INFORMATION = '/personal-information';
  static const RETURN_REASONS = '/return-reasons';
  static const SHIPPING = '/shipping';
  static const TEAM = '/team';
  static const TAX_SETTINGS = '/tax-settings';
  static const TAX_SETTINGS_SELECT_REGION = '/tax-settings-select-region';
  static const CREATE_UPDATE_RETURN_REASON = '/create-update-return-reason';
  static const RESET_PASSWORD = '/reset-password';
  static const TRANSFER_ORDER = '/transfer-order';
  static const DRAFT_ORDER_DETAILS = '/draft-order-details';
  static const CREATE_DRAFT_ORDER = '/create-draft-order';
  static const ADD_PRODUCT_VARIANTS = '/pick-product-variants';
  static const PICK_CUSTOMER = '/pick-customer';
  static const GROUPS = '/groups';
  static const CREATE_UPDATE_GROUP = '/create-update-group';
  static const GROUP_DETAILS = '/group-details';
  static const ADD_UPDATE_DISCOUNT = '/add-update-discount';
  static const DISCOUNT_DETAILS = '/discount-details';
  static const PICK_REGIONS = '/pick-regions';
  static const DISCOUNT_CONDITIONS = '/discount-conditions';
  static const UPDATE_CONDITION = '/update-condition';
  static const ADD_UPDATE_CUSTOMER = '/add-update-customer';
  static const PRICE_LIST_DETAILS = '/price-list-details';
  static const ADD_UPDATE_PRICE_LIST = '/add-update-price-list';
  static const PICK_PRODUCTS = '/pick-products';
  static const ADD_UPDATE_SHIPPING_OPTION = '/add-update-shipping-option';
  static const SALES_CHANNELS = '/sales-channels';
  static const SALES_CHANNEL_DETAILS = '/sales-channel-details';
  static const ADD_UPDATE_SALES_CHANNEL = '/add-update-sales-channel';
  static const API_KEY_MANAGEMENT = '/api-key-management';
  static const ADD_UPDATE_API_KEY = '/add-update-api-key';
  static const ADD_UPDATE_TAX_RATE = '/add-update-tax-rate';
  static const CATEGORIES = '/categories';
  static const APP_SETTINGS = '/app-settings';
  static const PICK_GROUPS = '/pick-groups';
  static const CREATE_UPDATE_CUSTOM_GIFT_CARD =
      '/create-update-custom-gift-card';
  static const MEDUSA_SEARCH = '/medusa-search';
  static const ORDER_SETTINGS = '/order-settings';
  static const ADD_UPDATE_ORDER_EDIT = '/add-update-order-edit';
}
