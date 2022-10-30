import 'package:b2b_product_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'header_widget.dart';

class DevicesWidget extends StatefulWidget {
  const DevicesWidget({Key? key}) : super(key: key);

  @override
  State<DevicesWidget> createState() => _DevicesWidgetState();
}

class _DevicesWidgetState extends State<DevicesWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          HeaderWidget(title: 'Devices'),
          _buildDeviceWidget1('ScanWatch'),
          _buildDeviceWidget2('Longevity BioContainer', 'bio-container'),
          _buildBannerWidget(),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildDeviceWidget1(
    String title,
  ) {
    return ScaleTap(
      onPressed: () {},
      child: Container(
        width: Get.width,
        height: 80,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                width: 30,
                child: Icon(
                  Icons.watch,
                  size: 26,
                  color: Get.theme.primaryColor,
                )

                // SvgPicture.asset('assets/svg/tt.svg')

                ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Get.textTheme.headline6,
                ),
                SizedBox(height: 2.5),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 15,
                        height: 15,
                        child: SvgPicture.asset(
                          'assets/svg/verified.svg',
                          color: UiMS.parseColor('#3ddf7f'),
                        )),
                    SizedBox(width: 5),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.5),
                      child: Text('connected',
                          style: Get.textTheme.caption!.merge(
                              TextStyle(color: UiMS.parseColor('#3ddf7f')))),
                    ),
                  ],
                )
              ],
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Icon(LineIcons.angleRight)),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceWidget2(
    String title,
    String iconData,
  ) {
    return ScaleTap(
      onPressed: () {},
      child: Container(
        width: Get.width,
        height: 80,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 35, right: 35),
                width: 30,
                child: SvgPicture.asset('assets/svg/$iconData.svg')),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Get.textTheme.headline6,
                ),
                SizedBox(height: 2.5),
                SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...[
                        SizedBox(
                            width: 15,
                            height: 15,
                            child: SvgPicture.asset(
                              'assets/svg/verified.svg',
                              color: UiMS.parseColor('#3ddf7f'),
                            )),
                        SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 3.5),
                          child: Text('connected',
                              style: Get.textTheme.caption!.merge(TextStyle(
                                  color: UiMS.parseColor('#3ddf7f')))),
                        ),
                      ],
                      SizedBox(width: Get.width * .135),
                      ...[
                        SizedBox(
                            width: 15,
                            height: 15,
                            child: SvgPicture.asset(
                              'assets/svg/battery.svg',
                              color: Get.theme.primaryColor,
                            )),
                        SizedBox(width: 10),
                        Text('87%',
                            style: Get.textTheme.caption!.merge(
                                TextStyle(color: Get.theme.primaryColor))),
                      ]
                    ],
                  ),
                )
              ],
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Icon(LineIcons.angleRight)),
          ],
        ),
      ),
    );
  }

  Widget _buildBannerWidget() {
    return Container(
      margin: EdgeInsets.only(top: 25, bottom: 45, left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: new BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 80,
            width: Get.width,
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    width: 30,
                    child: SvgPicture.asset('assets/svg/bio-container.svg')),
                Text(
                  'Portable BioContainer',
                  style: Get.textTheme.headline6!.merge(
                      TextStyle(fontSize: 18, fontWeight: FontWeight.normal)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Track more by sending bio material for analysis by specialists',
              style: Get.textTheme.headline1!
                  .merge(TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(height: 20),
          ScaleTap(
              scaleMinValue: 1.2,
              onPressed: () {},
              child: Container(
                margin: EdgeInsets.only(top: 15),
                padding:
                    EdgeInsets.only(left: 35, right: 35, top: 7, bottom: 10),
                decoration: BoxDecoration(
                    //elevation same card
                    color: Get.theme.primaryColor,
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(40.0))),
                child: Text('Pre Order',
                    style: Get.textTheme.headline6!
                        .merge(TextStyle(color: Colors.white))),
              )),
          SizedBox(height: 25),
          ScaleTap(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Don't Show Again",
                style: Get.textTheme.headline1!.merge(TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Get.theme.primaryColor)),
              ),
            ),
          ),
          SizedBox(height: 25)
        ],
      ),
    );
  }
}
