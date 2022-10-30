part of global_widgets;

class CustomAppBar {
  static PreferredSizeWidget backTitleAppBar({String title = ''}) {
    return AppBar(
      systemOverlayStyle: UiMS.changeSystemThemeMode(ThemeModeX.dark),
      elevation: 0,
      leading: CustomBackButtonWidget(isItGrey: false),
      automaticallyImplyLeading: false,
      actions: [
        Container(),
      ],
      title: Transform.translate(
        offset: Offset(0, 3.3),
        child: Text(
          title,
          textScaleFactor: 1,
          style: Get.textTheme.headline4!.merge(TextStyle(color: Colors.black)),
        ),
      ),
    );
  }

  static PreferredSizeWidget splashAppBar() {
    return AppBar(
      foregroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 0,
      systemOverlayStyle: UiMS.changeSystemThemeMode(ThemeModeX.dark),
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: null,
    );
  }
}
