import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateProductUseCase {
  ProductsRepository get _productsRepository =>
      getIt<MedusaAdmin>().productsRepository;
  ProductTypeRepository get _typeRepository =>
      getIt<MedusaAdmin>().productTypeRepository;
  CollectionRepository get _collectionRepository =>
      getIt<MedusaAdmin>().collectionRepository;
  UploadRepository get _uploadRepository =>
      getIt<MedusaAdmin>().uploadRepository;
  SalesChannelRepository get _salesChannelRepository =>
      getIt<MedusaAdmin>().salesChannelRepository;

  static UpdateProductUseCase get instance => getIt<UpdateProductUseCase>();

  Future<Result<Product, Failure>> addProduct(
      UserPostProductReq userPostProductReq) async {
    try {
      final result =
          await _productsRepository.add(userPostProductReq: userPostProductReq);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<Product, Failure>> updateProduct({
    required UserPostUpdateProductReq userPostUpdateProductReq,
    required String id,
  }) async {
    try {
      final result = await _productsRepository.update(
          userPostUpdateProductReq: userPostUpdateProductReq, id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserRetrieveProductTypesRes, Failure>> retrieveProductTypes(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _typeRepository.retrieveProductTypes(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserCollectionsRes, Failure>> retrieveCollections(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _collectionRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<List<String>, Failure>> uploadFile(List<File> files) async {
    try {
      final result = await _uploadRepository.uploadFile(files: files, customHeaders: {'Content-Type': 'image/jpeg'});
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserDeleteFileRes, Failure>> deleteFile({required String fileKey}) async {
    try {
      final result = await _uploadRepository.deleteFile( fileKey: fileKey);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserSalesChannelRetrieveAllRes, Failure>> retrieveSalesChannels(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _salesChannelRepository.retrieveAll(
          queryParams: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
