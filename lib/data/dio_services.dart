import 'dart:io';
import 'package:flutterdiosample/model/image_response.dart';
import 'package:flutterdiosample/model/note_list_model.dart';
import 'package:path/path.dart';
import 'package:dio/dio.dart';

import 'dio_client.dart';

class DioServices {
  static Future<NoteListResponse> getNoteList() async {
    try {
      var response = await DioClient.getCall('notes/getNoteList.php');
      NoteListResponse noteListResponse = NoteListResponse.fromJson(response);
      return noteListResponse;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return NoteListResponse(
          success: generalError.status, message: generalError.message);
    }
  }

  static Future<NoteListResponse> getNoteById(String id) async {
    try {
      Response response =
          await DioClient.getCall('', queryParameters: {"id": id});
      NoteListResponse noteListResponse =
          NoteListResponse.fromJson(response.data);
      return noteListResponse;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return NoteListResponse(
          success: generalError.status, message: generalError.message);
    }
  }

  static Future<NoteResponse> addNoteBody(NotesModel notesModel) async {
    try {
      var response = await DioClient.postCall('notes/addNoteBody.php',
          bodyData: notesModel.toJson());
      NoteResponse noteResponse = NoteResponse.fromJson(response);
      return noteResponse;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return NoteResponse(
          success: generalError.status, message: generalError.message);
    }
  }

  static Future<NoteResponse> addNoteFormData(
      String note, String date, String priority) async {
    try {
      FormData formData = new FormData.fromMap({
        "note": note,
        "datetime": date,
        "priority": priority,
      });
      var response = await DioClient.postCall('notes/addNoteFormData.php',
          formData: formData);
      NoteResponse noteResponse = NoteResponse.fromJson(response);
      return noteResponse;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return NoteResponse(
          success: generalError.status, message: generalError.message);
    }
  }

  static Future<ImageResponse> uploadImage(
      String name, String imagePath) async {
    try {
      FormData formData = FormData.fromMap({
        "name": name,
        "image": await MultipartFile.fromFile(imagePath,
            filename: basename(imagePath)),
      });
      var response =
          await DioClient.postCall('uploadImage.php', formData: formData);
      ImageResponse imageResponse = ImageResponse.fromJson(response);
      return imageResponse;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return ImageResponse(
          success: generalError.status, message: generalError.message);
    }
  }

  static Future<NoteResponse> refreshToken(String data) async {
    try {
      FormData formData = new FormData.fromMap({
        "data": data,
      });
      var response = await DioClient.postCall('others/requestSomething.php',
          formData: formData);
      NoteResponse noteResponse = NoteResponse.fromJson(response);
      return noteResponse;
    } on DioError catch (e) {
      GeneralError generalError = error(e);
      return NoteResponse(success: generalError.status, message: generalError.message);
    }
  }
}
