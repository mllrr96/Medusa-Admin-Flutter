import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/search/domain/usecases/search/search_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchUseCase) : super(const _Initial()) {
    on<_SearchProducts>(_searchProducts);
    on<_SearchOrders>(_searchOrders);
    on<_SearchDrafts>(_searchDrafts);
    on<_SearchCollections>(_searchCollections);
    on<_SearchCustomers>(_searchCustomers);
    on<_SearchGroups>(_searchGroups);
    on<_SearchGiftCards>(_searchGiftCards);
    on<_SearchDiscounts>(_searchDiscounts);
    on<_SearchPriceLists>(_searchPriceLists);
    on<_SearchTags>(_searchTags);
    on<_SearchRegions>(_searchRegions);
    on<_SearchSalesChannels>(_searchSalesChannels);
  }

  Future<void> _searchProducts(
      _SearchProducts event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result = await searchUseCase.fetchProducts(
        queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.products, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchOrders(
      _SearchOrders event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result =
        await searchUseCase.fetchOrders(queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.orders, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchDrafts(
      _SearchDrafts event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result =
        await searchUseCase.fetchDraftOrders(queryParameters: event.query);
    result.when((response) {
      emit(_Loaded(response.draftOrders, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchCollections(
      _SearchCollections event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result = await searchUseCase.fetchCollections(
        queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.collections, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchCustomers(
      _SearchCustomers event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result = await searchUseCase.fetchCustomers(
        queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.customers, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchGroups(
      _SearchGroups event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result = await searchUseCase.fetchCustomerGroups(
        queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.customerGroups, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchGiftCards(
      _SearchGiftCards event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result = await searchUseCase.fetchGiftCards(
        queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.giftCards, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchDiscounts(
      _SearchDiscounts event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result = await searchUseCase.fetchPromotions(
        queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.promotions, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchPriceLists(
      _SearchPriceLists event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result = await searchUseCase.fetchPriceLists(
        queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.priceLists, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchTags(_SearchTags event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result =
        await searchUseCase.fetchTags(queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.productTags, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchRegions(
      _SearchRegions event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result = await searchUseCase.fetchRegions(
        queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.regions, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _searchSalesChannels(
      _SearchSalesChannels event, Emitter<SearchState> emit) async {
    emit(const _Loading());
    final result = await searchUseCase.fetchSalesChannels(
        queryParameters: event.queryParameters);
    result.when((response) {
      emit(_Loaded(response.salesChannels, response.count));
    }, (error) {
      emit(_Error(error));
    });
  }

  static const int pageSize = 20;
  final SearchUseCase searchUseCase;
  static SearchBloc get instance => getIt<SearchBloc>();
}
