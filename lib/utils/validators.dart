import 'package:material_themes_widgets/utils/ui_utils.dart';

String? nonEmptyValidator(String? value, String name, bool toastIfInvalid) {
  var validatedValue = value != null && value.isEmpty ? '$name is required' : null;
  if (validatedValue != null && toastIfInvalid) showToast("$name is required");
  return validatedValue;
}

String? emailValidator(String? value, bool toastIfInvalid) {
  var validatedValue = value != null && value.isEmpty ? 'Enter an email' : null;
  if (validatedValue != null && toastIfInvalid) showToast("Email is required");
  return validatedValue;
}

String? passwordValidator(String? value, bool toastIfInvalid) {
  var validatedValue = value != null && value.length < 6 ? 'Enter a password 6+ chars long' : null;
  if (validatedValue != null && toastIfInvalid) showToast("Enter a password 6+ chars long");
  return validatedValue;
}