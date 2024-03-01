// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ActivityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ActivityView(),
      );
    },
    AddRegionRoute.name: (routeData) {
      final args = routeData.argsAs<AddRegionRouteArgs>(
          orElse: () => const AddRegionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddRegionView(
          key: args.key,
          region: args.region,
        ),
      );
    },
    AddUpdateApiKeyRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateApiKeyRouteArgs>(
          orElse: () => const AddUpdateApiKeyRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateApiKeyView(
          key: args.key,
          publishableApiKey: args.publishableApiKey,
        ),
      );
    },
    AddUpdateCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateCustomerRouteArgs>(
          orElse: () => const AddUpdateCustomerRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateCustomerView(
          key: args.key,
          customer: args.customer,
        ),
      );
    },
    AddUpdateDiscountRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateDiscountRouteArgs>(
          orElse: () => const AddUpdateDiscountRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateDiscountView(
          key: args.key,
          discount: args.discount,
        ),
      );
    },
    AddUpdateOrderEditRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateOrderEditRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateOrderEditView(
          args.order,
          key: args.key,
        ),
      );
    },
    AddUpdatePriceListRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdatePriceListRouteArgs>(
          orElse: () => const AddUpdatePriceListRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdatePriceListView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    AddUpdateProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateProductRouteArgs>(
          orElse: () => const AddUpdateProductRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateProductView(
          key: args.key,
          updateProductReq: args.updateProductReq,
        ),
      );
    },
    AddUpdateSalesChannelRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateSalesChannelRouteArgs>(
          orElse: () => const AddUpdateSalesChannelRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateSalesChannelView(
          key: args.key,
          salesChannel: args.salesChannel,
        ),
      );
    },
    AddUpdateShippingOptionRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateShippingOptionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateShippingOptionView(
          args.addUpdateShippingOptionReq,
          key: args.key,
        ),
      );
    },
    AddUpdateTaxRateRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateTaxRateRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateTaxRateView(
          args.addUpdateTaxRateReq,
          key: args.key,
        ),
      );
    },
    AddUpdateVariantsPriceRoute.name: (routeData) {
      final args = routeData.argsAs<AddUpdateVariantsPriceRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddUpdateVariantsPriceView(
          key: args.key,
          prices: args.prices,
          product: args.product,
        ),
      );
    },
    ApiKeyManagementRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ApiKeyManagementView(),
      );
    },
    AppBarStyleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppBarStyleView(),
      );
    },
    AppDevSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppDevSettingsView(),
      );
    },
    AppSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppSettingsView(),
      );
    },
    AppUpdateRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppUpdateView(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoriesView(),
      );
    },
    CollectionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CollectionDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CollectionDetailsView(
          args.collectionId,
          key: args.key,
        ),
      );
    },
    CollectionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CollectionsView(),
      );
    },
    ConditionCollectionRoute.name: (routeData) {
      final args = routeData.argsAs<ConditionCollectionRouteArgs>(
          orElse: () => const ConditionCollectionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConditionCollectionView(
          key: args.key,
          disabledCollections: args.disabledCollections,
        ),
      );
    },
    ConditionCustomerGroupRoute.name: (routeData) {
      final args = routeData.argsAs<ConditionCustomerGroupRouteArgs>(
          orElse: () => const ConditionCustomerGroupRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConditionCustomerGroupView(
          key: args.key,
          disabledGroups: args.disabledGroups,
        ),
      );
    },
    ConditionProductRoute.name: (routeData) {
      final args = routeData.argsAs<ConditionProductRouteArgs>(
          orElse: () => const ConditionProductRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConditionProductView(
          key: args.key,
          disabledProducts: args.disabledProducts,
        ),
      );
    },
    ConditionTagRoute.name: (routeData) {
      final args = routeData.argsAs<ConditionTagRouteArgs>(
          orElse: () => const ConditionTagRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConditionTagView(
          key: args.key,
          disabledTags: args.disabledTags,
        ),
      );
    },
    ConditionTypeRoute.name: (routeData) {
      final args = routeData.argsAs<ConditionTypeRouteArgs>(
          orElse: () => const ConditionTypeRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConditionTypeView(
          key: args.key,
          disabledTypes: args.disabledTypes,
        ),
      );
    },
    CreateCollectionRoute.name: (routeData) {
      final args = routeData.argsAs<CreateCollectionRouteArgs>(
          orElse: () => const CreateCollectionRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateCollectionView(
          key: args.key,
          collection: args.collection,
        ),
      );
    },
    CreateDraftOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateDraftOrderView(),
      );
    },
    CreateUpdateCustomGiftCardRoute.name: (routeData) {
      final args = routeData.argsAs<CreateUpdateCustomGiftCardRouteArgs>(
          orElse: () => const CreateUpdateCustomGiftCardRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateUpdateCustomGiftCardView(
          key: args.key,
          giftCard: args.giftCard,
        ),
      );
    },
    CreateUpdateGroupRoute.name: (routeData) {
      final args = routeData.argsAs<CreateUpdateGroupRouteArgs>(
          orElse: () => const CreateUpdateGroupRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateUpdateGroupView(
          key: args.key,
          customerGroup: args.customerGroup,
        ),
      );
    },
    CreateUpdateReturnReasonRoute.name: (routeData) {
      final args = routeData.argsAs<CreateUpdateReturnReasonRouteArgs>(
          orElse: () => const CreateUpdateReturnReasonRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateUpdateReturnReasonView(
          key: args.key,
          returnReason: args.returnReason,
        ),
      );
    },
    CurrenciesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CurrenciesView(),
      );
    },
    CustomGiftCardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomGiftCardsView(),
      );
    },
    CustomerDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CustomerDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustomerDetailsView(
          args.customerId,
          key: args.key,
        ),
      );
    },
    CustomersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomersView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardView(),
      );
    },
    DiscountConditionsRoute.name: (routeData) {
      final args = routeData.argsAs<DiscountConditionsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DiscountConditionsView(
          args.discountConditionReq,
          key: args.key,
        ),
      );
    },
    DiscountDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DiscountDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DiscountDetailsView(
          args.discount,
          key: args.key,
        ),
      );
    },
    DiscountsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DiscountsView(),
      );
    },
    DraftOrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DraftOrderDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DraftOrderDetailsView(
          args.draftId,
          key: args.key,
        ),
      );
    },
    DraftOrdersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DraftOrdersView(),
      );
    },
    GroupDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<GroupDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GroupDetailsView(
          args.customerGroup,
          key: args.key,
        ),
      );
    },
    GroupsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GroupsView(),
      );
    },
    ImagePreviewRoute.name: (routeData) {
      final args = routeData.argsAs<ImagePreviewRouteArgs>(
          orElse: () => const ImagePreviewRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ImagePreviewView(
          key: args.key,
          imageFile: args.imageFile,
          imageUrl: args.imageUrl,
          heroTag: args.heroTag,
          disableHero: args.disableHero,
        ),
      );
    },
    ImportProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ImportProductsView(),
      );
    },
    MedusaSearchRoute.name: (routeData) {
      final args = routeData.argsAs<MedusaSearchRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MedusaSearchView(
          key: args.key,
          searchCategory: args.searchCategory,
        ),
      );
    },
    OrderCreateFulfillmentRoute.name: (routeData) {
      final args = routeData.argsAs<OrderCreateFulfillmentRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderCreateFulfillmentView(
          order: args.order,
          key: args.key,
        ),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderDetailsView(
          args.orderId,
          key: args.key,
        ),
      );
    },
    OrderSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderSettingsView(),
      );
    },
    OrdersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrdersView(),
      );
    },
    PersonalInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonalInformationView(),
      );
    },
    PickCustomerRoute.name: (routeData) {
      final args = routeData.argsAs<PickCustomerRouteArgs>(
          orElse: () => const PickCustomerRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PickCustomerView(
          key: args.key,
          pickCustomerReq: args.pickCustomerReq,
        ),
      );
    },
    PickGroupsRoute.name: (routeData) {
      final args = routeData.argsAs<PickGroupsRouteArgs>(
          orElse: () => const PickGroupsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PickGroupsView(
          key: args.key,
          pickGroupsReq: args.pickGroupsReq,
        ),
      );
    },
    PickProductVariantsRoute.name: (routeData) {
      final args = routeData.argsAs<PickProductVariantsRouteArgs>(
          orElse: () => const PickProductVariantsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PickProductVariantsView(
          key: args.key,
          selectProductsReq: args.selectProductsReq,
        ),
      );
    },
    PickProductsRoute.name: (routeData) {
      final args = routeData.argsAs<PickProductsRouteArgs>(
          orElse: () => const PickProductsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PickProductsView(
          key: args.key,
          pickProductsReq: args.pickProductsReq,
        ),
      );
    },
    PickRegionsRoute.name: (routeData) {
      final args = routeData.argsAs<PickRegionsRouteArgs>(
          orElse: () => const PickRegionsRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PickRegionsView(
          key: args.key,
          pickRegionsReq: args.pickRegionsReq,
        ),
      );
    },
    PriceListDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PriceListDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PriceListDetailsView(
          args.priceList,
          key: args.key,
        ),
      );
    },
    PricingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PricingView(),
      );
    },
    ProductAddVariantRoute.name: (routeData) {
      final args = routeData.argsAs<ProductAddVariantRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductAddVariantView(
          args.productVariantReq,
          key: args.key,
        ),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailsView(
          args.productId,
          key: args.key,
        ),
      );
    },
    ProductGiftCardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductGiftCardsView(),
      );
    },
    ProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductsView(),
      );
    },
    RegionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RegionDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RegionDetailsView(
          args.regionId,
          key: args.key,
        ),
      );
    },
    RegionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegionsView(),
      );
    },
    ResetPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResetPasswordView(),
      );
    },
    ReturnReasonsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReturnReasonsView(),
      );
    },
    SalesChannelDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<SalesChannelDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SalesChannelDetailsView(
          args.salesChannel,
          key: args.key,
        ),
      );
    },
    SalesChannelsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SalesChannelsView(),
      );
    },
    SelectCountryRoute.name: (routeData) {
      final args = routeData.argsAs<SelectCountryRouteArgs>(
          orElse: () => const SelectCountryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectCountryView(
          key: args.key,
          selectCountryReq: args.selectCountryReq,
        ),
      );
    },
    ShippingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShippingView(),
      );
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SignInView(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    StoreDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoreDetailsView(),
      );
    },
    StoreSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StoreSettingsView(),
      );
    },
    TaxSettingsSelectRegionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TaxSettingsSelectRegionView(),
      );
    },
    TaxSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<TaxSettingsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TaxSettingsView(
          args.region,
          key: args.key,
        ),
      );
    },
    TeamRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeamView(),
      );
    },
    TransferOrderRoute.name: (routeData) {
      final args = routeData.argsAs<TransferOrderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: TransferOrderView(
          args.order,
          key: args.key,
        ),
      );
    },
    UpdateConditionRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateConditionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UpdateConditionView(
          args.updateConditionReq,
          key: args.key,
        ),
      );
    },
    UrlConfigureRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UrlConfigureView(),
      );
    },
  };
}

