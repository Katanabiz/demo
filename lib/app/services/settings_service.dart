part of services_ms;

class SettingsService with ChangeNotifier {
  String fontFamily = "Lato";

  String appName = kAppName.tr;

  String primaryColor = "#3683FC"; //blue
  String primaryDarkColor = "#1D21AA"; //dark blue
  String primaryLightColor = "#96C241"; //light green
  String secondaryColor = "#878786"; //grey
  String secondaryDarkColor = "#878786"; //
  String secondaryLightColor = "#878786"; //
  String scaffoldDarkColor = "#f5f5f5"; //light grey
  String scaffoldColor = "#ffffff"; //white
  String dividerColor = "#44b048";

  String? googleMapsKey = "";
  String? mobileLanguage = 'en';
  String? appVersion = 'v 0.1.0';
  ThemeModeX themeModeX = ThemeModeX.light;
  ThemeData getLightTheme() {
    return ThemeData(
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 22,
        ),
        appBarTheme:
            AppBarTheme(backgroundColor: UiMS.parseColor(scaffoldColor)),
        dividerColor: Colors.transparent,
        primaryColor: UiMS.parseColor(primaryColor),
        primaryColorDark: UiMS.parseColor(primaryDarkColor),
        primaryColorLight: UiMS.parseColor(primaryLightColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Colors.white),
        scaffoldBackgroundColor: UiMS.parseColor(scaffoldColor),
        brightness: Brightness.light,
        focusColor: UiMS.parseColor(secondaryColor),
        hintColor: UiMS.parseColor(secondaryColor),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: Colors.black),
        ),
        colorScheme: ColorScheme.light(
          primary: UiMS.parseColor(primaryColor),
          secondary: UiMS.parseColor(secondaryColor),
        ),
        textTheme: GoogleFonts.getTextTheme(
          fontFamily,
          TextTheme(
            headline6: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                height: 1.3),
            headline5: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                height: 1.3),
            headline4: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                height: 1.3),
            headline3: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                height: 1.3),
            headline2: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                height: 1.4),
            headline1: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                height: 1.4),
            subtitle2: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
                height: 1.2),
            subtitle1: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1.2),
            bodyText2: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                height: 1.2),
            bodyText1: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                height: 1.2),
            caption: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                height: 1.2),
          ),
        ));
  }

  ThemeData getDarkTheme() {
    return ThemeData(
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 22,
        ),
        appBarTheme:
            AppBarTheme(backgroundColor: UiMS.parseColor(scaffoldDarkColor)),
        dividerColor: Colors.transparent,
        primaryColor: UiMS.parseColor(primaryColor),
        primaryColorDark: UiMS.parseColor(primaryDarkColor),
        primaryColorLight: UiMS.parseColor(primaryLightColor),
        floatingActionButtonTheme: FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: UiMS.parseColor(scaffoldDarkColor),
        brightness: Brightness.dark,
        focusColor: UiMS.parseColor(secondaryDarkColor),
        hintColor: UiMS.parseColor(secondaryDarkColor),
        toggleableActiveColor: UiMS.parseColor(primaryDarkColor),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(primary: Colors.black),
        ),
        colorScheme: ColorScheme.dark(
          primary: UiMS.parseColor(primaryDarkColor),
          secondary: UiMS.parseColor(secondaryColor),
        ),
        textTheme: GoogleFonts.getTextTheme(
            fontFamily,
            TextTheme(
              headline6: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.3),
              headline5: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.3),
              headline4: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1.3),
              headline3: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.3),
              headline2: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.4),
              headline1: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  height: 1.4),
              subtitle2: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                  height: 1.2),
              subtitle1: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                  height: 1.2),
              bodyText2: TextStyle(

                  // fontSize: 13.0,
                  // fontWeight: FontWeight.w600,
                  color: Colors.black,
                  height: 1.2),
              bodyText1: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1.2),
              caption: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  height: 1.2),
            )));
  }

  ThemeMode getThemeMode() {
    switch (themeModeX) {
      case ThemeModeX.light:
        UiMS.changeSystemThemeMode(ThemeModeX.light);
        return ThemeMode.light;
      case ThemeModeX.dark:
        UiMS.changeSystemThemeMode(ThemeModeX.dark);
        return ThemeMode.dark;
      case ThemeModeX.primaryColor:
        return ThemeMode.system;
      case ThemeModeX.primaryColorDark:
        return ThemeMode.system;
      default:
        UiMS.changeSystemThemeMode(ThemeModeX.light);
        return ThemeMode.light;
    }
  }

  notifyListeners();
}
