// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i18;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i25;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:local_auth/local_auth.dart' as _i32;
import 'package:medusa_admin/core/di/module.dart' as _i98;
import 'package:medusa_admin/core/route/app_router.dart' as _i4;
import 'package:medusa_admin/data/helper/image_picker_helper.dart' as _i30;
import 'package:medusa_admin/data/service/auth_preference_service.dart' as _i75;
import 'package:medusa_admin/data/service/preference_service.dart' as _i87;
import 'package:medusa_admin/domain/use_case/api_key/api_key_use_case.dart'
    as _i3;
import 'package:medusa_admin/domain/use_case/app_update/check_update_use_case.dart'
    as _i96;
import 'package:medusa_admin/domain/use_case/auth/auth_use_case.dart' as _i5;
import 'package:medusa_admin/domain/use_case/auth/reset_password_use_case.dart'
    as _i51;
import 'package:medusa_admin/domain/use_case/auth/sign_out_use_case.dart'
    as _i58;
import 'package:medusa_admin/domain/use_case/batch_job/cancel_batch_job_use_case.dart'
    as _i6;
import 'package:medusa_admin/domain/use_case/batch_job/confirm_batch_job_use_case.dart'
    as _i11;
import 'package:medusa_admin/domain/use_case/batch_job/create_batch_job_use_case.dart'
    as _i12;
import 'package:medusa_admin/domain/use_case/batch_job/fetch_bach_job_use_case.dart'
    as _i24;
import 'package:medusa_admin/domain/use_case/category/categories_use_case.dart'
    as _i7;
import 'package:medusa_admin/domain/use_case/collection/collection_details_use_case.dart'
    as _i8;
import 'package:medusa_admin/domain/use_case/collection/collection_use_case.dart'
    as _i9;
import 'package:medusa_admin/domain/use_case/collection/collections_use_case.dart'
    as _i10;
import 'package:medusa_admin/domain/use_case/currency/currencies_use_case.dart'
    as _i14;
import 'package:medusa_admin/domain/use_case/customer/customer_use_case.dart'
    as _i16;
import 'package:medusa_admin/domain/use_case/customer/update_customer_use_case.dart'
    as _i15;
import 'package:medusa_admin/domain/use_case/discount/discount_crud_use_case.dart'
    as _i19;
import 'package:medusa_admin/domain/use_case/discount/discounts_use_case.dart'
    as _i20;
import 'package:medusa_admin/domain/use_case/discount/tags_use_case.dart'
    as _i59;
import 'package:medusa_admin/domain/use_case/discount/types_use_case.dart'
    as _i62;
import 'package:medusa_admin/domain/use_case/discount/update_condition_use_case.dart'
    as _i63;
import 'package:medusa_admin/domain/use_case/discount/update_discount_use_case.dart'
    as _i64;
import 'package:medusa_admin/domain/use_case/draft_order/create_draft_use_case.dart'
    as _i13;
import 'package:medusa_admin/domain/use_case/draft_order/draft_crud_use_case.dart'
    as _i21;
import 'package:medusa_admin/domain/use_case/draft_order/drafts_use_case.dart'
    as _i23;
import 'package:medusa_admin/domain/use_case/file/delete_file_use_case.dart'
    as _i17;
import 'package:medusa_admin/domain/use_case/file/get_file_url_use_case.dart'
    as _i26;
import 'package:medusa_admin/domain/use_case/file/upload_use_case.dart' as _i74;
import 'package:medusa_admin/domain/use_case/gift_card/gift_cards_use_case.dart'
    as _i27;
import 'package:medusa_admin/domain/use_case/gift_card/update_gift_card_use_case.dart'
    as _i65;
import 'package:medusa_admin/domain/use_case/group/group_crud_use_case.dart'
    as _i28;
import 'package:medusa_admin/domain/use_case/group/groups_use_case.dart'
    as _i29;
import 'package:medusa_admin/domain/use_case/group/update_group_use_case.dart'
    as _i66;
import 'package:medusa_admin/domain/use_case/order/order_details_use_case.dart'
    as _i33;
import 'package:medusa_admin/domain/use_case/order/order_edit_use_case.dart'
    as _i34;
import 'package:medusa_admin/domain/use_case/order/orders_filter_use_case.dart'
    as _i35;
import 'package:medusa_admin/domain/use_case/order/orders_use_case.dart'
    as _i36;
import 'package:medusa_admin/domain/use_case/order/retrieve_exported_orders_use_case.dart'
    as _i52;
