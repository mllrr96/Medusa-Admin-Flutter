// import 'package:injectable/injectable.dart';
// import 'package:medusa_admin/core/error/medusa_error.dart';
// import 'package:medusa_admin/core/di/di.dart';
// import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
// import 'package:multiple_result/multiple_result.dart';
//
// @lazySingleton
// class PriceListsUseCase {
//   PriceListRepository get _priceListRepository =>
//       getIt<MedusaAdmin>().priceListRepository;
//
//   static PriceListsUseCase get instance => getIt<PriceListsUseCase>();
//
//   Future<Result<PriceListsRes, MedusaError>> call({
//     Map<String, dynamic>? queryParameters,
//   }) async {
//     try {
//       final result = await _priceListRepository.retrievePriceLists(
//           queryParameters: queryParameters);
//       return Success(result!);
//     } catch (e) {
//       return Error(Failure.from(e));
//     }
//   }
// }
