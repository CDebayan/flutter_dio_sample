class PostCallBodyModel {
  int status;
  String message;
  PostCallStudent student;

  PostCallBodyModel({this.status, this.message, this.student});

  PostCallBodyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    student = json['student'] != null
        ? new PostCallStudent.fromJson(json['student'])
        : null;
  }
}

class PostCallStudent {
  int id;
  String name;
  int age;

  PostCallStudent({this.id, this.name, this.age});

  PostCallStudent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    return data;
  }
}
