import 'package:material_themes_widgets/utils/ui_utils.dart';

const String? VALID = null;

// Return null if valid
String? nonEmptyValidator(String? value, String invalidMessage, bool toastIfInvalid) {
  var validatedValue = value == null || value.isEmpty ? invalidMessage : VALID;
  if (validatedValue != null && toastIfInvalid) showToast(invalidMessage);
  return validatedValue;
}

// Return null if valid
String? emailValidator(String? value, String invalidMessage, bool toastIfInvalid) {
  var validatedValue = value == null || value.isEmpty ? invalidMessage : VALID;
  if (validatedValue != null && toastIfInvalid) showToast(invalidMessage);
  return validatedValue;
}

// Return null if valid
String? passwordValidator(String? value, int minLength, String invalidMessage, bool toastIfInvalid) {
  var validatedValue = value == null || value.length < minLength ? invalidMessage : VALID;
  if (validatedValue != null && toastIfInvalid) showToast(invalidMessage);
  return validatedValue;
}