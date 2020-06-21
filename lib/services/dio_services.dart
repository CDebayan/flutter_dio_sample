import 'package:dio/dio.dart';
import 'package:flutterdiosample/model/get_call_list_model.dart';
import 'package:flutterdiosample/model/get_call_model.dart';
import 'package:flutterdiosample/model/get_call_path_model.dart';
import 'package:flutterdiosample/model/get_call_query_model.dart';
import 'package:flutterdiosample/model/post_call_body_model.dart';
import 'package:flutterdiosample/model/post_call_form_data_model.dart';
import 'package:flutterdiosample/model/single_image_upload_model.dart';
import 'package:path/path.dart';
import 'dio_client.dart';

class DioServices {
  static Future<GetCallModel> getCall() async {
    try {
      var response = await DioClient.getCall('getCall');
      GetCallModel getCallModel = GetCallModel.fromJson(response);
      return getCallModel;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return GetCallModel(
          status: generalError.status, message: generalError.message);
    }
  }

  static Future<GetCallListModel> getCallList() async {
    try {
      var response = await DioClient.getCall('getCallList');
      GetCallListModel getCallListModel = GetCallListModel.fromJson(response);
      return getCallListModel;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return GetCallListModel(
          status: generalError.status, message: generalError.message);
    }
  }

  static Future<GetCallPathModel> getCallPath(
      int id, String name, int age) async {
    try {
      var response = await DioClient.getCall('getCallPathParam/$id/$name/$age');
      GetCallPathModel getCallPathModel = GetCallPathModel.fromJson(response);
      return getCallPathModel;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return GetCallPathModel(
          status: generalError.status, message: generalError.message);
    }
  }

  static Future<GetCallQueryModel> getCallQuery(
      String id, String name, String age) async {
    try {
      var response = await DioClient.getCall('getCallQueryParam',
          queryParameters: {
            "id": id,
            "name": name,
            "age": age
          });
      GetCallQueryModel getCallQueryModel = GetCallQueryModel.fromJson(response);
      return getCallQueryModel;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return GetCallQueryModel(
          status: generalError.status, message: generalError.message);
    }
  }

  static Future<PostCallBodyModel> postCallBody(PostCallStudent postCallStudent) async {
    try {
      var response = await DioClient.postCall('postCallBody',
          bodyData: postCallStudent.toJson());
      PostCallBodyModel postCallBodyModel = PostCallBodyModel.fromJson(response);
      return postCallBodyModel;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return PostCallBodyModel(
          status: generalError.status, message: generalError.message);
    }
  }

  static Future<PostCallFormDataModel> postCallFormData(String id, String name, String age) async {
    try {
      FormData formData = new FormData.fromMap({
        "id": id,
        "name": name,
        "age": age,
      });

      var response = await DioClient.postCall('postCallFormData',
          formData: formData);
      PostCallFormDataModel postCallFormDataModel = PostCallFormDataModel.fromJson(response);
      return postCallFormDataModel;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return PostCallFormDataModel(
          status: generalError.status, message: generalError.message);
    }
  }

  static Future<SingleImageUploadModel> uploadImage(String imagePath) async {
    try {
      FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(imagePath, filename: basename(imagePath)),
      });
      var response = await DioClient.postCall('singleImageUpload', formData: formData);
      SingleImageUploadModel imageResponse = SingleImageUploadModel.fromJson(response);
      return imageResponse;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return SingleImageUploadModel(
          status: generalError.status, message: generalError.message);
    }
  }

}
