class SingleImageUploadWithDataModel {
  int status;
  String message;
  Student student;

  SingleImageUploadWithDataModel({this.status, this.message,this.student});

  SingleImageUploadWithDataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    student =
    json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    return data;
  }
}

class Student {
  String name;
  String age;
  String imageUrl;

  Student({this.name, this.age, this.imageUrl});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}