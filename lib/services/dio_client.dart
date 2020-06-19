import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutterdiosample/services/dio_interceptor.dart';

class DioClient {
  static final Dio dio = Dio();
  static final String baseUrl = "http://192.168.0.5:3001/apisamples/";
  static String token = "your token";

  static Dio _invoke() {
    dio.interceptors.add(DioInterceptor());
    return dio;
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
    return GeneralError(status: -1, message: "HttpException");
  } else if (e.error is FormatException) {
    return GeneralError(status: -1, message: "FormatException");
  }else if(e.type is DioErrorType){
    return GeneralError(status: e.response.statusCode, message: e.message);
  }
  return null;
}

class GeneralError{
  int status;
  String message;
  GeneralError({this.status,this.message});
}
