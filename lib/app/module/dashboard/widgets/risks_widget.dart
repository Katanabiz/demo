import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/index.dart';
import 'divider_widget.dart';
import 'header_widget.dart';

class RisksWidget extends StatefulWidget {
  const RisksWidget({Key? key}) : super(key: key);
  @override
  State<RisksWidget> createState() => _RisksWidgetState();
}

class _RisksWidgetState extends State<RisksWidget> {
  int _currentTagIndex = 0;
  @override
  void initState() {
    _currentTagIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWidget(title: 'Biomarker Analysis & Risks', hideButton: true),
          _reportDetailsWidget1(
              'Risk level is normal', '50%', Get.theme.primaryColor),
          CustomDivider(),
          _reportDetailsWidget1('BMI (Bio Mass Index)', '18.8', Colors.red),
          CustomDivider(),
          _reportDetailsWidget1('Weight Excess', 'Overweight', Colors.red),
          _reportDetailsWidget3('Ideal Weight', '-20.1kg remaining to match!',
              '60.2', UiMS.parseColor("#22db6c")),
          CustomDivider(),
          _reportDetailsWidget2(
              'Probability of being affected by severe diseases in next 10 years',
              '60%',
              Colors.amber),
          CustomDivider(),
          _reportDetailsWidget2(
              'Changes of being affected by immunity related diseases in the next 2 years',
              '20%',
              UiMS.parseColor("#22db6c")),
          _reportDetailsWidget4(
              'Your cancer risks are the same like other people with normal weight',
              '-',
              UiMS.parseColor("#22db6c")),
          CustomDivider(),
          _reportDetailsWidget4(
              'Your lung capacity is normal', '-', UiMS.parseColor("#22db6c")),
          CustomDivider(),
          SizedBox(height: 55),
          _buildBannerWidget(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _reportDetailsWidget1(String title,
      [String subtitle = '', Color color = Colors.black]) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: Get.width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(title,
                style: Get.textTheme.headline4!
                    .merge(TextStyle(fontWeight: FontWeight.normal))),
          ),
          Text(subtitle,
              style: Get.textTheme.headline3!.merge(
                  TextStyle(fontWeight: FontWeight.normal, color: color))),
        ],
      ),
    );
  }

  Widget _reportDetailsWidget2(String title,
      [String subtitle = '', Color color = Colors.black]) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: Get.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: Get.width,
            child: Text(title,
                style: Get.textTheme.headline4!
                    .merge(TextStyle(fontWeight: FontWeight.normal))),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: Get.width,
            child: Text(subtitle,
                style: Get.textTheme.headline3!.merge(
                    TextStyle(fontWeight: FontWeight.normal, color: color))),
          ),
        ],
      ),
    );
  }

  Widget _reportDetailsWidget3(String title,
      [String subtitle = '', String result = '', Color color = Colors.black]) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Text(title,
                      style: Get.textTheme.headline4!
                          .merge(TextStyle(fontWeight: FontWeight.normal))),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(subtitle,
                      style: Get.textTheme.caption!.merge(TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.black87))),
                ),
              ],
            ),
          ),
          Text(result,
              style: Get.textTheme.headline3!.merge(
                  TextStyle(fontWeight: FontWeight.normal, color: color))),
        ],
      ),
    );
  }

  Widget _reportDetailsWidget4(String title,
      [String result = '', Color color = Colors.black]) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            child: Text(title,
                style: Get.textTheme.headline4!
                    .merge(TextStyle(fontWeight: FontWeight.normal))),
          ),
          Container(
            width: 50,
            child: Center(
              child: Text(result,
                  style: Get.textTheme.headline3!.merge(TextStyle(
                      fontWeight: FontWeight.normal,
                      color: color,
                      fontSize: 30))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerWidget() {
    return Container(
      height: Get.width * .5,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: Get.width,
            child: SvgPicture.asset('assets/svg/bg.svg'),
          ),
          Container(
            height: Get.width * .8,
            width: Get.width,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text(
                  'Looking for more personal recomendations and risk reportts?',
                  style: Get.textTheme.headline4!.merge(TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal)),
                ),
                SizedBox(height: 10),
                Text(
                  'Subscribe & get 1 month free',
                  style: Get.textTheme.headline5!.merge(TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold)),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    ScaleTap(
                        scaleMinValue: 1.2,
                        onPressed: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(
                              left: 35, right: 35, top: 7, bottom: 10),
                          decoration: BoxDecoration(
                              //elevation same card
                              color: Colors.white,
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(40.0))),
                          child: Text('Subscribe',
                              style: Get.textTheme.headline6!.merge(
                                  TextStyle(color: Get.theme.primaryColor))),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
