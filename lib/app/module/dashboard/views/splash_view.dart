import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../global_widgets/index.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController? animationController;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(5.seconds)
          .then((value) => Get.offAllNamed(Routes.demoUser));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FatherWidget(
      enableGetBack: false,
      child: Scaffold(
        appBar: CustomAppBar.splashAppBar(),
        body: Stack(
          children: [
            Center(
              child: Image(
                alignment: Alignment.center,
                width: Get.width * 0.6,
                image: AssetImage('assets/img/logo.png'),
              ),
            ),
            Positioned(
              top: 130,
              bottom: 0,
              left: 0,
              right: 0,
              child: Center(
                  child: SizedBox(
                      width: Get.width * 0.41,
                      height: 2.5,
                      child: LinearProgressIndicator())),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Text('Diseases Tracker',
                    style: Get.textTheme.headline6!.merge(TextStyle(
                      color: Get.theme.primaryColor,
                      fontSize: 15,
                      letterSpacing: 2.2,
                      fontWeight: FontWeight.w100,
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
