import 'package:b2b_product_app/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'divider_widget.dart';
import 'header_widget.dart';

class SuggestionsWidget extends StatefulWidget {
  const SuggestionsWidget({Key? key}) : super(key: key);

  @override
  State<SuggestionsWidget> createState() => _SuggestionsWidgetState();
}

class _SuggestionsWidgetState extends State<SuggestionsWidget> {
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
          HeaderWidget(title: 'Suggestions'),
          _buildPropertiesListWidget(),
          _reportDetailsWidget('Walk more than 8k steps per day', 'triangle'),
          CustomDivider(),
          _reportDetailsWidget('Lower your cholesterol', 'triangle-outline',
              'Cholesterol level should be less than 5\nCurrent: 5,7 mmol/L'),
          CustomDivider(),
          _reportDetailsWidget(
              'Limit alcohol consumption to 1~2 glasses a day', 'rectangle'),
          CustomDivider(),
          _reportDetailsWidget(
              'Limit alcohol consumption to 1~2 glasses a day', 'circle'),
          SizedBox(height: 30),
          _buildBannerWidget(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPropertiesListWidget() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 30,
      child: Row(
        children: [
          Text(
            'Priority',
            style: Get.textTheme.headline6!.merge(TextStyle(
              fontWeight: FontWeight.normal,
            )),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                  width: 22, child: SvgPicture.asset('assets/svg/sort.svg'))),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10),
                  _buildTagWidget('All', 0),
                  SizedBox(width: 10),
                  _buildTagWidget('BMI', 1),
                  SizedBox(width: 10),
                  _buildTagWidget('CVD', 2),
                  SizedBox(width: 10),
                  _buildTagWidget('Disease3', 3),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTagWidget(String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentTagIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _currentTagIndex == index
                ? Get.theme.primaryColor
                : UiMS.parseColor("#bfd7ff"),
            borderRadius: new BorderRadius.all(Radius.circular(30.0))),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: Text(title,
            style: Get.textTheme.headline4!.merge(TextStyle(
                fontWeight: FontWeight.normal,
                color: _currentTagIndex == index ? Colors.white : Colors.black,
                fontSize: 13))),
      ),
    );
  }

  Widget _reportDetailsWidget(String title, String iconData,
      [String subtitle = '']) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 22,
                child: SvgPicture.asset('assets/svg/$iconData.svg'),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Text(title,
                    style: Get.textTheme.headline5!
                        .merge(TextStyle(fontWeight: FontWeight.normal))),
              ),
            ],
          ),
          if (subtitle != '')
            Text(subtitle,
                style: Get.textTheme.headline4!.merge(TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 15, height: 2.3))),
          SizedBox(height: 15)
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
