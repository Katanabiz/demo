import '../module/Screens/demo_user_screen.dart';
import 'app_routes.dart';
import '../module/dashboard/views/splash_view.dart';
import 'package:get/get.dart' show GetPage, Transition;
import '../module/dashboard/views/bio_parameters_view.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => SplashView(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.demoUser,
        page: () => DemoUserScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.bioParametersView,
        page: () => BioParametersView(),
        transition: Transition.fadeIn),
  ];
}
