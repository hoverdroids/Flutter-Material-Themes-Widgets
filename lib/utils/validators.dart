import 'package:material_themes_widgets/utils/ui_utils.dart';

const String? VALID = null;

// Return null if valid
String? nonEmptyValidator(String? value, String name, bool toastIfInvalid) {
  var validatedValue = value == null || value.isEmpty ? '$name is required' : VALID;
  if (validatedValue != null && toastIfInvalid) showToast("$name is required");
  return validatedValue;
}

// Return null if valid
String? emailValidator(String? value, bool toastIfInvalid) {
  var validatedValue = value == null || value.isEmpty ? 'Enter an email' : VALID;
  if (validatedValue != null && toastIfInvalid) showToast("Email is required");
  return validatedValue;
}

// Return null if valid
String? passwordValidator(String? value, bool toastIfInvalid) {
  var validatedValue = value == null || value.length < 6 ? 'Enter a password 6+ chars long' : VALID;
  if (validatedValue != null && toastIfInvalid) showToast("Enter a password 6+ chars long");
  return validatedValue;
}