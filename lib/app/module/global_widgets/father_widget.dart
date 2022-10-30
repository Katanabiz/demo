part of global_widgets;

DateTime? lastPressed;

class FatherWidget extends StatelessWidget {
  FatherWidget({
    required this.child,
    this.enableGetBack: false,
    this.themeMode,
  });
  final Widget child;
  final bool enableGetBack;
  final ThemeModeX? themeMode;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: enableGetBack
            ? () async => HelperMS.onWillPopGoBack()
            : () async {
                final now = DateTime.now();
                final maxDuration = Duration(seconds: 2);
                final isWarning = lastPressed == null ||
                    now.difference(lastPressed!) > maxDuration;
                if (isWarning) {
                  lastPressed = DateTime.now();
                  Get.closeAllSnackbars();
                  Get.showSnackbar(UiMS.floatSnackBar(
                      duration: Duration(milliseconds: 2500),
                      messageStyle: MessageStyle.primaryColor,
                      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                      hideTitle: true,
                      title: ''.tr,
                      message: 'Tap again to leave app'.tr + ' ' + '!'));

                  return false;
                } else {
                  exit(0);
                }
              },
        child: GestureDetector(
          onTap: () => HelperMS.closeKeyboard(),
          child: Directionality(
              textDirection: HelperMS.dir(),
              child: themeMode == null
                  ? child
                  : AnnotatedRegion<SystemUiOverlayStyle>(
                      value: UiMS.changeSystemThemeMode(themeMode!),
                      child: child,
                    )),
        ));
  }
}

enum ThemeModeX {
  light,
  dark,
  primaryColor,
  primaryColorDark,
}
