import 'package:flutter/material.dart';
import 'package:flutterdiosample/functionality.dart';
import 'package:flutterdiosample/model/get_call_list_model.dart';
import 'package:flutterdiosample/services/dio_services.dart';
import 'package:flutterdiosample/widget/widgets.dart';

class GetCallListScreen extends StatefulWidget {
  @override
  _GetCallListScreenState createState() => _GetCallListScreenState();
}

class _GetCallListScreenState extends State<GetCallListScreen>
    with Functionality {
  List<StudentList> studentList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isValidList(studentList)
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(16),
                      itemCount: studentList.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          leading: Text(isValidObject(studentList[index].id)
                              ? studentList[index].id.toString()
                              : ""),
                          title: Text(
                            isValidString(studentList[index].name)
                                ? studentList[index].name
                                : "",
                          ),
                          trailing: Text(
                            isValidObject(studentList[index].age)
                                ? studentList[index].age.toString()
                                : "",
                          ),
                        );
                      },
                    )
                  : Container(),
              RaisedButton(
                child: Text("CLICK"),
                onPressed: () async {
                  GetCallListModel response = await DioServices.getCallList();
                  _setValue(response);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _setValue(GetCallListModel response) {
    if (isValidObject(response) &&
        isValidObject(response.status) &&
        response.status == 1) {
      if (isValidList(response.studentList)) {
        setState(() {
          studentList = response.studentList;
        });
      }
    } else {
      if (isValidString(response.message)) {
        showToast(message: response.message);
      }
    }
  }
}
