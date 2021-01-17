class ValidationMixin {
  String validationEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter a valid email.';
    }
    return null;
  }

  String validationPassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }
}
