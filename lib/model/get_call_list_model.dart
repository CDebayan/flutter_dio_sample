class GetCallListModel {
  int status;
  String message;
  List<StudentList> studentList;

  GetCallListModel({this.status, this.message,this.studentList});

  GetCallListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['studentList'] != null) {
      studentList = new List<StudentList>();
      json['studentList'].forEach((v) {
        studentList.add(new StudentList.fromJson(v));
      });
    }
  }
}

class StudentList {
  int id;
  String name;
  int age;

  StudentList({this.id, this.name, this.age});

  StudentList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }
}