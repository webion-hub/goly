class Validations {
  static String? validateUsername(String? value) {
    if (value!.isEmpty) return 'Username is Required.';
    final RegExp nameExp = RegExp(r'^[A-za-zğüşöçİĞÜŞÖÇ ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

  static String? validateEmail(String? value, [bool isRequried = true]) {
    if (value!.isEmpty && isRequried) return 'Email is required.';
    final nameExp = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (!nameExp.hasMatch(value) && isRequried) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty || value.length < 6) {
      return 'Please enter at least 6 characters';
    }
    return null;
  }

  static String? validateBio(String? value) {
    if (value!.length > 100) {
      return 'The bio musst be less than 100 characters';
    }
    return null;
  }

  static String? validatePriority(String? value) {
    int? parsedValue = int.tryParse(value ?? '');
    if (parsedValue == null || parsedValue < 1 || parsedValue > 10) {
      return 'The priority must be between 1 and 10';
    }
    return null;
  }

  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty || value.trim() == "") {
      return 'The field can\'t be empty';
    }
    return null;
  }
}
