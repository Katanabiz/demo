import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../common/index.dart';

class FirebaseService extends GetxService {
  Future<void> createToken({bool subscribeTopics = false}) async {
    try {
      await Firebase.initializeApp();
      final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

      if (subscribeTopics) {
        setTopics();
      }
    } catch (_) {
      HelperMS.log(_.toString());
    }
  }

  Future<void> setTopics() async {}
}
