import 'package:dio/dio.dart';

abstract class BaseApiService {

  Future<dynamic> getApi({required Dio client, required String url});

  Future<dynamic> putApi({required Dio client, required dynamic data, required String url});

  Future<dynamic> postApi({required Dio client, required dynamic data, required String url});

  Future<dynamic> deleteApi({required Dio client, required String url});

}