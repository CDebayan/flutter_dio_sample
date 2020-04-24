import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdiosample/data/dio_services.dart';
import 'package:flutterdiosample/model/note_list_model.dart';


class GetCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder<NoteListResponse>(
        future: DioServices.getNoteList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _buildNoteList(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}

Widget _buildNoteList(NoteListResponse data) {
  if (data != null) {
    if (data.success == 1) {
      if (data.noteList != null) {
        var notesList = data.noteList;
        return ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index) {
            return _buildNoteItem(notesList[index]);
          },
        );
      }
    } else if (data.success == 0) {
      return Center(
        child: Text("Your Own Message"),
      );
    } else if (data.success == -1) {
      return Center(
        child: Text(data.message),
      );
    }
  }

  return Center(
    child: Text("Something Went Wrong"),
  );
}

Widget _buildNoteItem(NotesModel noteItem) {
  return Card(
    margin: EdgeInsets.only(top: 16, left: 16, right: 16),
    child: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(noteItem.note),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(noteItem.datetime),
              Text(noteItem.priority),
            ],
          ),
        ],
      ),
    ),
  );
}
