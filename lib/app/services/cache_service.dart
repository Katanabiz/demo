part of services_ms;

class CacheService extends GetxService {
  Future<void> readStorage(BuildContext context) async {
    try {
      await GetStorage.init();
      final dataStorage = GetStorage();

      HelperMS.log("read cache done...");
    } catch (e) {}
  }

  void writeStorage(BuildContext context) async {
    try {
      await GetStorage.init();
      final dataStorage = GetStorage();

      HelperMS.log("write in cache done...");
    } catch (e) {}
  }

  Future<void> updateStorage(BuildContext context) async {
    try {
      await GetStorage.init();
      final dataStorage = GetStorage();

      HelperMS.log("cache updated");
    } catch (e) {}
  }

  Future<void> clearStorage(BuildContext context) async {
    try {
      await GetStorage.init();
      final dataStorage = GetStorage();
      ConfigX.token = '';

      HelperMS.log("clear cache done...");
    } catch (e) {}
  }

  Locale getInitLocale() {
    try {
      GetStorage.init();
      final dataStorage = GetStorage();
      if (dataStorage.read('lang') != null) {
        return Locale(dataStorage.read('lang'));
      } else {
        return Locale('en');
      }
    } catch (e) {
      return Locale('en');
    }
  }
}
