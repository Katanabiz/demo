// part of services_ms;

// class LocalizationService extends Translations {
//   // Default locale
//   static final locale = Get.put(CacheService()).getInitLocale();

//   // fallbackLocale saves the day when the locale gets in trouble
//   static final fallbackLocale = Locale('en');

//   // Supported languages
//   // Needs to be same order with locales
//   static final langs = [
//     'English',
//   ];

//   // Supported locales
//   // Needs to be same order with langs
//   static final locales = [
//     Locale('en'),
//   ];

//   // Keys and their translations
//   // Translations are separated maps in `lang` file
//   @override
//   // Map<String, Map<String, String>> get keys => {
//   //       'en': en,
//   //     };

//   // Gets locale from language, and updates the locale
//   void changeLocale(String lang) {
//     try {
//       final dataStorage = GetStorage();
//       Get.updateLocale(Locale(lang));
//       dataStorage.write('lang', lang);
//     } catch (e) {}
//   }
// }
