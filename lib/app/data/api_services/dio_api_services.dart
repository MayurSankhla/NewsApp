import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'base_api_service.dart';

class DioApiServices extends BaseApiService{

  @override
  Future getApi({required dio.Dio client, required String url}) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final dio.Response response = await client.get(url).timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);
      log("Mayur <><>422 responseJson ${responseJson.toString()}");
    } on dio.DioException catch (e) {
      log('Mayur <><>E : ${e.toString()}');
      if(e.response != null){
        responseJson = returnResponse(e.response!);
        Get.snackbar('Error', 'Something went wrong');
      }
    }
    log(responseJson.toString());
    return responseJson;
  }


  @override
  Future postApi({required dio.Dio client, required dynamic data, required String url}) async {
    // TODO: implement putApi
    throw UnimplementedError();
  }

  @override
  Future putApi({required dio.Dio client, required dynamic data, required String url}) {
    // TODO: implement putApi
    throw UnimplementedError();
  }

  @override
  Future deleteApi({required dio.Dio client, required String url}) {
    // TODO: implement deleteApi
    throw UnimplementedError();
  }

  dynamic returnResponse(dio.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 201:
        dynamic responseJson = response.data;
        return responseJson;
      case 400:
        dynamic responseJson = response.data;
        return responseJson;

      case 401:
        {
          dynamic responseJson = response.data;
          return responseJson;
        }
      case 405:
        {
          dynamic responseJson = response.data;
          return responseJson;
        }
      case 422:
        {
          dynamic responseJson = response.data;
          return responseJson;
        }

      case 302:
        dynamic responseJson = response.data;
        return responseJson;

      case 500:
        dynamic responseJson = response.data;
        return responseJson;

      default:
        throw Exception(
            'Error occurred while communicating with server ${response.statusCode}');
    }
  }
}