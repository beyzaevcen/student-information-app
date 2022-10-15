import 'package:btkdart/models/student.dart';
import 'package:btkdart/screens/students_add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student selectedStudent=Student.whitId(0,"", "",0);

  List<Student> students = [
    Student.whitId(1,"Nesibe", "Özcan", 45),
    Student.whitId(2,"Nida", "Toprak", 55),
    Student.whitId(3,"İnci", "Agan", 20),
    Student.whitId(4,"Beyza", "Evcen", 100),
    Student.whitId(5,"Zehra", "Öztürk", 50),
    Student.whitId(6,"Aysu", "Akbaba", 33),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text("Student Tracking System"),
      ),
      body: buildBody(context),
    );
  }


  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      backgroundColor: Colors.purple[50],
      title: Text("Operation Result"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2022/10/01/21/25/woman-7492273_1280.jpg"),
                  ),
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Exam score: " +
                      students[index].grade.toString() +
                      "[" +students[index].getStatus +
                      "]"),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    } );
                    print(selectedStudent.firstName);
                  },
                );
              }),
        ),
        Text("Seçili Öğrenci: " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd()));

                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("New"),
                  ],
                ),
                color: Colors.orangeAccent[100],
              ),
            )
            ,
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                onPressed: () {

                  var mesaj = "Updated";
                  mesajGoster(context, mesaj);
                },
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0,),
                    Text("Update "),
                  ],
                ),
                color: Colors.green[200],
              ),
            )
            ,
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  students.remove(selectedStudent);
                  var mesaj = "Deleted: "+selectedStudent.firstName;
                  mesajGoster(context, mesaj);
                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                    Text("Delete "),
                  ],
                ),
                color: Colors.redAccent[100],
              ),
            )

          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