/// generated route for
/// [ActivityView]
class ActivityRoute extends PageRouteInfo<void> {
  const ActivityRoute({List<PageRouteInfo>? children})
      : super(
          ActivityRoute.name,
          initialChildren: children,
        );

  static const String name = 'ActivityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddRegionView]
class AddRegionRoute extends PageRouteInfo<AddRegionRouteArgs> {
  AddRegionRoute({
    Key? key,
    Region? region,
    List<PageRouteInfo>? children,
  }) : super(
          AddRegionRoute.name,
          args: AddRegionRouteArgs(
            key: key,
            region: region,
          ),
          initialChildren: children,
        );

  static const String name = 'AddRegionRoute';

  static const PageInfo<AddRegionRouteArgs> page =
      PageInfo<AddRegionRouteArgs>(name);
}

class AddRegionRouteArgs {
  const AddRegionRouteArgs({
    this.key,
    this.region,
  });

  final Key? key;

  final Region? region;

  @override
  String toString() {
    return 'AddRegionRouteArgs{key: $key, region: $region}';
  }
}

/// generated route for
/// [AddUpdateApiKeyView]
class AddUpdateApiKeyRoute extends PageRouteInfo<AddUpdateApiKeyRouteArgs> {
  AddUpdateApiKeyRoute({
    Key? key,
    PublishableApiKey? publishableApiKey,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateApiKeyRoute.name,
          args: AddUpdateApiKeyRouteArgs(
            key: key,
            publishableApiKey: publishableApiKey,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateApiKeyRoute';

  static const PageInfo<AddUpdateApiKeyRouteArgs> page =
      PageInfo<AddUpdateApiKeyRouteArgs>(name);
}

class AddUpdateApiKeyRouteArgs {
  const AddUpdateApiKeyRouteArgs({
    this.key,
    this.publishableApiKey,
  });

  final Key? key;

  final PublishableApiKey? publishableApiKey;

  @override
  String toString() {
    return 'AddUpdateApiKeyRouteArgs{key: $key, publishableApiKey: $publishableApiKey}';
  }
}

/// generated route for
/// [AddUpdateCustomerView]
class AddUpdateCustomerRoute extends PageRouteInfo<AddUpdateCustomerRouteArgs> {
  AddUpdateCustomerRoute({
    Key? key,
    Customer? customer,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateCustomerRoute.name,
          args: AddUpdateCustomerRouteArgs(
            key: key,
            customer: customer,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateCustomerRoute';

  static const PageInfo<AddUpdateCustomerRouteArgs> page =
      PageInfo<AddUpdateCustomerRouteArgs>(name);
}

class AddUpdateCustomerRouteArgs {
  const AddUpdateCustomerRouteArgs({
    this.key,
    this.customer,
  });

  final Key? key;

  final Customer? customer;

  @override
  String toString() {
    return 'AddUpdateCustomerRouteArgs{key: $key, customer: $customer}';
  }
}

/// generated route for
/// [AddUpdateDiscountView]
class AddUpdateDiscountRoute extends PageRouteInfo<AddUpdateDiscountRouteArgs> {
  AddUpdateDiscountRoute({
    Key? key,
    Discount? discount,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateDiscountRoute.name,
          args: AddUpdateDiscountRouteArgs(
            key: key,
            discount: discount,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateDiscountRoute';

  static const PageInfo<AddUpdateDiscountRouteArgs> page =
      PageInfo<AddUpdateDiscountRouteArgs>(name);
}

class AddUpdateDiscountRouteArgs {
  const AddUpdateDiscountRouteArgs({
    this.key,
    this.discount,
  });

  final Key? key;

  final Discount? discount;

  @override
  String toString() {
    return 'AddUpdateDiscountRouteArgs{key: $key, discount: $discount}';
  }
}

/// generated route for
/// [AddUpdateOrderEditView]
class AddUpdateOrderEditRoute
    extends PageRouteInfo<AddUpdateOrderEditRouteArgs> {
  AddUpdateOrderEditRoute({
    required Order? order,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateOrderEditRoute.name,
          args: AddUpdateOrderEditRouteArgs(
            order: order,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateOrderEditRoute';

  static const PageInfo<AddUpdateOrderEditRouteArgs> page =
      PageInfo<AddUpdateOrderEditRouteArgs>(name);
}

class AddUpdateOrderEditRouteArgs {
  const AddUpdateOrderEditRouteArgs({
    required this.order,
    this.key,
  });

  final Order? order;

  final Key? key;

  @override
  String toString() {
    return 'AddUpdateOrderEditRouteArgs{order: $order, key: $key}';
  }
}

/// generated route for
/// [AddUpdatePriceListView]
class AddUpdatePriceListRoute
    extends PageRouteInfo<AddUpdatePriceListRouteArgs> {
  AddUpdatePriceListRoute({
    Key? key,
    String? id,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdatePriceListRoute.name,
          args: AddUpdatePriceListRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdatePriceListRoute';

  static const PageInfo<AddUpdatePriceListRouteArgs> page =
      PageInfo<AddUpdatePriceListRouteArgs>(name);
}

class AddUpdatePriceListRouteArgs {
  const AddUpdatePriceListRouteArgs({
    this.key,
    this.id,
  });

  final Key? key;

  final String? id;

  @override
  String toString() {
    return 'AddUpdatePriceListRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [AddUpdateProductView]
class AddUpdateProductRoute extends PageRouteInfo<AddUpdateProductRouteArgs> {
  AddUpdateProductRoute({
    Key? key,
    UpdateProductReq? updateProductReq,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateProductRoute.name,
          args: AddUpdateProductRouteArgs(
            key: key,
            updateProductReq: updateProductReq,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateProductRoute';

  static const PageInfo<AddUpdateProductRouteArgs> page =
      PageInfo<AddUpdateProductRouteArgs>(name);
}

class AddUpdateProductRouteArgs {
  const AddUpdateProductRouteArgs({
    this.key,
    this.updateProductReq,
  });

  final Key? key;

  final UpdateProductReq? updateProductReq;

  @override
  String toString() {
    return 'AddUpdateProductRouteArgs{key: $key, updateProductReq: $updateProductReq}';
  }
}

/// generated route for
/// [AddUpdateSalesChannelView]
class AddUpdateSalesChannelRoute
    extends PageRouteInfo<AddUpdateSalesChannelRouteArgs> {
  AddUpdateSalesChannelRoute({
    Key? key,
    SalesChannel? salesChannel,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateSalesChannelRoute.name,
          args: AddUpdateSalesChannelRouteArgs(
            key: key,
            salesChannel: salesChannel,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateSalesChannelRoute';

  static const PageInfo<AddUpdateSalesChannelRouteArgs> page =
      PageInfo<AddUpdateSalesChannelRouteArgs>(name);
}

class AddUpdateSalesChannelRouteArgs {
  const AddUpdateSalesChannelRouteArgs({
    this.key,
    this.salesChannel,
  });

  final Key? key;

  final SalesChannel? salesChannel;

  @override
  String toString() {
    return 'AddUpdateSalesChannelRouteArgs{key: $key, salesChannel: $salesChannel}';
  }
}

/// generated route for
/// [AddUpdateShippingOptionView]
class AddUpdateShippingOptionRoute
    extends PageRouteInfo<AddUpdateShippingOptionRouteArgs> {
  AddUpdateShippingOptionRoute({
    required AddUpdateShippingOptionReq addUpdateShippingOptionReq,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateShippingOptionRoute.name,
          args: AddUpdateShippingOptionRouteArgs(
            addUpdateShippingOptionReq: addUpdateShippingOptionReq,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateShippingOptionRoute';

  static const PageInfo<AddUpdateShippingOptionRouteArgs> page =
      PageInfo<AddUpdateShippingOptionRouteArgs>(name);
}

class AddUpdateShippingOptionRouteArgs {
  const AddUpdateShippingOptionRouteArgs({
    required this.addUpdateShippingOptionReq,
    this.key,
  });

  final AddUpdateShippingOptionReq addUpdateShippingOptionReq;

  final Key? key;

  @override
  String toString() {
    return 'AddUpdateShippingOptionRouteArgs{addUpdateShippingOptionReq: $addUpdateShippingOptionReq, key: $key}';
  }
}

/// generated route for
/// [AddUpdateTaxRateView]
class AddUpdateTaxRateRoute extends PageRouteInfo<AddUpdateTaxRateRouteArgs> {
  AddUpdateTaxRateRoute({
    required AddUpdateTaxRateReq addUpdateTaxRateReq,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateTaxRateRoute.name,
          args: AddUpdateTaxRateRouteArgs(
            addUpdateTaxRateReq: addUpdateTaxRateReq,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateTaxRateRoute';

  static const PageInfo<AddUpdateTaxRateRouteArgs> page =
      PageInfo<AddUpdateTaxRateRouteArgs>(name);
}

class AddUpdateTaxRateRouteArgs {
  const AddUpdateTaxRateRouteArgs({
    required this.addUpdateTaxRateReq,
    this.key,
  });

  final AddUpdateTaxRateReq addUpdateTaxRateReq;

  final Key? key;

  @override
  String toString() {
    return 'AddUpdateTaxRateRouteArgs{addUpdateTaxRateReq: $addUpdateTaxRateReq, key: $key}';
  }
}

/// generated route for
/// [AddUpdateVariantsPriceView]
class AddUpdateVariantsPriceRoute
    extends PageRouteInfo<AddUpdateVariantsPriceRouteArgs> {
  AddUpdateVariantsPriceRoute({
    Key? key,
    List<MoneyAmount>? prices,
    required Product product,
    List<PageRouteInfo>? children,
  }) : super(
          AddUpdateVariantsPriceRoute.name,
          args: AddUpdateVariantsPriceRouteArgs(
            key: key,
            prices: prices,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'AddUpdateVariantsPriceRoute';

  static const PageInfo<AddUpdateVariantsPriceRouteArgs> page =
      PageInfo<AddUpdateVariantsPriceRouteArgs>(name);
}

class AddUpdateVariantsPriceRouteArgs {
  const AddUpdateVariantsPriceRouteArgs({
    this.key,
    this.prices,
    required this.product,
  });

  final Key? key;

  final List<MoneyAmount>? prices;

  final Product product;

  @override
  String toString() {
    return 'AddUpdateVariantsPriceRouteArgs{key: $key, prices: $prices, product: $product}';
  }
}

/// generated route for
/// [ApiKeyManagementView]
class ApiKeyManagementRoute extends PageRouteInfo<void> {
  const ApiKeyManagementRoute({List<PageRouteInfo>? children})
      : super(
          ApiKeyManagementRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApiKeyManagementRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppBarStyleView]
class AppBarStyleRoute extends PageRouteInfo<void> {
  const AppBarStyleRoute({List<PageRouteInfo>? children})
      : super(
          AppBarStyleRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppBarStyleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppDevSettingsView]
class AppDevSettingsRoute extends PageRouteInfo<void> {
  const AppDevSettingsRoute({List<PageRouteInfo>? children})
      : super(
          AppDevSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppDevSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppSettingsView]
class AppSettingsRoute extends PageRouteInfo<void> {
  const AppSettingsRoute({List<PageRouteInfo>? children})
      : super(
          AppSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AppUpdateView]
class AppUpdateRoute extends PageRouteInfo<void> {
  const AppUpdateRoute({List<PageRouteInfo>? children})
      : super(
          AppUpdateRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppUpdateRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoriesView]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CollectionDetailsView]
class CollectionDetailsRoute extends PageRouteInfo<CollectionDetailsRouteArgs> {
  CollectionDetailsRoute({
    required String collectionId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CollectionDetailsRoute.name,
          args: CollectionDetailsRouteArgs(
            collectionId: collectionId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CollectionDetailsRoute';

  static const PageInfo<CollectionDetailsRouteArgs> page =
      PageInfo<CollectionDetailsRouteArgs>(name);
}

class CollectionDetailsRouteArgs {
  const CollectionDetailsRouteArgs({
    required this.collectionId,
    this.key,
  });

  final String collectionId;

  final Key? key;

  @override
  String toString() {
    return 'CollectionDetailsRouteArgs{collectionId: $collectionId, key: $key}';
  }
}

/// generated route for
/// [CollectionsView]
class CollectionsRoute extends PageRouteInfo<void> {
  const CollectionsRoute({List<PageRouteInfo>? children})
      : super(
          CollectionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CollectionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ConditionCollectionView]
class ConditionCollectionRoute
    extends PageRouteInfo<ConditionCollectionRouteArgs> {
  ConditionCollectionRoute({
    Key? key,
    List<ProductCollection>? disabledCollections,
    List<PageRouteInfo>? children,
  }) : super(
          ConditionCollectionRoute.name,
          args: ConditionCollectionRouteArgs(
            key: key,
            disabledCollections: disabledCollections,
          ),
          initialChildren: children,
        );

  static const String name = 'ConditionCollectionRoute';

  static const PageInfo<ConditionCollectionRouteArgs> page =
      PageInfo<ConditionCollectionRouteArgs>(name);
}

class ConditionCollectionRouteArgs {
  const ConditionCollectionRouteArgs({
    this.key,
    this.disabledCollections,
  });

  final Key? key;

  final List<ProductCollection>? disabledCollections;

  @override
  String toString() {
    return 'ConditionCollectionRouteArgs{key: $key, disabledCollections: $disabledCollections}';
  }
}

/// generated route for
/// [ConditionCustomerGroupView]
class ConditionCustomerGroupRoute
    extends PageRouteInfo<ConditionCustomerGroupRouteArgs> {
  ConditionCustomerGroupRoute({
    Key? key,
    List<CustomerGroup>? disabledGroups,
    List<PageRouteInfo>? children,
  }) : super(
          ConditionCustomerGroupRoute.name,
          args: ConditionCustomerGroupRouteArgs(
            key: key,
            disabledGroups: disabledGroups,
          ),
          initialChildren: children,
        );

  static const String name = 'ConditionCustomerGroupRoute';

  static const PageInfo<ConditionCustomerGroupRouteArgs> page =
      PageInfo<ConditionCustomerGroupRouteArgs>(name);
}

class ConditionCustomerGroupRouteArgs {
  const ConditionCustomerGroupRouteArgs({
    this.key,
    this.disabledGroups,
  });

  final Key? key;

  final List<CustomerGroup>? disabledGroups;

  @override
  String toString() {
    return 'ConditionCustomerGroupRouteArgs{key: $key, disabledGroups: $disabledGroups}';
  }
}

/// generated route for
/// [ConditionProductView]
class ConditionProductRoute extends PageRouteInfo<ConditionProductRouteArgs> {
  ConditionProductRoute({
    Key? key,
    List<Product>? disabledProducts,
    List<PageRouteInfo>? children,
  }) : super(
          ConditionProductRoute.name,
          args: ConditionProductRouteArgs(
            key: key,
            disabledProducts: disabledProducts,
          ),
          initialChildren: children,
        );

  static const String name = 'ConditionProductRoute';

  static const PageInfo<ConditionProductRouteArgs> page =
      PageInfo<ConditionProductRouteArgs>(name);
}

class ConditionProductRouteArgs {
  const ConditionProductRouteArgs({
    this.key,
    this.disabledProducts,
  });

  final Key? key;

  final List<Product>? disabledProducts;

  @override
  String toString() {
    return 'ConditionProductRouteArgs{key: $key, disabledProducts: $disabledProducts}';
  }
}

/// generated route for
/// [ConditionTagView]
class ConditionTagRoute extends PageRouteInfo<ConditionTagRouteArgs> {
  ConditionTagRoute({
    Key? key,
    List<ProductTag>? disabledTags,
    List<PageRouteInfo>? children,
  }) : super(
          ConditionTagRoute.name,
          args: ConditionTagRouteArgs(
            key: key,
            disabledTags: disabledTags,
          ),
          initialChildren: children,
        );

  static const String name = 'ConditionTagRoute';

  static const PageInfo<ConditionTagRouteArgs> page =
      PageInfo<ConditionTagRouteArgs>(name);
}

class ConditionTagRouteArgs {
  const ConditionTagRouteArgs({
    this.key,
    this.disabledTags,
  });

  final Key? key;

  final List<ProductTag>? disabledTags;

  @override
  String toString() {
    return 'ConditionTagRouteArgs{key: $key, disabledTags: $disabledTags}';
  }
}

/// generated route for
/// [ConditionTypeView]
class ConditionTypeRoute extends PageRouteInfo<ConditionTypeRouteArgs> {
  ConditionTypeRoute({
    Key? key,
    List<ProductType>? disabledTypes,
    List<PageRouteInfo>? children,
  }) : super(
          ConditionTypeRoute.name,
          args: ConditionTypeRouteArgs(
            key: key,
            disabledTypes: disabledTypes,
          ),
          initialChildren: children,
        );

  static const String name = 'ConditionTypeRoute';

  static const PageInfo<ConditionTypeRouteArgs> page =
      PageInfo<ConditionTypeRouteArgs>(name);
}

class ConditionTypeRouteArgs {
  const ConditionTypeRouteArgs({
    this.key,
    this.disabledTypes,
  });

  final Key? key;

  final List<ProductType>? disabledTypes;

  @override
  String toString() {
    return 'ConditionTypeRouteArgs{key: $key, disabledTypes: $disabledTypes}';
  }
}

/// generated route for
/// [CreateCollectionView]
class CreateCollectionRoute extends PageRouteInfo<CreateCollectionRouteArgs> {
  CreateCollectionRoute({
    Key? key,
    ProductCollection? collection,
    List<PageRouteInfo>? children,
  }) : super(
          CreateCollectionRoute.name,
          args: CreateCollectionRouteArgs(
            key: key,
            collection: collection,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateCollectionRoute';

  static const PageInfo<CreateCollectionRouteArgs> page =
      PageInfo<CreateCollectionRouteArgs>(name);
}

class CreateCollectionRouteArgs {
  const CreateCollectionRouteArgs({
    this.key,
    this.collection,
  });

  final Key? key;

  final ProductCollection? collection;

  @override
  String toString() {
    return 'CreateCollectionRouteArgs{key: $key, collection: $collection}';
  }
}

/// generated route for
/// [CreateDraftOrderView]
class CreateDraftOrderRoute extends PageRouteInfo<void> {
  const CreateDraftOrderRoute({List<PageRouteInfo>? children})
      : super(
          CreateDraftOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateDraftOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateUpdateCustomGiftCardView]
class CreateUpdateCustomGiftCardRoute
    extends PageRouteInfo<CreateUpdateCustomGiftCardRouteArgs> {
  CreateUpdateCustomGiftCardRoute({
    Key? key,
    GiftCard? giftCard,
    List<PageRouteInfo>? children,
  }) : super(
          CreateUpdateCustomGiftCardRoute.name,
          args: CreateUpdateCustomGiftCardRouteArgs(
            key: key,
            giftCard: giftCard,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateUpdateCustomGiftCardRoute';

  static const PageInfo<CreateUpdateCustomGiftCardRouteArgs> page =
      PageInfo<CreateUpdateCustomGiftCardRouteArgs>(name);
}

class CreateUpdateCustomGiftCardRouteArgs {
  const CreateUpdateCustomGiftCardRouteArgs({
    this.key,
    this.giftCard,
  });

  final Key? key;

  final GiftCard? giftCard;

  @override
  String toString() {
    return 'CreateUpdateCustomGiftCardRouteArgs{key: $key, giftCard: $giftCard}';
  }
}

/// generated route for
/// [CreateUpdateGroupView]
class CreateUpdateGroupRoute extends PageRouteInfo<CreateUpdateGroupRouteArgs> {
  CreateUpdateGroupRoute({
    Key? key,
    CustomerGroup? customerGroup,
    List<PageRouteInfo>? children,
  }) : super(
          CreateUpdateGroupRoute.name,
          args: CreateUpdateGroupRouteArgs(
            key: key,
            customerGroup: customerGroup,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateUpdateGroupRoute';

  static const PageInfo<CreateUpdateGroupRouteArgs> page =
      PageInfo<CreateUpdateGroupRouteArgs>(name);
}

class CreateUpdateGroupRouteArgs {
  const CreateUpdateGroupRouteArgs({
    this.key,
    this.customerGroup,
  });

  final Key? key;

  final CustomerGroup? customerGroup;

  @override
  String toString() {
    return 'CreateUpdateGroupRouteArgs{key: $key, customerGroup: $customerGroup}';
  }
}

/// generated route for
/// [CreateUpdateReturnReasonView]
class CreateUpdateReturnReasonRoute
    extends PageRouteInfo<CreateUpdateReturnReasonRouteArgs> {
  CreateUpdateReturnReasonRoute({
    Key? key,
    ReturnReason? returnReason,
    List<PageRouteInfo>? children,
  }) : super(
          CreateUpdateReturnReasonRoute.name,
          args: CreateUpdateReturnReasonRouteArgs(
            key: key,
            returnReason: returnReason,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateUpdateReturnReasonRoute';

  static const PageInfo<CreateUpdateReturnReasonRouteArgs> page =
      PageInfo<CreateUpdateReturnReasonRouteArgs>(name);
}

class CreateUpdateReturnReasonRouteArgs {
  const CreateUpdateReturnReasonRouteArgs({
    this.key,
    this.returnReason,
  });

  final Key? key;

  final ReturnReason? returnReason;

  @override
  String toString() {
    return 'CreateUpdateReturnReasonRouteArgs{key: $key, returnReason: $returnReason}';
  }
}

/// generated route for
/// [CurrenciesView]
class CurrenciesRoute extends PageRouteInfo<void> {
  const CurrenciesRoute({List<PageRouteInfo>? children})
      : super(
          CurrenciesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurrenciesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomGiftCardsView]
class CustomGiftCardsRoute extends PageRouteInfo<void> {
  const CustomGiftCardsRoute({List<PageRouteInfo>? children})
      : super(
          CustomGiftCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomGiftCardsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerDetailsView]
class CustomerDetailsRoute extends PageRouteInfo<CustomerDetailsRouteArgs> {
  CustomerDetailsRoute({
    required String customerId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CustomerDetailsRoute.name,
          args: CustomerDetailsRouteArgs(
            customerId: customerId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CustomerDetailsRoute';

  static const PageInfo<CustomerDetailsRouteArgs> page =
      PageInfo<CustomerDetailsRouteArgs>(name);
}

class CustomerDetailsRouteArgs {
  const CustomerDetailsRouteArgs({
    required this.customerId,
    this.key,
  });

  final String customerId;

  final Key? key;

  @override
  String toString() {
    return 'CustomerDetailsRouteArgs{customerId: $customerId, key: $key}';
  }
}

/// generated route for
/// [CustomersView]
class CustomersRoute extends PageRouteInfo<void> {
  const CustomersRoute({List<PageRouteInfo>? children})
      : super(
          CustomersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardView]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscountConditionsView]
class DiscountConditionsRoute
    extends PageRouteInfo<DiscountConditionsRouteArgs> {
  DiscountConditionsRoute({
    required DiscountConditionReq? discountConditionReq,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DiscountConditionsRoute.name,
          args: DiscountConditionsRouteArgs(
            discountConditionReq: discountConditionReq,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DiscountConditionsRoute';

  static const PageInfo<DiscountConditionsRouteArgs> page =
      PageInfo<DiscountConditionsRouteArgs>(name);
}

class DiscountConditionsRouteArgs {
  const DiscountConditionsRouteArgs({
    required this.discountConditionReq,
    this.key,
  });

  final DiscountConditionReq? discountConditionReq;

  final Key? key;

  @override
  String toString() {
    return 'DiscountConditionsRouteArgs{discountConditionReq: $discountConditionReq, key: $key}';
  }
}

/// generated route for
/// [DiscountDetailsView]
class DiscountDetailsRoute extends PageRouteInfo<DiscountDetailsRouteArgs> {
  DiscountDetailsRoute({
    required Discount discount,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DiscountDetailsRoute.name,
          args: DiscountDetailsRouteArgs(
            discount: discount,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DiscountDetailsRoute';

  static const PageInfo<DiscountDetailsRouteArgs> page =
      PageInfo<DiscountDetailsRouteArgs>(name);
}

class DiscountDetailsRouteArgs {
  const DiscountDetailsRouteArgs({
    required this.discount,
    this.key,
  });

  final Discount discount;

  final Key? key;

  @override
  String toString() {
    return 'DiscountDetailsRouteArgs{discount: $discount, key: $key}';
  }
}

/// generated route for
/// [DiscountsView]
class DiscountsRoute extends PageRouteInfo<void> {
  const DiscountsRoute({List<PageRouteInfo>? children})
      : super(
          DiscountsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscountsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DraftOrderDetailsView]
class DraftOrderDetailsRoute extends PageRouteInfo<DraftOrderDetailsRouteArgs> {
  DraftOrderDetailsRoute({
    required String draftId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DraftOrderDetailsRoute.name,
          args: DraftOrderDetailsRouteArgs(
            draftId: draftId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DraftOrderDetailsRoute';

  static const PageInfo<DraftOrderDetailsRouteArgs> page =
      PageInfo<DraftOrderDetailsRouteArgs>(name);
}

class DraftOrderDetailsRouteArgs {
  const DraftOrderDetailsRouteArgs({
    required this.draftId,
    this.key,
  });

  final String draftId;

  final Key? key;

  @override
  String toString() {
    return 'DraftOrderDetailsRouteArgs{draftId: $draftId, key: $key}';
  }
}

/// generated route for
/// [DraftOrdersView]
class DraftOrdersRoute extends PageRouteInfo<void> {
  const DraftOrdersRoute({List<PageRouteInfo>? children})
      : super(
          DraftOrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'DraftOrdersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GroupDetailsView]
class GroupDetailsRoute extends PageRouteInfo<GroupDetailsRouteArgs> {
  GroupDetailsRoute({
    required CustomerGroup customerGroup,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GroupDetailsRoute.name,
          args: GroupDetailsRouteArgs(
            customerGroup: customerGroup,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'GroupDetailsRoute';

  static const PageInfo<GroupDetailsRouteArgs> page =
      PageInfo<GroupDetailsRouteArgs>(name);
}

class GroupDetailsRouteArgs {
  const GroupDetailsRouteArgs({
    required this.customerGroup,
    this.key,
  });

  final CustomerGroup customerGroup;

  final Key? key;

  @override
  String toString() {
    return 'GroupDetailsRouteArgs{customerGroup: $customerGroup, key: $key}';
  }
}

/// generated route for
/// [GroupsView]
class GroupsRoute extends PageRouteInfo<void> {
  const GroupsRoute({List<PageRouteInfo>? children})
      : super(
          GroupsRoute.name,
          initialChildren: children,
        );

  static const String name = 'GroupsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ImagePreviewView]
class ImagePreviewRoute extends PageRouteInfo<ImagePreviewRouteArgs> {
  ImagePreviewRoute({
    Key? key,
    File? imageFile,
    String? imageUrl,
    Object? heroTag,
    bool disableHero = false,
    List<PageRouteInfo>? children,
  }) : super(
          ImagePreviewRoute.name,
          args: ImagePreviewRouteArgs(
            key: key,
            imageFile: imageFile,
            imageUrl: imageUrl,
            heroTag: heroTag,
            disableHero: disableHero,
          ),
          initialChildren: children,
        );

  static const String name = 'ImagePreviewRoute';

  static const PageInfo<ImagePreviewRouteArgs> page =
      PageInfo<ImagePreviewRouteArgs>(name);
}

class ImagePreviewRouteArgs {
  const ImagePreviewRouteArgs({
    this.key,
    this.imageFile,
    this.imageUrl,
    this.heroTag,
    this.disableHero = false,
  });

  final Key? key;

  final File? imageFile;

  final String? imageUrl;

  final Object? heroTag;

  final bool disableHero;

  @override
  String toString() {
    return 'ImagePreviewRouteArgs{key: $key, imageFile: $imageFile, imageUrl: $imageUrl, heroTag: $heroTag, disableHero: $disableHero}';
  }
}

/// generated route for
/// [ImportProductsView]
class ImportProductsRoute extends PageRouteInfo<void> {
  const ImportProductsRoute({List<PageRouteInfo>? children})
      : super(
          ImportProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImportProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MedusaSearchView]
class MedusaSearchRoute extends PageRouteInfo<MedusaSearchRouteArgs> {
  MedusaSearchRoute({
    Key? key,
    required SearchCategory searchCategory,
    List<PageRouteInfo>? children,
  }) : super(
          MedusaSearchRoute.name,
          args: MedusaSearchRouteArgs(
            key: key,
            searchCategory: searchCategory,
          ),
          initialChildren: children,
        );

  static const String name = 'MedusaSearchRoute';

  static const PageInfo<MedusaSearchRouteArgs> page =
      PageInfo<MedusaSearchRouteArgs>(name);
}

class MedusaSearchRouteArgs {
  const MedusaSearchRouteArgs({
    this.key,
    required this.searchCategory,
  });

  final Key? key;

  final SearchCategory searchCategory;

  @override
  String toString() {
    return 'MedusaSearchRouteArgs{key: $key, searchCategory: $searchCategory}';
  }
}

/// generated route for
/// [OrderCreateFulfillmentView]
class OrderCreateFulfillmentRoute
    extends PageRouteInfo<OrderCreateFulfillmentRouteArgs> {
  OrderCreateFulfillmentRoute({
    required Order order,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderCreateFulfillmentRoute.name,
          args: OrderCreateFulfillmentRouteArgs(
            order: order,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderCreateFulfillmentRoute';

  static const PageInfo<OrderCreateFulfillmentRouteArgs> page =
      PageInfo<OrderCreateFulfillmentRouteArgs>(name);
}

class OrderCreateFulfillmentRouteArgs {
  const OrderCreateFulfillmentRouteArgs({
    required this.order,
    this.key,
  });

  final Order order;

  final Key? key;

  @override
  String toString() {
    return 'OrderCreateFulfillmentRouteArgs{order: $order, key: $key}';
  }
}

/// generated route for
/// [OrderDetailsView]
class OrderDetailsRoute extends PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    required String orderId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            orderId: orderId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const PageInfo<OrderDetailsRouteArgs> page =
      PageInfo<OrderDetailsRouteArgs>(name);
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    required this.orderId,
    this.key,
  });

  final String orderId;

  final Key? key;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{orderId: $orderId, key: $key}';
  }
}

/// generated route for
/// [OrderSettingsView]
class OrderSettingsRoute extends PageRouteInfo<void> {
  const OrderSettingsRoute({List<PageRouteInfo>? children})
      : super(
          OrderSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrdersView]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonalInformationView]
class PersonalInformationRoute extends PageRouteInfo<void> {
  const PersonalInformationRoute({List<PageRouteInfo>? children})
      : super(
          PersonalInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalInformationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PickCustomerView]
class PickCustomerRoute extends PageRouteInfo<PickCustomerRouteArgs> {
  PickCustomerRoute({
    Key? key,
    PickCustomerReq? pickCustomerReq,
    List<PageRouteInfo>? children,
  }) : super(
          PickCustomerRoute.name,
          args: PickCustomerRouteArgs(
            key: key,
            pickCustomerReq: pickCustomerReq,
          ),
          initialChildren: children,
        );

  static const String name = 'PickCustomerRoute';

  static const PageInfo<PickCustomerRouteArgs> page =
      PageInfo<PickCustomerRouteArgs>(name);
}

class PickCustomerRouteArgs {
  const PickCustomerRouteArgs({
    this.key,
    this.pickCustomerReq,
  });

  final Key? key;

  final PickCustomerReq? pickCustomerReq;

  @override
  String toString() {
    return 'PickCustomerRouteArgs{key: $key, pickCustomerReq: $pickCustomerReq}';
  }
}

/// generated route for
/// [PickGroupsView]
class PickGroupsRoute extends PageRouteInfo<PickGroupsRouteArgs> {
  PickGroupsRoute({
    Key? key,
    PickGroupsReq? pickGroupsReq,
    List<PageRouteInfo>? children,
  }) : super(
          PickGroupsRoute.name,
          args: PickGroupsRouteArgs(
            key: key,
            pickGroupsReq: pickGroupsReq,
          ),
          initialChildren: children,
        );

  static const String name = 'PickGroupsRoute';

  static const PageInfo<PickGroupsRouteArgs> page =
      PageInfo<PickGroupsRouteArgs>(name);
}

class PickGroupsRouteArgs {
  const PickGroupsRouteArgs({
    this.key,
    this.pickGroupsReq,
  });

  final Key? key;

  final PickGroupsReq? pickGroupsReq;

  @override
  String toString() {
    return 'PickGroupsRouteArgs{key: $key, pickGroupsReq: $pickGroupsReq}';
  }
}

/// generated route for
/// [PickProductVariantsView]
class PickProductVariantsRoute
    extends PageRouteInfo<PickProductVariantsRouteArgs> {
  PickProductVariantsRoute({
    Key? key,
    SelectProductsReq? selectProductsReq,
    List<PageRouteInfo>? children,
  }) : super(
          PickProductVariantsRoute.name,
          args: PickProductVariantsRouteArgs(
            key: key,
            selectProductsReq: selectProductsReq,
          ),
          initialChildren: children,
        );

  static const String name = 'PickProductVariantsRoute';

  static const PageInfo<PickProductVariantsRouteArgs> page =
      PageInfo<PickProductVariantsRouteArgs>(name);
}

class PickProductVariantsRouteArgs {
  const PickProductVariantsRouteArgs({
    this.key,
    this.selectProductsReq,
  });

  final Key? key;

  final SelectProductsReq? selectProductsReq;

  @override
  String toString() {
    return 'PickProductVariantsRouteArgs{key: $key, selectProductsReq: $selectProductsReq}';
  }
}

/// generated route for
/// [PickProductsView]
class PickProductsRoute extends PageRouteInfo<PickProductsRouteArgs> {
  PickProductsRoute({
    Key? key,
    PickProductsReq? pickProductsReq,
    List<PageRouteInfo>? children,
  }) : super(
          PickProductsRoute.name,
          args: PickProductsRouteArgs(
            key: key,
            pickProductsReq: pickProductsReq,
          ),
          initialChildren: children,
        );

  static const String name = 'PickProductsRoute';

  static const PageInfo<PickProductsRouteArgs> page =
      PageInfo<PickProductsRouteArgs>(name);
}

class PickProductsRouteArgs {
  const PickProductsRouteArgs({
    this.key,
    this.pickProductsReq,
  });

  final Key? key;

  final PickProductsReq? pickProductsReq;

  @override
  String toString() {
    return 'PickProductsRouteArgs{key: $key, pickProductsReq: $pickProductsReq}';
  }
}

/// generated route for
/// [PickRegionsView]
class PickRegionsRoute extends PageRouteInfo<PickRegionsRouteArgs> {
  PickRegionsRoute({
    Key? key,
    PickRegionsReq? pickRegionsReq,
    List<PageRouteInfo>? children,
  }) : super(
          PickRegionsRoute.name,
          args: PickRegionsRouteArgs(
            key: key,
            pickRegionsReq: pickRegionsReq,
          ),
          initialChildren: children,
        );

  static const String name = 'PickRegionsRoute';

  static const PageInfo<PickRegionsRouteArgs> page =
      PageInfo<PickRegionsRouteArgs>(name);
}

class PickRegionsRouteArgs {
  const PickRegionsRouteArgs({
    this.key,
    this.pickRegionsReq,
  });

  final Key? key;

  final PickRegionsReq? pickRegionsReq;

  @override
  String toString() {
    return 'PickRegionsRouteArgs{key: $key, pickRegionsReq: $pickRegionsReq}';
  }
}

/// generated route for
/// [PriceListDetailsView]
class PriceListDetailsRoute extends PageRouteInfo<PriceListDetailsRouteArgs> {
  PriceListDetailsRoute({
    required PriceList priceList,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PriceListDetailsRoute.name,
          args: PriceListDetailsRouteArgs(
            priceList: priceList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PriceListDetailsRoute';

  static const PageInfo<PriceListDetailsRouteArgs> page =
      PageInfo<PriceListDetailsRouteArgs>(name);
}

class PriceListDetailsRouteArgs {
  const PriceListDetailsRouteArgs({
    required this.priceList,
    this.key,
  });

  final PriceList priceList;

  final Key? key;

  @override
  String toString() {
    return 'PriceListDetailsRouteArgs{priceList: $priceList, key: $key}';
  }
}

/// generated route for
/// [PricingView]
class PricingRoute extends PageRouteInfo<void> {
  const PricingRoute({List<PageRouteInfo>? children})
      : super(
          PricingRoute.name,
          initialChildren: children,
        );

  static const String name = 'PricingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductAddVariantView]
class ProductAddVariantRoute extends PageRouteInfo<ProductAddVariantRouteArgs> {
  ProductAddVariantRoute({
    required ProductVariantReq productVariantReq,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProductAddVariantRoute.name,
          args: ProductAddVariantRouteArgs(
            productVariantReq: productVariantReq,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductAddVariantRoute';

  static const PageInfo<ProductAddVariantRouteArgs> page =
      PageInfo<ProductAddVariantRouteArgs>(name);
}

class ProductAddVariantRouteArgs {
  const ProductAddVariantRouteArgs({
    required this.productVariantReq,
    this.key,
  });

  final ProductVariantReq productVariantReq;

  final Key? key;

  @override
  String toString() {
    return 'ProductAddVariantRouteArgs{productVariantReq: $productVariantReq, key: $key}';
  }
}

/// generated route for
/// [ProductDetailsView]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required String productId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            productId: productId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static const PageInfo<ProductDetailsRouteArgs> page =
      PageInfo<ProductDetailsRouteArgs>(name);
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    required this.productId,
    this.key,
  });

  final String productId;

  final Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{productId: $productId, key: $key}';
  }
}

/// generated route for
/// [ProductGiftCardsView]
class ProductGiftCardsRoute extends PageRouteInfo<void> {
  const ProductGiftCardsRoute({List<PageRouteInfo>? children})
      : super(
          ProductGiftCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductGiftCardsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductsView]
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute({List<PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegionDetailsView]
class RegionDetailsRoute extends PageRouteInfo<RegionDetailsRouteArgs> {
  RegionDetailsRoute({
    required String regionId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RegionDetailsRoute.name,
          args: RegionDetailsRouteArgs(
            regionId: regionId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RegionDetailsRoute';

  static const PageInfo<RegionDetailsRouteArgs> page =
      PageInfo<RegionDetailsRouteArgs>(name);
}

class RegionDetailsRouteArgs {
  const RegionDetailsRouteArgs({
    required this.regionId,
    this.key,
  });

  final String regionId;

  final Key? key;

  @override
  String toString() {
    return 'RegionDetailsRouteArgs{regionId: $regionId, key: $key}';
  }
}

/// generated route for
/// [RegionsView]
class RegionsRoute extends PageRouteInfo<void> {
  const RegionsRoute({List<PageRouteInfo>? children})
      : super(
          RegionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResetPasswordView]
class ResetPasswordRoute extends PageRouteInfo<void> {
  const ResetPasswordRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReturnReasonsView]
class ReturnReasonsRoute extends PageRouteInfo<void> {
  const ReturnReasonsRoute({List<PageRouteInfo>? children})
      : super(
          ReturnReasonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnReasonsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SalesChannelDetailsView]
class SalesChannelDetailsRoute
    extends PageRouteInfo<SalesChannelDetailsRouteArgs> {
  SalesChannelDetailsRoute({
    required SalesChannel salesChannel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SalesChannelDetailsRoute.name,
          args: SalesChannelDetailsRouteArgs(
            salesChannel: salesChannel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SalesChannelDetailsRoute';

  static const PageInfo<SalesChannelDetailsRouteArgs> page =
      PageInfo<SalesChannelDetailsRouteArgs>(name);
}

class SalesChannelDetailsRouteArgs {
  const SalesChannelDetailsRouteArgs({
    required this.salesChannel,
    this.key,
  });

  final SalesChannel salesChannel;

  final Key? key;

  @override
  String toString() {
    return 'SalesChannelDetailsRouteArgs{salesChannel: $salesChannel, key: $key}';
  }
}

/// generated route for
/// [SalesChannelsView]
class SalesChannelsRoute extends PageRouteInfo<void> {
  const SalesChannelsRoute({List<PageRouteInfo>? children})
      : super(
          SalesChannelsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SalesChannelsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SelectCountryView]
class SelectCountryRoute extends PageRouteInfo<SelectCountryRouteArgs> {
  SelectCountryRoute({
    Key? key,
    SelectCountryReq? selectCountryReq,
    List<PageRouteInfo>? children,
  }) : super(
          SelectCountryRoute.name,
          args: SelectCountryRouteArgs(
            key: key,
            selectCountryReq: selectCountryReq,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectCountryRoute';

  static const PageInfo<SelectCountryRouteArgs> page =
      PageInfo<SelectCountryRouteArgs>(name);
}

class SelectCountryRouteArgs {
  const SelectCountryRouteArgs({
    this.key,
    this.selectCountryReq,
  });

  final Key? key;

  final SelectCountryReq? selectCountryReq;

  @override
  String toString() {
    return 'SelectCountryRouteArgs{key: $key, selectCountryReq: $selectCountryReq}';
  }
}

/// generated route for
/// [ShippingView]
class ShippingRoute extends PageRouteInfo<void> {
  const ShippingRoute({List<PageRouteInfo>? children})
      : super(
          ShippingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShippingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignInView]
class SignInRoute extends PageRouteInfo<SignInRouteArgs> {
  SignInRoute({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          SignInRoute.name,
          args: SignInRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<SignInRouteArgs> page = PageInfo<SignInRouteArgs>(name);
}

class SignInRouteArgs {
  const SignInRouteArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoreDetailsView]
class StoreDetailsRoute extends PageRouteInfo<void> {
  const StoreDetailsRoute({List<PageRouteInfo>? children})
      : super(
          StoreDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoreDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StoreSettingsView]
class StoreSettingsRoute extends PageRouteInfo<void> {
  const StoreSettingsRoute({List<PageRouteInfo>? children})
      : super(
          StoreSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'StoreSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaxSettingsSelectRegionView]
class TaxSettingsSelectRegionRoute extends PageRouteInfo<void> {
  const TaxSettingsSelectRegionRoute({List<PageRouteInfo>? children})
      : super(
          TaxSettingsSelectRegionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaxSettingsSelectRegionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaxSettingsView]
class TaxSettingsRoute extends PageRouteInfo<TaxSettingsRouteArgs> {
  TaxSettingsRoute({
    required Region region,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TaxSettingsRoute.name,
          args: TaxSettingsRouteArgs(
            region: region,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TaxSettingsRoute';

  static const PageInfo<TaxSettingsRouteArgs> page =
      PageInfo<TaxSettingsRouteArgs>(name);
}

class TaxSettingsRouteArgs {
  const TaxSettingsRouteArgs({
    required this.region,
    this.key,
  });

  final Region region;

  final Key? key;

  @override
  String toString() {
    return 'TaxSettingsRouteArgs{region: $region, key: $key}';
  }
}

/// generated route for
/// [TeamView]
class TeamRoute extends PageRouteInfo<void> {
  const TeamRoute({List<PageRouteInfo>? children})
      : super(
          TeamRoute.name,
          initialChildren: children,
        );

  static const String name = 'TeamRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransferOrderView]
class TransferOrderRoute extends PageRouteInfo<TransferOrderRouteArgs> {
  TransferOrderRoute({
    required Order order,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          TransferOrderRoute.name,
          args: TransferOrderRouteArgs(
            order: order,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'TransferOrderRoute';

  static const PageInfo<TransferOrderRouteArgs> page =
      PageInfo<TransferOrderRouteArgs>(name);
}

class TransferOrderRouteArgs {
  const TransferOrderRouteArgs({
    required this.order,
    this.key,
  });

  final Order order;

  final Key? key;

  @override
  String toString() {
    return 'TransferOrderRouteArgs{order: $order, key: $key}';
  }
}

/// generated route for
/// [UpdateConditionView]
class UpdateConditionRoute extends PageRouteInfo<UpdateConditionRouteArgs> {
  UpdateConditionRoute({
    required UpdateConditionReq updateConditionReq,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          UpdateConditionRoute.name,
          args: UpdateConditionRouteArgs(
            updateConditionReq: updateConditionReq,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'UpdateConditionRoute';

  static const PageInfo<UpdateConditionRouteArgs> page =
      PageInfo<UpdateConditionRouteArgs>(name);
}

class UpdateConditionRouteArgs {
  const UpdateConditionRouteArgs({
    required this.updateConditionReq,
    this.key,
  });

  final UpdateConditionReq updateConditionReq;

  final Key? key;

  @override
  String toString() {
    return 'UpdateConditionRouteArgs{updateConditionReq: $updateConditionReq, key: $key}';
  }
}

/// generated route for
/// [UrlConfigureView]
class UrlConfigureRoute extends PageRouteInfo<void> {
  const UrlConfigureRoute({List<PageRouteInfo>? children})
      : super(
          UrlConfigureRoute.name,
          initialChildren: children,
        );

  static const String name = 'UrlConfigureRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
