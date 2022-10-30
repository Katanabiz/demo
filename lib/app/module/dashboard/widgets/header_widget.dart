import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {this.hideButton = false, required this.title, this.onTap, Key? key})
      : super(key: key);
  final String title;
  final Function? onTap;
  final bool hideButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          title,
          style: Get.textTheme.headline2!.merge(TextStyle(
            fontWeight: FontWeight.normal,
          )),
        ),
        Spacer(),
        if (!hideButton)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: ScaleTap(
              onPressed: () {
                if (onTap != null) {
                  onTap!();
                }
              },
              scaleMinValue: 1.2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'All',
                    style: Get.textTheme.titleSmall!.merge(TextStyle(
                      color: Get.theme.primaryColor,
                    )),
                  ),
                  SizedBox(width: 7),
                  SizedBox(
                      width: 18,
                      child: SvgPicture.asset('assets/svg/input-icon.svg')),
                ],
              ),
            ),
          )
      ]),
    );
  }
}
