class Student{
  late int id;
   late String firstName;
  late String lastName;
  late int grade;


   Student.whitId(int id,String firstName,String lastName,int grade){
     this.id=id;
     this.firstName=firstName;
     this.lastName=lastName;
     this.grade=grade;

   }
  Student(String firstName,String lastName,int grade){
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;

  }
  Student.withoutInfo(){

  }




   String get getFirstName{
     return "OGR -"+this.firstName;
}
void set setFirstName(String value){
     this.firstName=value;
}
String get getStatus{
  String message = "";
  if (this.grade >= 50) {
    message = "pass";
  } else if (this.grade >= 40) {
    message = "you have chance to fix";
  } else {
    message = "you failed honey";
  }
  return message;
}

}