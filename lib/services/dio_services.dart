import 'package:dio/dio.dart';
import 'package:flutterdiosample/model/get_call_list_model.dart';
import 'package:flutterdiosample/model/get_call_model.dart';

import 'dio_client.dart';

class DioServices {
  static Future<GetCallModel> getCall() async {
    try {
      var response = await DioClient.getCall('getCall');
      GetCallModel getCallModel = GetCallModel.fromJson(response);
      return getCallModel;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return GetCallModel(status: generalError.status, message: generalError.message);
    }
  }

  static Future<GetCallListModel> getCallList() async {
    try {
      var response = await DioClient.getCall('getCallList');
      GetCallListModel getCallListModel = GetCallListModel.fromJson(response);
      return getCallListModel;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return GetCallListModel(status: generalError.status, message: generalError.message);
    }
  }


















//  static Future<NoteListResponse> getNoteById(String id) async {
//    try {
//      Response response =
//          await DioClient.getCall('', queryParameters: {"id": id});
//      NoteListResponse noteListResponse =
//          NoteListResponse.fromJson(response.data);
//      return noteListResponse;
//    } on DioError catch (e) {
//      GeneralError generalError = error(e);
//      return NoteListResponse(
//          success: generalError.status, message: generalError.message);
//    }
//  }
//
//  static Future<NoteResponse> addNoteBody(NotesModel notesModel) async {
//    try {
//      var response = await DioClient.postCall('notes/addNoteBody.php',
//          bodyData: notesModel.toJson());
//      NoteResponse noteResponse = NoteResponse.fromJson(response);
//      return noteResponse;
//    } on DioError catch (e) {
//      GeneralError generalError = error(e);
//      return NoteResponse(
//          success: generalError.status, message: generalError.message);
//    }
//  }
//
//  static Future<NoteResponse> addNoteFormData(
//      String note, String date, String priority) async {
//    try {
//      FormData formData = new FormData.fromMap({
//        "note": note,
//        "datetime": date,
//        "priority": priority,
//      });
//      var response = await DioClient.postCall('notes/addNoteFormData.php',
//          formData: formData);
//      NoteResponse noteResponse = NoteResponse.fromJson(response);
//      return noteResponse;
//    } on DioError catch (e) {
//      GeneralError generalError = error(e);
//      return NoteResponse(
//          success: generalError.status, message: generalError.message);
//    }
//  }
//
//  static Future<ImageResponse> uploadImage(
//      String name, String imagePath) async {
//    try {
//      FormData formData = FormData.fromMap({
//        "data": name,
//        "avatar": await MultipartFile.fromFile(imagePath, filename: basename(imagePath)),
//      });
//      var response =
//          await DioClient.postCall('others/requestSomething.php', formData: formData);
//      ImageResponse imageResponse = ImageResponse.fromJson(response);
//      return imageResponse;
//    } on DioError catch (e) {
//      GeneralError generalError = error(e);
//      return ImageResponse(
//          success: generalError.status, message: generalError.message);
//    }
//  }
//
//  static Future<NoteResponse> refreshToken(String data) async {
//    try {
//      FormData formData = new FormData.fromMap({
//        "data": data,
//      });
//      var response = await DioClient.postCall('others/requestSomething.php',
//          formData: formData);
//      NoteResponse noteResponse = NoteResponse.fromJson(response);
//      return noteResponse;
//    } on DioError catch (e) {
//      GeneralError generalError = error(e);
//
////      if(generalError.status == 403){
////        var re =await refreshToken(data);
////        return re;
////      }
//
//      return NoteResponse(success: generalError.status, message: generalError.message);
//    }
//  }
}
