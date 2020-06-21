class SingleImageUploadModel {
  int status;
  String message;
  String imageUrl;

  SingleImageUploadModel({this.status,this.message, this.imageUrl});

  SingleImageUploadModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    imageUrl = json['imageUrl'];
  }
}