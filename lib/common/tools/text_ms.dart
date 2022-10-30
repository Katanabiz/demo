part of common;

class TextMS {
  static String toPascalCase(String? text) {
    if (HelperMS.isAr()) {
      return text!;
    }
    String tempX = "";
    List<String> tempXList = [];
    if (text != null && text != "") {
      tempXList = text.split(" ");
      tempXList.forEach((element) {
        if (tempXList.indexOf(element) == 0) {
          tempX = element[0].toUpperCase() + element.substring(1).toLowerCase();
        } else {
          tempX = tempX +
              " " +
              element[0].toUpperCase() +
              element.substring(1).toLowerCase();
        }
      });
    }

    return tempX;
  }

  static String toCamelCase(String? text) {
    if (HelperMS.isAr()) {
      return text!;
    }
    String tempX = "";
    List<String> tempXList = [];
    if (text != null && text != "") {
      tempXList = text.split(" ");
      tempXList.forEach((element) {
        if (tempXList.indexOf(element) == 0) {
          tempX = element.substring(1).toLowerCase();
        } else {
          tempX = tempX +
              " " +
              element[0].toUpperCase() +
              element.substring(1).toLowerCase();
        }
      });
    }
    return tempX;
  }

  static String toCapitalizeForFirstWord(String? text) {
    if (HelperMS.isAr()) {
      return text!;
    }
    String tempX = "";
    if (text != null && text != "") {
      tempX = text[0].toUpperCase() + text.substring(1).toLowerCase();
    }
    return tempX;
  }

  static String toLowerCase(String? text) {
    if (HelperMS.isAr()) {
      return text!;
    }
    String tempX = "";
    if (text != null && text != "") {
      tempX = text.toLowerCase();
    }
    return tempX;
  }

  static String toUpperCase(String? text) {
    if (HelperMS.isAr()) {
      return text!;
    }
    String tempX = "";
    if (text != null && text != "") {
      tempX = text.toUpperCase();
    }
    return tempX;
  }

  static String toKebabCase(String? text) {
    if (HelperMS.isAr()) {
      return text!;
    }
    String tempX = "";
    List<String> tempXList = [];
    if (text != null && text != "") {
      tempXList = text.split(" ");
      tempXList.forEach((element) {
        if (tempXList.indexOf(element) == 0) {
          tempX = element.toLowerCase();
        } else {
          tempX = tempX +
              "-" +
              element[0].toUpperCase() +
              element.substring(1).toLowerCase();
        }
      });
    }
    return tempX;
  }

  static String toSnakeCase(String? text) {
    if (HelperMS.isAr()) {
      return text!;
    }
    String tempX = "";
    List<String> tempXList = [];
    if (text != null && text != "") {
      tempXList = text.split(" ");
      tempXList.forEach((element) {
        if (tempXList.indexOf(element) == 0) {
          tempX = element.toLowerCase();
        } else {
          tempX = tempX +
              "_" +
              element[0].toUpperCase() +
              element.substring(1).toLowerCase();
        }
      });
    }
    return tempX;
  }
}
