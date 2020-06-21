class PostCallFormDataModel {
  int status;
  String message;
  Student student;

  PostCallFormDataModel({this.status, this.message, this.student});

  PostCallFormDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

}

class Student {
  String id;
  String name;
  String age;

  Student({this.id, this.name, this.age});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }
}
