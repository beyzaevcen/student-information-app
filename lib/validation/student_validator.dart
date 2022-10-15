class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "Name has to be at least 2 character";
    }
    return "sa";
  }

}