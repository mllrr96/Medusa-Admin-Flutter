// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:medusa_admin/core/error/medusa_error.dart';
// import 'package:medusa_admin/core/di/di.dart';
// import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
// import 'package:multiple_result/multiple_result.dart';
//
// @lazySingleton
// class InviteCrudUseCase {
//   UserRepository get _userRepository => getIt<MedusaAdmin>().userRepository;
//
//   InvitesRepository get _inviteRepository => getIt<MedusaAdmin>().inviteRepository;
//
//   static InviteCrudUseCase get instance => getIt<InviteCrudUseCase>();
//
//   Future<Result<RetrieveUserListRes, MedusaError>> fetchUsers() async {
//     try {
//       final result = await _userRepository.retrieveAll();
//       return Success(result!);
//     } on DioException catch (e) {
//       return Error(MedusaError.fromHttp(
//         status: e.response?.statusCode,
//         body: e.response?.data,
//         cause: e,
//       ));
//     } catch (error, stack) {
//       if (kDebugMode) {
//         log(error.toString());
//         log(stack.toString());
//       }
//       return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
//     }
//   }
//
//   Future<Result<RetrieveInvitesRes, MedusaError>> fetchInvites() async {
//     try {
//       final result = await _inviteRepository.retrieveInvites();
//       return Success(result!);
//     } on DioException catch (e) {
//       return Error(MedusaError.fromHttp(
//         status: e.response?.statusCode,
//         body: e.response?.data,
//         cause: e,
//       ));
//     } catch (error, stack) {
//       if (kDebugMode) {
//         log(error.toString());
//         log(stack.toString());
//       }
//       return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
//     }
//   }
//
//   Future<Result<bool, MedusaError>> inviteUser({
//     required String email,
//     required UserRole role,
//   }) async {
//     try {
//       final result = await _inviteRepository.createInvitation(email: email, role: role);
//       return Success(result!);
//     } on DioException catch (e) {
//       return Error(MedusaError.fromHttp(
//         status: e.response?.statusCode,
//         body: e.response?.data,
//         cause: e,
//       ));
//     } catch (error, stack) {
//       if (kDebugMode) {
//         log(error.toString());
//         log(stack.toString());
//       }
//       return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
//     }
//   }
//
//   Future<Result<bool, MedusaError>> resendInvite(String inviteId) async {
//     try {
//       final result = await _inviteRepository.resendInvite(inviteId: inviteId);
//       return Success(result!);
//     } on DioException catch (e) {
//       return Error(MedusaError.fromHttp(
//         status: e.response?.statusCode,
//         body: e.response?.data,
//         cause: e,
//       ));
//     } catch (error, stack) {
//       if (kDebugMode) {
//         log(error.toString());
//         log(stack.toString());
//       }
//       return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
//     }
//   }
//
//   Future<Result<bool, MedusaError>> acceptInvite(
//       AcceptInvitationReq userAcceptInvitationReq) async {
//     try {
//       final result = await _inviteRepository.acceptInvitation(
//           userAcceptInvitationReq: userAcceptInvitationReq);
//       return Success(result!);
//     } on DioException catch (e) {
//       return Error(MedusaError.fromHttp(
//         status: e.response?.statusCode,
//         body: e.response?.data,
//         cause: e,
//       ));
//     } catch (error, stack) {
//       if (kDebugMode) {
//         log(error.toString());
//         log(stack.toString());
//       }
//       return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
//     }
//   }
//
//   Future<Result<DeleteInvitesRes, MedusaError>> deleteInvite(String inviteId) async {
//     try {
//       final result = await _inviteRepository.deleteInvite(inviteId: inviteId);
//       return Success(result!);
//     } on DioException catch (e) {
//       return Error(MedusaError.fromHttp(
//         status: e.response?.statusCode,
//         body: e.response?.data,
//         cause: e,
//       ));
//     } catch (error, stack) {
//       if (kDebugMode) {
//         log(error.toString());
//         log(stack.toString());
//       }
//       return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
//     }
//   }
//
//   Future<Result<User, MedusaError>> updateUser({
//     required String id,
//     required UpdateUserReq userUpdateUserReq,
//   }) async {
//     try {
//       final result = await _userRepository.update(id: id, userUpdateUserReq: userUpdateUserReq);
//       return Success(result!);
//     } on DioException catch (e) {
//       return Error(MedusaError.fromHttp(
//         status: e.response?.statusCode,
//         body: e.response?.data,
//         cause: e,
//       ));
//     } catch (error, stack) {
//       if (kDebugMode) {
//         log(error.toString());
//         log(stack.toString());
//       }
//       return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
//     }
//   }
//
//   Future<Result<DeleteUserRes, MedusaError>> deleteUser(
//     String id,
//   ) async {
//     try {
//       final result = await _userRepository.delete(id: id);
//       return Success(result!);
//     } on DioException catch (e) {
//       return Error(MedusaError.fromHttp(
//         status: e.response?.statusCode,
//         body: e.response?.data,
//         cause: e,
//       ));
//     } catch (error, stack) {
//       if (kDebugMode) {
//         log(error.toString());
//         log(stack.toString());
//       }
//       return Error(MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
//     }
//   }
// }
