import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }

  Future<Response> getData({required String url, dynamic query}) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  Future<Response> postData(
      {required String url,
      dynamic query,
      required Map<String, dynamic> data}) async {
    return await dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
