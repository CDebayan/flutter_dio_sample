import 'package:dio/dio.dart';
import 'package:flutterdiosample/services/dio_client.dart';

class DioInterceptor extends InterceptorsWrapper{
  @override
  Future onRequest(RequestOptions options) async{
    options.headers["token"] = DioClient.token;
    options.baseUrl = DioClient.baseUrl;

    print("Request : ${options.method},${options.baseUrl}${options.path.toString()}");
    print("Request : ${options.headers.toString()}");
    return options;
  }

  @override
  Future onResponse(Response response) async{
    print("Response : ${response.request.method},${response.request.baseUrl}${response.request.path}");
    print("Response : ${response.toString()}");
    return response;
  }

  @override
  Future onError(DioError err) async{
    return err;
  }
}