import 'package:medusa_admin/domain/use_case/personal_info/personal_info_use_case.dart'
    as _i38;
import 'package:medusa_admin/domain/use_case/price_list/price_list_details_use_case.dart'
    as _i40;
import 'package:medusa_admin/domain/use_case/price_list/price_lists_use_case.dart'
    as _i41;
import 'package:medusa_admin/domain/use_case/price_list/update_price_list_use_case.dart'
    as _i67;
import 'package:medusa_admin/domain/use_case/product/pick_products_use_case.dart'
    as _i39;
import 'package:medusa_admin/domain/use_case/product/product_crud_use_case.dart'
    as _i43;
import 'package:medusa_admin/domain/use_case/product/product_type_use_case.dart'
    as _i44;
import 'package:medusa_admin/domain/use_case/product/product_variants_use_case.dart'
    as _i46;
import 'package:medusa_admin/domain/use_case/product/products_filter_use_case.dart'
    as _i47;
import 'package:medusa_admin/domain/use_case/product/products_use_case.dart'
    as _i48;
import 'package:medusa_admin/domain/use_case/product/update_product_use_case.dart'
    as _i68;
import 'package:medusa_admin/domain/use_case/region/region_details_use_case.dart'
    as _i49;
import 'package:medusa_admin/domain/use_case/region/regions_use_case.dart'
    as _i50;
import 'package:medusa_admin/domain/use_case/region/shipping_option_use_case.dart'
    as _i57;
import 'package:medusa_admin/domain/use_case/region/update_region_use_case.dart'
    as _i69;
import 'package:medusa_admin/domain/use_case/region/update_shipping_option_use_case.dart'
    as _i71;
import 'package:medusa_admin/domain/use_case/return_reason/return_reasons_use_case.dart'
    as _i53;
import 'package:medusa_admin/domain/use_case/return_reason/update_return_reason_use_case.dart'
    as _i70;
import 'package:medusa_admin/domain/use_case/sales_channel/sales_channel_crud_use_case.dart'
    as _i54;
import 'package:medusa_admin/domain/use_case/search/search_use_case.dart'
    as _i55;
import 'package:medusa_admin/domain/use_case/store/load_store_use_case.dart'
    as _i31;
import 'package:medusa_admin/domain/use_case/store/update_store_use_case.dart'
    as _i72;
import 'package:medusa_admin/domain/use_case/tax_rate/tax_settings_use_case.dart'
    as _i60;
import 'package:medusa_admin/domain/use_case/tax_rate/update_tax_rate_use_case.dart'
    as _i73;
import 'package:medusa_admin/domain/use_case/team/team_use_case.dart' as _i61;
import 'package:medusa_admin/presentation/blocs/app_update/app_update_bloc.dart'
    as _i97;
import 'package:medusa_admin/presentation/blocs/authentication/authentication_bloc.dart'
    as _i76;
import 'package:medusa_admin/presentation/blocs/collection_crud/collection_crud_bloc.dart'
    as _i77;
import 'package:medusa_admin/presentation/blocs/customer_crud/customer_crud_bloc.dart'
    as _i78;
import 'package:medusa_admin/presentation/blocs/discount_condition/discount_condition_bloc.dart'
    as _i79;
import 'package:medusa_admin/presentation/blocs/discount_crud/discount_crud_bloc.dart'
    as _i80;
import 'package:medusa_admin/presentation/blocs/draft_order_crud/draft_order_crud_bloc.dart'
    as _i22;
import 'package:medusa_admin/presentation/blocs/gift_card_crud/gift_card_crud_bloc.dart'
    as _i81;
import 'package:medusa_admin/presentation/blocs/group_crud/group_crud_bloc.dart'
    as _i82;
import 'package:medusa_admin/presentation/blocs/order_crud/order_crud_bloc.dart'
    as _i84;
import 'package:medusa_admin/presentation/blocs/orders/orders_bloc.dart'
    as _i85;
import 'package:medusa_admin/presentation/blocs/orders_filter/orders_filter_bloc.dart'
    as _i86;
import 'package:medusa_admin/presentation/blocs/pricing/pricing_crud_bloc.dart'
    as _i42;
import 'package:medusa_admin/presentation/blocs/product_crud/product_crud_bloc.dart'
    as _i88;
import 'package:medusa_admin/presentation/blocs/sales_channel_crud/sales_channel_crud_bloc.dart'
    as _i91;
import 'package:medusa_admin/presentation/blocs/search/search_bloc.dart'
    as _i92;
