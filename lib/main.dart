import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'app/module/global_widgets/index.dart';
import 'app/routes/app_pages.dart';
import 'app/services/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'common/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  ErrorWidget.builder = (FlutterErrorDetails details) =>
      SomethingWentWrongWidget(message: details.toString());
  runApp(B2BProductApp());
}

class B2BProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SettingsService()),
        ],
        child: Consumer<SettingsService>(builder: (context, controller, child) {
          return GetMaterialApp(
            title: controller.appName,
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
            localizationsDelegates: [GlobalMaterialLocalizations.delegate],
        
            debugShowCheckedModeBanner: ConfigX.debug,
            defaultTransition: Transition.cupertino,
            themeMode: controller.getThemeMode(),
            theme: controller.getLightTheme(),
            darkTheme: controller.getDarkTheme(),
          );
        }));
  }
}
