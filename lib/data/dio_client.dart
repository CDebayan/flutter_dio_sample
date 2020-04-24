import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio();
  static final String _baseUrl = "http://192.168.0.7/generalapis/scripts/notes/";

  static Dio _invoke() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.headers["token"] = "your token";
      options.baseUrl = _baseUrl;

//      // print requests
//      print("Pre request:${options.method},${options.baseUrl}${options.path.toString()}");
//      print("Pre request:${options.headers.toString()}");
//
//      return options;
//    }, onResponse: (Response response) async {
//      print("Response From:${response.request.method},${response.request.baseUrl}${response.request.path}");
//      print("Response From:${response.toString()}");
    }));
    _dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));
    return _dio;
  }



  static getCall(String path, {Map<String, String> queryParameters}) async{
    Response response = await _invoke().get(path,queryParameters: queryParameters);
    if(response != null){
      if(response.data != null){
        if(response.data is String){
          return json.decode(response.data);
        }else if(response.data is Map){
          return response.data;
        }
      }
    }
    return null;
  }

  static postCall(String path, {Map<String, dynamic> bodyData,FormData formData}) async{
    Response response;
    if(bodyData != null && formData == null){
      response = await _invoke().post(path,data: bodyData);
    }else if(bodyData == null && formData != null){
      response = await _invoke().post(path,data: formData);
    }else if(bodyData == null && formData == null){
      response = await _invoke().post(path);
    }

    if(response != null){
      if(response.data != null){
        if(response.data is String){
          return json.decode(response.data);
        }else if(response.data is Map){
          return response.data;
        }
      }
    }
    return null;
  }
}

GeneralError error(DioError e){
  if (e.error is SocketException) {
  } else if (e.error is HttpException) {
    return GeneralError(success: -1, message: "HttpException");
  } else if (e.error is FormatException) {
    return GeneralError(success: -1, message: "FormatException");
  }else if(e.type is DioErrorType){
    return GeneralError(success: -1, message: "HttpException");
  }
  return null;
}

class GeneralError{
  int success;
  String message;
  GeneralError({this.success,this.message});
}
