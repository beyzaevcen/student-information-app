import 'package:btkdart/models/student.dart';
import 'package:btkdart/validation/student_validator.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var student = Student.withoutInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ad new student"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField()
            ],
          ),
        ),
      ),
    );
  }

 buildFirstNameField() {

  }

  buildLastNameField() {}

  buildGradeField() {}
}
