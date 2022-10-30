import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderTabViewWidget extends StatefulWidget {
  HeaderTabViewWidget({required this.tabController});
  final TabController tabController;
  @override
  _HeaderTabViewWidgetState createState() => _HeaderTabViewWidgetState();
}

class _HeaderTabViewWidgetState extends State<HeaderTabViewWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: Colors.white,
      child: ExtendedTabBar(
        foregroundIndicator: true,
        automaticIndicatorColorAdjustment: true,
        dragStartBehavior: DragStartBehavior.start,
        indicatorColor: Colors.amber,
        isScrollable: true, indicatorWeight: 2,
        physics: BouncingScrollPhysics(),

        // indicator: ColorTabIndicator(
        //   Colors.transparent,
        // ),
        labelColor: Colors.black,
        scrollDirection: Axis.horizontal,
        tabs: <ExtendedTab>[
          ExtendedTab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                  child: Text(
                'General'.tr,
                style: Get.textTheme.bodyText1!
                    .merge(TextStyle(fontSize: 16, color: Colors.black54)),
              )),
            ),
            scrollDirection: Axis.horizontal,
          ),
          ExtendedTab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                  child: Text(
                'History & Condition'.tr,
                style: Get.textTheme.bodyText1!
                    .merge(TextStyle(fontSize: 16, color: Colors.black54)),
              )),
            ),
            scrollDirection: Axis.horizontal,
          ),
          ExtendedTab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                  child: Text(
                'Interior'.tr,
                style: Get.textTheme.bodyText1!
                    .merge(TextStyle(fontSize: 16, color: Colors.black54)),
              )),
            ),
            scrollDirection: Axis.horizontal,
          ),
          ExtendedTab(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                  child: Text(
                'Exterior'.tr,
                style: Get.textTheme.bodyText1!
                    .merge(TextStyle(fontSize: 16, color: Colors.black54)),
              )),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ],
        controller: widget.tabController,
      ),
    );
  }
}
