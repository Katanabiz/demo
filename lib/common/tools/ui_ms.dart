part of common;

class UiMS {
  static void flutterToast({
    String message = '',
    Toast time = Toast.LENGTH_LONG,
    ToastGravity gravity = ToastGravity.BOTTOM,
    MessageStyle messageStyle = MessageStyle.note,
    double fontSize = 16.0,
  }) {
    Fluttertoast.cancel();

    Fluttertoast.showToast(
        msg: message.tr,
        toastLength: time,
        gravity: gravity,
        backgroundColor: getMessageBGColor(messageStyle),
        textColor: getMessageContentColor(messageStyle),
        fontSize: fontSize);
  }

  static flutterSnackBar({
    String title = '',
    bool hideTitle = false,
    String? message,
    MessageStyle messageStyle = MessageStyle.note,
    Color? textColor,
    EdgeInsets margin = const EdgeInsets.all(5),
    Duration duration = const Duration(milliseconds: 2500),
    SnackBarBehavior? snackBarBehavior,
  }) {
    Get.log("[$title] $message", isError: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(Get.context!).removeCurrentSnackBar();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: FadeIn(
              delay: Duration(milliseconds: 200),
              child: Directionality(
                textDirection: HelperMS.dir(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    hideTitle
                        ? SizedBox.shrink()
                        : Text(getSnackTitle(messageStyle, title),
                            style: Get.textTheme.headline6!.merge(TextStyle(
                                color: getMessageContentColor(messageStyle)))),
                    Text(
                      message!.tr,
                      style: Get.textTheme.caption!.merge(TextStyle(
                          color: getMessageContentColor(messageStyle))),
                    ),
                  ],
                ),
              )),
          backgroundColor: getMessageBGColor(messageStyle),
          behavior: snackBarBehavior,
          duration: duration,
          margin: snackBarBehavior == SnackBarBehavior.floating ? margin : null,
        ),
      );
    });
  }

  static GetSnackBar floatSnackBar({
    String title = '',
    bool hideTitle = false,
    String? message,
    MessageStyle messageStyle = MessageStyle.note,
    Color? textColor,
    EdgeInsets margin = const EdgeInsets.all(5),
    Duration duration = const Duration(milliseconds: 2500),
    SnackPosition snackPosition = SnackPosition.BOTTOM,
  }) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: hideTitle
          ? SizedBox.shrink()
          : Text(title.tr,
              style: Get.textTheme.headline6!.merge(
                  TextStyle(color: getMessageContentColor(messageStyle)))),
      messageText: Text(message!,
          textScaleFactor: 1,
          style: Get.textTheme.caption!
              .merge(TextStyle(color: getMessageContentColor(messageStyle)))),
      snackPosition: snackPosition,
      margin: margin,
      backgroundColor: getMessageBGColor(messageStyle),
      icon: getSnackIcon(messageStyle),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      boxShadows: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
      ],
      dismissDirection: DismissDirection.horizontal,
      duration: duration,
    );
  }

  static Color getMessageContentColor(MessageStyle messageStyle) {
    switch (messageStyle) {
      case MessageStyle.alarm:
      case MessageStyle.error:
      case MessageStyle.failed:
      // return Colors.white;
      case MessageStyle.warning:
      // return Colors.white;
      case MessageStyle.note:
      // return Get.theme.primaryColor;
      case MessageStyle.success:
      // return Get.theme.primaryColor;
      case MessageStyle.primaryColor:
      // return Colors.white;
      case MessageStyle.primaryColorDark:
        return Colors.white;

      default:
        // return Get.theme.primaryColor;
        return Colors.white;
    }
  }

  static Color getMessageBGColor(MessageStyle messageStyle) {
    switch (messageStyle) {
      case MessageStyle.alarm:
      case MessageStyle.error:
      case MessageStyle.failed:
        return Colors.redAccent;
      case MessageStyle.warning:
      // return Colors.amber.shade700;
      case MessageStyle.note:
        return Get.theme.primaryColor;
      // return Colors.white;
      case MessageStyle.success:
        return Get.theme.primaryColor;
      // return Colors.white;
      case MessageStyle.primaryColor:
        return Get.theme.primaryColor;
      case MessageStyle.primaryColorDark:
        return Get.theme.primaryColor;
      // return Get.theme.primaryColorDark;

      default:
        return Colors.white;
    }
  }

  static String getSnackTitle(MessageStyle messageStyle, title) {
    if (title == '') {
      switch (messageStyle) {
        case MessageStyle.alarm:
          return "Alarm".tr;
        case MessageStyle.error:
          return "Error".tr;
        case MessageStyle.failed:
          return "Failed".tr;
        case MessageStyle.warning:
          return "Warning".tr;
        case MessageStyle.note:
          return "Note".tr;
        case MessageStyle.success:
          return "Success".tr;

        default:
          return "Note".tr;
      }
    } else {
      return title;
    }
  }

  static Widget getSnackIcon(MessageStyle messageStyle) {
    switch (messageStyle) {
      case MessageStyle.alarm:
        return Icon(Icons.warning_amber_outlined,
            size: 32, color: getMessageContentColor(messageStyle));
      case MessageStyle.error:
        return Icon(Icons.error_outline_outlined,
            size: 32, color: getMessageContentColor(messageStyle));
      case MessageStyle.failed:
        return Icon(Icons.error_outline_outlined,
            size: 32, color: getMessageContentColor(messageStyle));
      case MessageStyle.warning:
        return Icon(Icons.warning_amber_outlined,
            size: 32, color: getMessageContentColor(messageStyle));
      case MessageStyle.note:
        return Icon(Icons.info_outline_rounded,
            size: 32, color: getMessageContentColor(messageStyle));
      case MessageStyle.success:
        return Icon(Icons.check_circle_outline,
            size: 32, color: getMessageContentColor(messageStyle));
      case MessageStyle.primaryColorDark:
        return Icon(Icons.check_circle_outline,
            size: 32, color: getMessageContentColor(messageStyle));
      default:
        return Icon(Icons.info_outline_rounded,
            size: 32, color: getMessageContentColor(messageStyle));
    }
  }

  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF")))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  static InputDecoration getInputDecoration(
      {TextInputType? keyboardType,
      String hintText = '',
      bool? areThereUnderLineBoarder = false,
      TextDirection textHintDirection = TextDirection.ltr,
      String? errorText,
      IconData? iconData,
      Widget? suffixIcon,
      Widget? suffix}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.caption!.merge(TextStyle(
        color: Colors.grey.withOpacity(0.45),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      )),

      prefixIcon: iconData != null
          ? Icon(iconData, color: Get.theme.focusColor).marginOnly(right: 14)
          : null,
      prefixIconConstraints: iconData != null
          ? BoxConstraints.expand(width: 38, height: 38)
          : BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: keyboardType == TextInputType.multiline ? 10 : 0,
        bottom: keyboardType == TextInputType.multiline ? 10 : 0,
      ),
      hintTextDirection: textHintDirection,
      //boarder
      border: areThereUnderLineBoarder!
          ? UnderlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 2,
                color: Color(0XFFE0E0E0),
              ),
            )
          : OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: areThereUnderLineBoarder
          ? UnderlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 2,
                color: Get.theme.primaryColor,
              ),
            )
          : OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: areThereUnderLineBoarder
          ? UnderlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 1,
                color: Color(0XFFE0E0E0),
              ),
            )
          : OutlineInputBorder(borderSide: BorderSide.none),

      errorBorder: areThereUnderLineBoarder
          ? UnderlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                width: 2,
                color: Colors.red,
              ),
            )
          : OutlineInputBorder(borderSide: BorderSide.none),
      //
      suffixIcon: suffixIcon,
      suffix: suffix,
      errorText: errorText,
    );
  }

  static InputDecoration getInputDecorationCard({
    String hintText = '',
    String labelText = '',
    String? errorText,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.caption!.merge(TextStyle(
        color: Colors.grey[400],
        fontSize: 16,
        fontWeight: FontWeight.bold,
      )),

      labelText: labelText,
      // labelStyle: TextStyle(),
      // prefixIcon: null,
      // prefixIconConstraints: BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: const EdgeInsets.only(left: 10, right: 10),

      //boarder
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          width: 2,
          color: Color(0XFFE0E0E0),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          width: 2,
          color: Get.theme.primaryColor,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          style: BorderStyle.solid,
          width: 1,
          color: Color(0XFFE0E0E0),
        ),
      ),

      // errorBorder: UnderlineInputBorder(
      //   borderSide: BorderSide(
      //     style: BorderStyle.solid,
      //     width: 2,
      //     color: Colors.red,
      //   ),
      // ),
      //
      errorText: errorText,
    );
  }

  static showNoteDevelopeAppSnackBar({double top = 70}) {
    Get.snackbar('Note'.tr + '!', 'The app is currently under development'.tr,
        icon: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Icon(LineIcons.exclamationTriangle,
                color: Colors.red, size: 35)),
        colorText: Colors.black54,
        titleText: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Note'.tr + '!',
            textScaleFactor: 1,
            style:
                Get.textTheme.headline6!.merge(TextStyle(color: Colors.white)),
          ),
        ),
        messageText: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'The app is currently under development'.tr,
            textScaleFactor: 1,
            style: Get.textTheme.caption!.merge(TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            )),
          ),
        ),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(top: top, left: 10, right: 10));
  }

  static Widget dividerGreyColor() {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      height: 2,
    );
  }

  static showCustomDialog({
    EdgeInsetsGeometry customImgMargin =
        const EdgeInsets.only(top: 5, bottom: 0),
    String title = 'Title',
    String subTitle = 'Subtitle',
    List<Widget> buttonList = const [],
    List<Widget> widgetList = const [],
  }) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0.0))),
      content: Container(
        margin: customImgMargin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: widgetList,
                ),
              ),
            ),
            Directionality(
              textDirection: HelperMS.dir(),
              child: Container(
                child: Center(
                  child: Text(
                    title,
                    textScaleFactor: 1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            UiMS.dividerGreyColor(),
            SizedBox(height: 10),
            Text(
              subTitle,
              textScaleFactor: 1,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      buttonPadding: EdgeInsets.symmetric(vertical: 0),
      actionsPadding: EdgeInsets.only(
        top: 0,
        bottom: 15,
        right: 10,
        left: 10,
      ),
      actions: [
        Container(
          height: 50,
          width: Get.width,
          child: Row(
            mainAxisAlignment: buttonList.length != 1
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            children: buttonList,
          ),
        ),
      ],
    ));
  }

  static showLoadingDialog({dismissible = true}) => Get.dialog(WillPopScope(
        onWillPop: () async => dismissible,
        child: SimpleDialog(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            children: [
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: Get.theme.primaryColor),
                  ],
                ),
              ),
            ]),
      ));

  static SystemUiOverlayStyle changeSystemThemeMode(ThemeModeX themeMode) {
    switch (themeMode) {
      case ThemeModeX.primaryColor:
        return SystemUiOverlayStyle.light.copyWith(
            systemNavigationBarColor: Get.theme.primaryColor,
            systemNavigationBarDividerColor: Get.theme.primaryColor,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarContrastEnforced: true);
      case ThemeModeX.primaryColorDark:
        return SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Get.theme.primaryColorDark,
          systemNavigationBarDividerColor: Get.theme.primaryColorDark,
          systemNavigationBarIconBrightness: Brightness.light,
        );
      case ThemeModeX.light:
        return SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        );
      case ThemeModeX.dark:
        // return SystemUiOverlayStyle.dark;
        return SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        );

      default:
        return SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        );
    }
  }

  static Widget dividerGrey() {
    return Container(
      color: Colors.grey,
      height: 0.2,
    );
  }

  static showDataDialog({
    bool showButton = true,
    bool barrierDismissible = true,
    CrossAxisAlignment crossAxisWidgetsAlignment = CrossAxisAlignment.start,
    MainAxisAlignment mainAxisWidgetsAlignment = MainAxisAlignment.start,
    MainAxisAlignment mainAxisButtonsAlignment = MainAxisAlignment.spaceBetween,
    EdgeInsetsGeometry margin =
        const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    List<Widget> widgetList = const [],
    List<Widget> buttonList = const [],
  }) {
    return Get.dialog(WillPopScope(
        onWillPop: barrierDismissible
            ? () async {
                return true;
              }
            : () async {
                return false;
              },
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0))),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: mainAxisWidgetsAlignment,
                crossAxisAlignment: crossAxisWidgetsAlignment,
                children: widgetList,
              ),
            ),
          ),
          actionsPadding:
              EdgeInsets.only(top: 0, bottom: 15, right: 15, left: 15),
          buttonPadding: EdgeInsets.zero,
          actions: buttonList.length == 0
              ? null
              : [
                  Visibility(
                    visible: showButton,
                    child: Container(
                      height: 50,
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: buttonList.length == 1
                            ? MainAxisAlignment.center
                            : mainAxisButtonsAlignment ==
                                    MainAxisAlignment.spaceBetween
                                ? MainAxisAlignment.spaceBetween
                                : mainAxisButtonsAlignment,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: buttonList,
                      ),
                    ),
                  ),
                ],
        )));
  }
}

enum MessageStyle {
  warning,
  alarm,
  note,
  success,
  failed,
  error,
  primaryColor,
  primaryColorDark,
}
