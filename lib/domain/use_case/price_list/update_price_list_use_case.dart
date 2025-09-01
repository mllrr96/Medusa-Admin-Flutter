// import 'package:injectable/injectable.dart';
// import 'package:medusa_admin/core/error/medusa_error.dart';
// import 'package:medusa_admin/core/di/di.dart';
// import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
// import 'package:multiple_result/multiple_result.dart';
//
// @lazySingleton
// class UpdatePriceListUseCase {
//   PriceListRepository get _priceListRepository =>
//       getIt<MedusaAdmin>().priceListRepository;
//
//   static UpdatePriceListUseCase get instance => getIt<UpdatePriceListUseCase>();
//
//   Future<Result<PriceList, MedusaError>> create(
//       CreatePriceListReq userCreatePriceListReq) async {
//     try {
//       final result = await _priceListRepository.createPriceList(
//           userCreatePriceListReq: userCreatePriceListReq);
//       return Success(result!);
//     } catch (e) {
//       return Error(Failure.from(e));
//     }
//   }
//
//   Future<Result<PriceList, MedusaError>> update({
//     required UpdatePriceListReq payload,
//     required String id,
//   }) async {
//     try {
//       final result = await _priceListRepository.updatePriceList(
//           id: id, userUpdatePriceListReq: payload);
//       return Success(result!);
//     } catch (e) {
//       return Error(Failure.from(e));
//     }
//   }
//
//   Future<Result<PriceList, MedusaError>> fetch({
//     required String id,
//   }) async {
//     try {
//       final result = await _priceListRepository.retrievePriceList(id: id);
//       return Success(result!);
//     } catch (e) {
//       return Error(Failure.from(e));
//     }
//   }
// }
