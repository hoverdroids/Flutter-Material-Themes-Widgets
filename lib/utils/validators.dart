String? nonEmptyValidator(String? value, String name) {
  return value != null && value.isEmpty ? name + ' is required' : null;
}

String? emailValidator(String? value) {
  return value != null && value.isEmpty ? 'Enter an email' : null;
}

String? passwordValidator(String? value) {
  return value != null && value.length < 6 ? 'Enter a password 6+ chars long' : null;
}