import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseRepository {
  final Dio client;

  BaseRepository(this.client);
}
