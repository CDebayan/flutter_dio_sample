class NoteListResponse {
  List<NotesModel> noteList;
  int success;
  String message;

  NoteListResponse({this.noteList, this.success, this.message});

  NoteListResponse.fromJson(Map<String, dynamic> json) {
    if (json['noteList'] != null) {
      noteList = new List<NotesModel>();
      json['noteList'].forEach((v) {
        noteList.add(new NotesModel.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.noteList != null) {
      data['noteList'] = this.noteList.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

class NotesModel {
  String id;
  String note;
  String datetime;
  String priority;

  NotesModel({this.id, this.note, this.datetime, this.priority});

  NotesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
    datetime = json['datetime'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['note'] = this.note;
    data['datetime'] = this.datetime;
    data['priority'] = this.priority;
    return data;
  }
}


class NoteResponse {
  int success;
  String message;

  NoteResponse({this.success, this.message});

  NoteResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    return data;
  }
}

