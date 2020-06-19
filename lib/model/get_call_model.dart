class GetCallModel {
  int status;
  String message;
  Student student;

  GetCallModel({this.status,this.message, this.student});

  GetCallModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
  }
}

class Student {
  int id;
  String name;
  int age;

  Student({this.id, this.name, this.age});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }
}