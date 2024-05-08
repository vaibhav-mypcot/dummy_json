// ignore_for_file: unnecessary_new

mixin ValidationsMixin {
  bool isNumericOnly(String value) {
    final RegExp numericRegex = RegExp(r'^[0-9]+$');
    return numericRegex.hasMatch(value);
  }

  String? validatedPhoneNumber(String? value) {
    if (value == null ||
        value.length > 10 ||
        value.isEmpty ||
        value.length < 10) {
      return 'Please enter valid phone number';
    } else if (!isNumericOnly(value)) {
      return 'Please enter valid phone number';
    } else {
      return null;
    }
  }

  String? validatedName(String? value) {
    if (value == null || value.isEmpty || value.length >= 52) {
      return 'Please enter valid name';
    } else {
      //name regex
      RegExp regex = new RegExp(r'^[A-Za-z\ ]+$');
      if (!regex.hasMatch(value)) {
        return 'Name Should only contain alphabets';
      } else {
        return null;
      }
    }
  }

  String? validatedMessage(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Please enter valid message';
    } else {
      return null;
    }
  }

  String? validatedAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid address';
    } else {
      return null;
    }
  }

  String? validatedDob(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter valid dob';
    } else {
      return null;
    }
  }

  String? validatedState(String? value) {
    if (value == null || value.isEmpty) {
      return 'Add a valid pincode to fetch state';
    } else {
      return null;
    }
  }

  String? validatedCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Add a valid pincode to fetch city';
    } else {
      return null;
    }
  }

  String? validatedPincode(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Please enter valid pincode';
    } else {
      return null;
    }
  }

  String? validatedQuestion(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Question field cannot be empty';
    } else {
      return null;
    }
  }

  String? validatedOptions(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'options field cannot be empty';
    } else {
      return null;
    }
  }
}
