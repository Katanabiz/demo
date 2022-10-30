part of common;

class ConfigX {
  static const bool debug = true;
  static const String stagingUrl =
      'https://staging.intime_digital.com.sa/api/v1/';
  static const String productionUrl =
      'https://www.intime_digital.com.sa/api/v1/';
  static const baseImageUrl = debug
      ? 'https://staging.intime_digital.com.sa/'
      : 'https://www.intime_digital.com.sa/';

  static const String apiBaseUrl = debug ? stagingUrl : productionUrl;
  static const double appVersion = 1.3;

  //auth
  static String token = '';
  //end configs class
}
