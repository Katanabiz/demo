part of common;

class ScreenMS {
  /// to show or hide any kind of widget depend on screen size (sometimes we need to hide the widget if the screen is very small)
  static bool showHideWidget({
    bool ldpi = true,
    bool mdpi = true,
    bool hdpi = true,
    bool xhdpi = true,
    bool xxhdpi = true,
    bool xxxhdpi = true,
  }) {
    if (Get.pixelRatio <= 0.75) {
      return ldpi;
    } else if (Get.pixelRatio > 0.75 && Get.pixelRatio <= 1) {
      return mdpi;
    } else if (Get.pixelRatio > 1 && Get.pixelRatio <= 1.5) {
      return hdpi;
    } else if (Get.pixelRatio > 1.5 && Get.pixelRatio <= 2.0) {
      return xhdpi;
    } else if (Get.pixelRatio > 2.0 && Get.pixelRatio <= 3.0) {
      return xxhdpi;
    } else if (Get.pixelRatio > 3.0) {
      return xxxhdpi;
    } else {
      return true;
    }
  }

  /// to change the fixed width depend on screen size
  static double safeFixedWidth({double width = 1}) {
    if (Get.pixelRatio <= 0.75) {
      return width * 0.75;
    } else if (Get.pixelRatio > 0.75 && Get.pixelRatio <= 1) {
      return width * 1.0;
    } else if (Get.pixelRatio > 1 && Get.pixelRatio <= 1.5) {
      return width * 1.5;
    } else if (Get.pixelRatio > 1.5 && Get.pixelRatio <= 2.0) {
      return width * 2.0;
    } else if (Get.pixelRatio > 2.0 && Get.pixelRatio <= 3.0) {
      return width * 3.0;
    } else if (Get.pixelRatio > 3.0) {
      return width * 4.0;
    } else {
      return width * 4.5;
    }
  }

  /// to change the scale of text depend on screen size
  static double textScaleFactor() {
    if (Get.width >= 300.0) {
      return 1;
    } else if (Get.width >= 500.0) {
      return 1.1;
    } else if (Get.width >= 700.0) {
      return 1.2;
    } else {
      return 1;
    }
  }

  /// to change the scale of text depend on screen size
  static double widgetScaleFactor() {
    if (Get.width >= 300.0) {
      return 0.9;
    } else if (Get.width >= 500.0) {
      return 0.95;
    } else if (Get.width >= 700.0) {
      return 1;
    } else {
      return 1;
    }
  }

  /// to get the current name of screen size ex: xxhdpi
  static String currentScreenSize() {
    if (Get.pixelRatio <= 0.75) {
      return "ldpi";
    } else if (Get.pixelRatio > 0.75 && Get.pixelRatio <= 1) {
      return "mdpi";
    } else if (Get.pixelRatio > 1 && Get.pixelRatio <= 1.5) {
      return "hdpi";
    } else if (Get.pixelRatio > 1.5 && Get.pixelRatio <= 2.0) {
      return "xhdpi";
    } else if (Get.pixelRatio > 2.0 && Get.pixelRatio <= 3.0) {
      return "xxhdpi";
    } else if (Get.pixelRatio > 3.0) {
      return "xxxhdpi";
    } else {
      return "very big screen";
    }
  }

  static bool isItBigScreen() {
    if (Get.pixelRatio <= 0.75) {
      return false;
    } else if (Get.pixelRatio > 0.75 && Get.pixelRatio <= 1) {
      return false;
    } else if (Get.pixelRatio > 1 && Get.pixelRatio <= 1.5) {
      return true;
    } else if (Get.pixelRatio > 1.5 && Get.pixelRatio <= 2.0) {
      return true;
    } else if (Get.pixelRatio > 2.0 && Get.pixelRatio <= 3.0) {
      return true;
    } else if (Get.pixelRatio > 3.0) {
      return true;
    } else {
      return true;
    }
  }
}
