class ValidationMixin {
  String emailValidator(String value) {
    {
      if (value.isEmpty) {
        return 'Please Enter Your Email';
      }
      if (!value.contains('@')) {
        return 'Invalid Email';
      }
      return null;
    }
  }

  String passwordValidator(String value) {
    {
      if (value.isEmpty) {
        return 'Please Enter your password';
      }
      if (value.length < 4) {
        return 'Password must be at least 4 characters';
      }
      return null;
    }
  }
}
