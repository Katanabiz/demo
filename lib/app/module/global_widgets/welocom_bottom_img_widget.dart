import 'package:flutter/material.dart';

class WelcomeBottomImgWidget extends StatelessWidget {
  const WelcomeBottomImgWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/img/upper.png',

      fit: BoxFit.cover,
      // width: double.infinity,
    );
  }
}
