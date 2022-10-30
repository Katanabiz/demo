part of common;

class HelperMS {
  DateTime? currentBackPressTime;

  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }

  static Future<dynamic> getFilesInDirectory(String path) async {
    var files = io.Directory(path).listSync();
    log(files);
    // return rootBundle.(path).then(convert.jsonDecode);
  }

  static String parseHtmlString(String? htmlString) {
    if (htmlString != null && htmlString != "" && htmlString != "null") {
      final document = parse(htmlString);
      final String parsedString =
          parse(document.body!.text).documentElement!.text;
      return parsedString;
    } else {
      return htmlString ?? "";
    }
  }

  static String toUrl(String path) {
    if (!path.endsWith('/')) {
      path += '/';
    }
    return path;
  }

  static void log(dynamic text,
      {bool fullInfo = false, ColorfulText colorfulText = ColorfulText.blue}) {
    // if (!ConfigX.debug) {
    //   return;
    // }
    String message = 'CONSOLE > ' + text.toString();
    if (fullInfo) {
      Get.log('CONSOLE > ' + text.toString());
    } else {
      switch (colorfulText) {
        case ColorfulText.black:
          print('\x1B[30m$message\x1B[0m');
          break;
        case ColorfulText.red:
          print('\x1B[31m$message\x1B[0m');
          break;
        case ColorfulText.green:
          print('\x1B[32m$message\x1B[0m');
          break;
        case ColorfulText.yellow:
          print('\x1B[33m$message\x1B[0m');
          break;
        case ColorfulText.blue:
          print('\x1B[34m$message\x1B[0m');
          break;
        case ColorfulText.magenta:
          print('\x1B[35m$message\x1B[0m');
          break;
        case ColorfulText.cyan:
          print('\x1B[36m$message\x1B[0m');
          break;
        case ColorfulText.white:
          print('\x1B[37m$message\x1B[0m');
          break;
        default:
          print('\x1B[34m$message\x1B[0m');
      }
    }
  }

  static TextDirection dir() {
    return Get.locale.toString() == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  static String handleLongText(String text) {
    if (text.length < 45) {
      return text;
    } else {
      return text.substring(0, 40) + '...';
    }
  }

  static String lang() {
    return Get.locale.toString();
  }

  static bool isAr() {
    return Get.locale.toString() == 'en';
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static void openLink({
    String link = '',
    LinkType linkType = LinkType.url,
    double? latitude,
    double? longitude,
  }) {
    switch (linkType) {
      case LinkType.url:
        try {
          if (link.toString().isNotEmpty) {
            launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
          } else {
            Get.closeAllSnackbars();

            Get.showSnackbar(UiMS.floatSnackBar(
              hideTitle: true,
              messageStyle: MessageStyle.warning,
              message: "link is not available".tr,
            ));
          }
        } catch (e) {
          Get.closeAllSnackbars();

          Get.showSnackbar(UiMS.floatSnackBar(
            hideTitle: true,
            messageStyle: MessageStyle.error,
            message: e.toString(),
          ));
        }

        break;
      case LinkType.whatsappNumber:
        try {
          if (link.toString().isNotEmpty) {
            launchUrl(
              Uri.parse("https://wa.me/$link"),
              mode: LaunchMode.externalApplication,
            );
          } else {
            Get.closeAllSnackbars();

            Get.showSnackbar(UiMS.floatSnackBar(
              hideTitle: true,
              messageStyle: MessageStyle.warning,
              message: "whatsapp number is not available".tr,
            ));
          }
        } catch (e) {
          Get.closeAllSnackbars();

          Get.showSnackbar(UiMS.floatSnackBar(
            hideTitle: true,
            messageStyle: MessageStyle.error,
            message: e.toString(),
          ));
        }
        break;
      case LinkType.phoneNumber:
        try {
          if (link.isNotEmpty) {
            launchUrl(
              Uri(scheme: 'tel', path: link),
              mode: LaunchMode.externalApplication,
            );
          } else {
            Get.closeAllSnackbars();

            Get.showSnackbar(UiMS.floatSnackBar(
              hideTitle: true,
              messageStyle: MessageStyle.warning,
              message: "phone number is not available".tr,
            ));
          }
        } catch (e) {
          Get.closeAllSnackbars();

          Get.showSnackbar(UiMS.flutterSnackBar(
              snackBarBehavior: SnackBarBehavior.fixed,
              messageStyle: MessageStyle.error,
              message: e.toString()));
        }
        break;
      case LinkType.email:
        try {
          if (link.isNotEmpty) {
            launchUrl(
              Uri.parse(
                  "mailto:$link?subject=Sample Subject&body=This is a Sample email"),
              mode: LaunchMode.externalApplication,
            );
          } else {
            Get.closeAllSnackbars();
            Get.showSnackbar(UiMS.floatSnackBar(
              hideTitle: true,
              messageStyle: MessageStyle.warning,
              message: "email is not available".tr,
            ));
          }
        } catch (e) {
          Get.closeAllSnackbars();
          Get.showSnackbar(UiMS.flutterSnackBar(
              snackBarBehavior: SnackBarBehavior.fixed,
              messageStyle: MessageStyle.error,
              message: e.toString()));
        }
        break;

      case LinkType.googleStoreId:
        try {
          if (link.isNotEmpty) {
            launchUrl(
              Uri.parse("https://play.google.com/store/apps/details?id=$link"),
              mode: LaunchMode.externalApplication,
            );
          } else {
            Get.closeAllSnackbars();

            Get.showSnackbar(UiMS.floatSnackBar(
              hideTitle: true,
              messageStyle: MessageStyle.warning,
              message: "link is not available".tr,
            ));
          }
        } catch (e) {
          Get.closeAllSnackbars();

          Get.showSnackbar(UiMS.floatSnackBar(
            hideTitle: true,
            messageStyle: MessageStyle.error,
            message: e.toString(),
          ));
        }

        break;

      case LinkType.appleStoreId:
        try {
          if (link.isNotEmpty) {
            launchUrl(
              Uri.parse("https://apps.apple.com/jo/app/$link"),
              mode: LaunchMode.externalApplication,
            );
          } else {
            Get.closeAllSnackbars();

            Get.showSnackbar(UiMS.floatSnackBar(
              hideTitle: true,
              messageStyle: MessageStyle.warning,
              message: "link is not available".tr,
            ));
          }
        } catch (e) {
          Get.closeAllSnackbars();

          Get.showSnackbar(UiMS.floatSnackBar(
            hideTitle: true,
            messageStyle: MessageStyle.error,
            message: e.toString(),
          ));
        }

        break;

      case LinkType.googleMap:
        try {
          if (latitude != null && longitude != null) {
            launchUrl(
              Uri(
                  scheme: 'geo',
                  host: '0,0',
                  queryParameters: {'q': '$latitude,$longitude'}),
              mode: LaunchMode.externalApplication,
            );
          } else {
            Get.closeAllSnackbars();
            Get.showSnackbar(UiMS.floatSnackBar(
              hideTitle: true,
              messageStyle: MessageStyle.warning,
              message: "link is not available".tr,
            ));
          }
        } catch (e) {
          Get.closeAllSnackbars();

          Get.showSnackbar(UiMS.floatSnackBar(
            hideTitle: true,
            messageStyle: MessageStyle.error,
            message: e.toString(),
          ));
        }

        break;
      default:
        try {
          if (link.isNotEmpty) {
            launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
          } else {
            Get.closeAllSnackbars();

            Get.showSnackbar(UiMS.floatSnackBar(
              hideTitle: true,
              messageStyle: MessageStyle.warning,
              message: "link is not available".tr,
            ));
          }
        } catch (e) {
          Get.closeAllSnackbars();
          Get.showSnackbar(UiMS.floatSnackBar(
            hideTitle: true,
            messageStyle: MessageStyle.error,
            message: e.toString(),
          ));
        }
    }
  }

  static dynamic scrollToIndex(
      {required int index, required ItemScrollController scrollController}) {
    scrollController.scrollTo(
        index: index,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutCubic);
  }

  static dynamic onWillPopGoBack() async {
    Get.back();
  }

  static void closeKeyboard() {
    Get.focusScope!.unfocus();
  }

  static bool isAuth() {
    if (ConfigX.token != '') {
      return true;
    } else {
      return false;
    }
  }

  static void backUntilRoute(String routeGoal) {
    while (Get.currentRoute != routeGoal) {
      Get.back();
    }
  }

  static void checkLoadingDialog() {
    Get.closeAllSnackbars();
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

   static double getRadius(String title, String subtitle) {
    if (title.length > subtitle.length) {
      return title.length * 11.0;
    } else if (subtitle.length == 4) {
      return subtitle.length * 20;
    } else {
      return subtitle.length * 18.5;
    }
  }

}

enum LinkType {
  url,
  phoneNumber,
  whatsappNumber,
  email,
  googleStoreId,
  appleStoreId,
  googleMap,
}

enum ColorfulText {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
}
