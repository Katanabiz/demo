part of common;

class ValidateMS {
  static mobileNumber(input) {
    if (input == '' || input == null) {
      return "Should enter mobile number".tr;
    } else if (input.length != 10) {
      return "Should be a valid mobile number (10 numbers)".tr;
    } else if ((input.startsWith('\+') || input.startsWith('00'))) {
      return "Enter a valid mobile number (no \"+\" , no \"00\" at first)".tr;
    } else if (!input.startsWith('05')) {
      return "Mobile number should start with 05".tr;
    } else
      return null;
  }

  static email(input) {
    if (input == '' || input == null) {
      return "Should enter email address".tr;
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input)) {
      return "Should be a valid email address".tr;
    }
    return null;
  }

  static text({input, label = '', errorMessage = ""}) {
    if (input == '' || input == null) {
      if (errorMessage != "") {
        return errorMessage;
      } else {
        return "Should enter".tr + " " + label;
      }
    }
    return null;
  }

  static number({input, label = '', errorMessage = ""}) {
    if (input == '' || input == null) {
      if (errorMessage != "") {
        return errorMessage;
      } else {
        return "Should enter".tr + " " + label;
      }
    }
    return null;
  }

  static currentPassword(input) {
    if (input == '' || input == null) {
      return "Should enter current password".tr;
    } else if (input.length < 8) {
      return "Should enter valid current password".tr;
    } else
      return null;
  }

  static password(input) {
    if (input == '' || input == null) {
      return "Should enter password".tr;
    } else if (input.length < 8) {
      return "Should be 8 numbers at least".tr;
    } else
      return null;
  }

  static rePassword(input, password) {
    if (input == '' || input == null) {
      return "Should enter re-password".tr;
    } else if (input != password) {
      return "Password doesn't match".tr;
    } else
      return null;
  }
}
