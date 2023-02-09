import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:medusa_admin/core/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioService extends GetxService {
  static DioService instance = Get.find<DioService>();

  Dio dio = Dio();

  Future<DioService> init() async {
    dio.options = BaseOptions(baseUrl: AppConstants.baseUrl, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    // if (config.apiKey != null) {
    //   dio.options.headers["Authorization"] = "Bearer ${config.apiKey}";
    // }

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cookie = prefs.getString('Cookie');
      if (cookie != null && cookie.isNotEmpty) {
        options.headers['Cookie'] = cookie;
      }
      return handler.next(options);
    }));
    if (kDebugMode) dio.interceptors.add(LogInterceptor());
    return this;
  }
}
