class Validation {
  bool email(String? value) {
    if (value == null) return false;
    return RegExp(r'\S+@\S+\.\S+').hasMatch(value);
  }

  bool password(String? value) {
    if (value == null || value.length < 6) return false;

    return value.contains(RegExp(r'[0-9]')) &&
        value.contains(RegExp(r'[a-zA-Z]')) &&
        value.contains(RegExp(r'[&%=!@#$]'));
  }

  bool userName(String? value) {
    if (value == null) return false;
    return RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value);
  }
}