import 'package:medusa_admin/presentation/blocs/store/store_bloc.dart' as _i93;
import 'package:medusa_admin/presentation/cubits/language/language_cubit.dart'
    as _i83;
import 'package:medusa_admin/presentation/cubits/product_types/product_types_cubit.dart'
    as _i45;
import 'package:medusa_admin/presentation/cubits/products_filter/products_filter_cubit.dart'
    as _i89;
import 'package:medusa_admin/presentation/cubits/reset_password/reset_password_cubit.dart'
    as _i90;
import 'package:medusa_admin/presentation/cubits/theme/theme_cubit.dart'
    as _i94;
import 'package:medusa_admin/presentation/cubits/upload_files/upload_files_cubit.dart'
    as _i95;
import 'package:package_info_plus/package_info_plus.dart' as _i37;
import 'package:shared_preferences/shared_preferences.dart' as _i56;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerCoreDependencies = _$RegisterCoreDependencies();
    gh.lazySingleton<_i3.ApiKeyUseCase>(() => _i3.ApiKeyUseCase());
    gh.factory<_i4.AppRouter>(() => registerCoreDependencies.appRouter);
    gh.lazySingleton<_i5.AuthenticationUseCase>(
        () => _i5.AuthenticationUseCase());
    gh.lazySingleton<_i6.CancelBatchJobUseCase>(
        () => _i6.CancelBatchJobUseCase());
    gh.lazySingleton<_i7.CategoriesUseCase>(() => _i7.CategoriesUseCase());
    gh.lazySingleton<_i8.CollectionCrudUseCase>(
        () => _i8.CollectionCrudUseCase());
    gh.lazySingleton<_i9.CollectionUseCase>(() => _i9.CollectionUseCase());
    gh.lazySingleton<_i10.CollectionsUseCase>(() => _i10.CollectionsUseCase());
    gh.lazySingleton<_i11.ConfirmBatchJobUseCase>(
        () => _i11.ConfirmBatchJobUseCase());
    gh.lazySingleton<_i12.CreateBatchJobUseCase>(
        () => _i12.CreateBatchJobUseCase());
    gh.lazySingleton<_i13.CreateDraftUseCase>(() => _i13.CreateDraftUseCase());
    gh.lazySingleton<_i14.CurrenciesUseCase>(() => _i14.CurrenciesUseCase());
    gh.lazySingleton<_i15.CustomerCrudUseCase>(
        () => _i15.CustomerCrudUseCase());
    gh.lazySingleton<_i16.CustomerUseCase>(() => _i16.CustomerUseCase());
    gh.lazySingleton<_i17.DeleteFileUseCase>(() => _i17.DeleteFileUseCase());
    gh.factory<_i18.Dio>(() => registerCoreDependencies.dio);
    gh.lazySingleton<_i19.DiscountCrudUseCase>(
        () => _i19.DiscountCrudUseCase());
    gh.lazySingleton<_i20.DiscountsUseCase>(() => _i20.DiscountsUseCase());
    gh.lazySingleton<_i21.DraftCrudUseCase>(() => _i21.DraftCrudUseCase());
    gh.factory<_i22.DraftOrderCrudBloc>(
        () => _i22.DraftOrderCrudBloc(gh<_i21.DraftCrudUseCase>()));
    gh.lazySingleton<_i23.DraftsUseCase>(() => _i23.DraftsUseCase());
    gh.lazySingleton<_i24.FetchBatchJobUseCase>(
        () => _i24.FetchBatchJobUseCase());
    gh.factory<_i25.FlutterSecureStorage>(
        () => registerCoreDependencies.securePrefs);
    gh.lazySingleton<_i26.GetFileUrlUseCase>(() => _i26.GetFileUrlUseCase());
    gh.lazySingleton<_i27.GiftCardsUseCase>(() => _i27.GiftCardsUseCase());
    gh.lazySingleton<_i28.GroupCrudUseCase>(() => _i28.GroupCrudUseCase());
    gh.lazySingleton<_i29.GroupsUseCase>(() => _i29.GroupsUseCase());
    gh.singleton<_i30.ImagePickerHelper>(_i30.ImagePickerHelper());
    gh.lazySingleton<_i31.LoadStoreUseCase>(() => _i31.LoadStoreUseCase());
    gh.factory<_i32.LocalAuthentication>(() => registerCoreDependencies.auth);
    gh.lazySingleton<_i33.OrderCrudUseCase>(() => _i33.OrderCrudUseCase());
    gh.lazySingleton<_i34.OrderEditUseCase>(() => _i34.OrderEditUseCase());
    gh.lazySingleton<_i35.OrdersFilterUseCase>(
        () => _i35.OrdersFilterUseCase());
    gh.lazySingleton<_i36.OrdersUseCase>(() => _i36.OrdersUseCase());
    await gh.factoryAsync<_i37.PackageInfo>(
      () => registerCoreDependencies.packageInfo,
      preResolve: true,
    );
    gh.lazySingleton<_i38.PersonalInfoUseCase>(
        () => _i38.PersonalInfoUseCase());
    gh.lazySingleton<_i39.PickProductsUseCase>(
        () => _i39.PickProductsUseCase());
    gh.lazySingleton<_i40.PriceListCrudUseCase>(
        () => _i40.PriceListCrudUseCase());
    gh.lazySingleton<_i41.PriceListsUseCase>(() => _i41.PriceListsUseCase());
    gh.factory<_i42.PricingCrudBloc>(
        () => _i42.PricingCrudBloc(gh<_i40.PriceListCrudUseCase>()));
    gh.lazySingleton<_i43.ProductCrudUseCase>(() => _i43.ProductCrudUseCase());
    gh.lazySingleton<_i44.ProductTypeUseCase>(() => _i44.ProductTypeUseCase());
    gh.factory<_i45.ProductTypesCubit>(
        () => _i45.ProductTypesCubit(gh<_i44.ProductTypeUseCase>()));
    gh.lazySingleton<_i46.ProductVariantsUseCase>(
        () => _i46.ProductVariantsUseCase());
    gh.lazySingleton<_i47.ProductsFilterUseCase>(
        () => _i47.ProductsFilterUseCase());
    gh.lazySingleton<_i48.ProductsUseCase>(() => _i48.ProductsUseCase());
    gh.lazySingleton<_i49.RegionDetailsUseCase>(
        () => _i49.RegionDetailsUseCase());
    gh.lazySingleton<_i50.RegionsUseCase>(() => _i50.RegionsUseCase());
    gh.lazySingleton<_i51.ResetPasswordUseCase>(
        () => _i51.ResetPasswordUseCase());
    gh.lazySingleton<_i52.RetrieveExportedOrdersUseCase>(
        () => _i52.RetrieveExportedOrdersUseCase());
    gh.lazySingleton<_i53.ReturnReasonsUseCase>(
        () => _i53.ReturnReasonsUseCase());
    gh.lazySingleton<_i54.SalesChannelCrudUseCase>(
        () => _i54.SalesChannelCrudUseCase());
    gh.lazySingleton<_i55.SearchUseCase>(() => _i55.SearchUseCase());
    await gh.factoryAsync<_i56.SharedPreferences>(
      () => registerCoreDependencies.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i57.ShippingOptionUseCase>(
        () => _i57.ShippingOptionUseCase());
    gh.lazySingleton<_i58.SignOutUseCase>(() => _i58.SignOutUseCase());
    gh.lazySingleton<_i59.TagsUseCase>(() => _i59.TagsUseCase());
    gh.lazySingleton<_i60.TaxSettingsUseCase>(() => _i60.TaxSettingsUseCase());
    gh.lazySingleton<_i61.TeamUseCase>(() => _i61.TeamUseCase());
    gh.lazySingleton<_i62.TypesUseCase>(() => _i62.TypesUseCase());
    gh.lazySingleton<_i63.UpdateConditionUseCase>(
        () => _i63.UpdateConditionUseCase());
    gh.lazySingleton<_i64.UpdateDiscountUseCase>(
        () => _i64.UpdateDiscountUseCase());
    gh.lazySingleton<_i65.UpdateGiftCardUseCase>(
        () => _i65.UpdateGiftCardUseCase());
    gh.lazySingleton<_i66.UpdateGroupUseCase>(() => _i66.UpdateGroupUseCase());
    gh.lazySingleton<_i67.UpdatePriceListUseCase>(
        () => _i67.UpdatePriceListUseCase());
    gh.lazySingleton<_i68.UpdateProductUseCase>(
        () => _i68.UpdateProductUseCase());
    gh.lazySingleton<_i69.UpdateRegionUseCase>(
        () => _i69.UpdateRegionUseCase());
    gh.lazySingleton<_i70.UpdateReturnReasonUseCase>(
        () => _i70.UpdateReturnReasonUseCase());
    gh.lazySingleton<_i71.UpdateShippingOptionUseCase>(
        () => _i71.UpdateShippingOptionUseCase());
    gh.lazySingleton<_i72.UpdateStoreUseCase>(() => _i72.UpdateStoreUseCase());
    gh.lazySingleton<_i73.UpdateTaxRateUseCase>(
        () => _i73.UpdateTaxRateUseCase());
    gh.lazySingleton<_i74.UploadUseCase>(() => _i74.UploadUseCase());
    await gh.singletonAsync<_i75.AuthPreferenceService>(
      () {
        final i = _i75.AuthPreferenceService(
          gh<_i56.SharedPreferences>(),
          gh<_i25.FlutterSecureStorage>(),
        );
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i76.AuthenticationBloc>(() => _i76.AuthenticationBloc(
          gh<_i75.AuthPreferenceService>(),
          gh<_i5.AuthenticationUseCase>(),
          gh<_i25.FlutterSecureStorage>(),
        ));
    gh.factory<_i77.CollectionCrudBloc>(
        () => _i77.CollectionCrudBloc(gh<_i8.CollectionCrudUseCase>()));
    gh.factory<_i78.CustomerCrudBloc>(
        () => _i78.CustomerCrudBloc(gh<_i15.CustomerCrudUseCase>()));
    gh.factory<_i79.DiscountConditionBloc>(
        () => _i79.DiscountConditionBloc(gh<_i63.UpdateConditionUseCase>()));
    gh.factory<_i80.DiscountCrudBloc>(
        () => _i80.DiscountCrudBloc(gh<_i19.DiscountCrudUseCase>()));
    gh.factory<_i81.GiftCardCrudBloc>(
        () => _i81.GiftCardCrudBloc(gh<_i27.GiftCardsUseCase>()));
    gh.factory<_i82.GroupCrudBloc>(
        () => _i82.GroupCrudBloc(gh<_i28.GroupCrudUseCase>()));
    gh.factory<_i83.LanguageCubit>(
        () => _i83.LanguageCubit(gh<_i56.SharedPreferences>()));
    gh.factory<_i84.OrderCrudBloc>(
        () => _i84.OrderCrudBloc(gh<_i33.OrderCrudUseCase>()));
    gh.factory<_i85.OrdersBloc>(
        () => _i85.OrdersBloc(gh<_i36.OrdersUseCase>()));
    gh.factory<_i86.OrdersFilterBloc>(
        () => _i86.OrdersFilterBloc(gh<_i35.OrdersFilterUseCase>()));
    gh.singleton<_i87.PreferenceService>(_i87.PreferenceService(
      gh<_i56.SharedPreferences>(),
      gh<_i25.FlutterSecureStorage>(),
    )..init());
    gh.factory<_i88.ProductCrudBloc>(
        () => _i88.ProductCrudBloc(gh<_i43.ProductCrudUseCase>()));
    gh.factory<_i89.ProductsFilterCubit>(
        () => _i89.ProductsFilterCubit(gh<_i47.ProductsFilterUseCase>()));
    gh.factory<_i90.ResetPasswordCubit>(
        () => _i90.ResetPasswordCubit(gh<_i51.ResetPasswordUseCase>()));
    gh.factory<_i91.SalesChannelCrudBloc>(
        () => _i91.SalesChannelCrudBloc(gh<_i54.SalesChannelCrudUseCase>()));
    gh.factory<_i92.SearchBloc>(
        () => _i92.SearchBloc(gh<_i55.SearchUseCase>()));
    gh.factory<_i93.StoreBloc>(() => _i93.StoreBloc(
          gh<_i31.LoadStoreUseCase>(),
          gh<_i72.UpdateStoreUseCase>(),
        ));
    gh.factory<_i94.ThemeCubit>(
        () => _i94.ThemeCubit(gh<_i87.PreferenceService>()));
    gh.factory<_i95.UploadFilesCubit>(() => _i95.UploadFilesCubit(
          gh<_i74.UploadUseCase>(),
          gh<_i17.DeleteFileUseCase>(),
          gh<_i26.GetFileUrlUseCase>(),
        ));
    gh.lazySingleton<_i96.CheckUpdateUseCase>(() => _i96.CheckUpdateUseCase(
          gh<_i18.Dio>(),
          gh<_i37.PackageInfo>(),
          gh<_i87.PreferenceService>(),
        ));
    gh.factory<_i97.AppUpdateBloc>(
        () => _i97.AppUpdateBloc(gh<_i96.CheckUpdateUseCase>()));
    return this;
  }
}

class _$RegisterCoreDependencies extends _i98.RegisterCoreDependencies {}
