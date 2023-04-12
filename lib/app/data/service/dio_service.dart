import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/app/data/datasource/remote/dio/dio_client.dart';
import 'package:medusa_admin/app/data/service/storage_service.dart';

class DioService extends GetxService {
  static DioService get instance => Get.find<DioService>();
  late DioClient dio;
  DioService init() {
    dio = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);
    return this;
  }
}
