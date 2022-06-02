// - max 6 character
String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Telefon belginizi girizin!";
  } else
    return null;
}
String? keyWordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "Achar sozuni girizin!";
  } else
    return null;
}

String? emailValidator(String? value) {
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (value!.isEmpty) {
    return 'Fill empty input..';
  } else if (!emailRegExp.hasMatch(value)) {
    return 'PLease enter valid email';
  }
  return null;
}

String? passwordValidator(String? val) {
  final passwordRegExp = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
  if (val!.isEmpty) {
    return 'Fill empty input..';
  } else if (!passwordRegExp.hasMatch(val)) {
    return 'PLease enter valid password, it must be 8 charecters';
  }
  return null;
}
