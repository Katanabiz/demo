import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        height: 1,
        color: Get.theme.primaryColor.withOpacity(0.5),
      ),
    );
  }
}
