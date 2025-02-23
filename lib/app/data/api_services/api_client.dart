import 'package:dio/dio.dart';
import '../api_constants/app_urls.dart';

class DioClient {
  Dio init({bool withToken = true,bool withUsersId = false}) {
    Dio dio = Dio();
    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = AppUrls.baseUrl;
    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  ApiInterceptors();
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    options.headers["Content-Type"] = 'application/json';
  }
}