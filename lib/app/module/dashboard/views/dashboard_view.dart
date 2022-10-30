import 'package:animate_do/animate_do.dart';
import 'package:b2b_product_app/app/module/dashboard/widgets/risks_widget.dart';
import 'package:b2b_product_app/app/module/global_widgets/index.dart';
import 'package:b2b_product_app/common/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widgets/devices_widget.dart';
import '../widgets/divider_widget.dart';
import '../widgets/my_summary_widget.dart';
import '../widgets/suggestions_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation,
      required this.name,
      required this.idealweight,
      required this.getObesityRate,
      required this.bodyType,
      required this.bmr,
      required this.bmicolor})
      : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;
  final String getObesityRate;
  final String name;
  final String idealweight;
  final String bodyType;
  final String bmr;
  final Color bmicolor;

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentListStyleIndex = 0;

  final key1 = new GlobalKey(debugLabel: '1');
  final key2 = new GlobalKey(debugLabel: '2');
  final key3 = new GlobalKey(debugLabel: '3');
  final key4 = new GlobalKey(debugLabel: '4');

  int _currentIndex = 0;
  String _avatar =
      "https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=461&q=80";
  List<String> _iconsData = [
    'home',
    'recommendations',
    'reports',
    'bio-container',
  ];
  List<String> _titles = [
    'Home',
    'Suggested',
    'Risks',
    'Devices',
  ];
  @override
  void initState() {
    _currentIndex = 0;
    _tabController = TabController(vsync: this, length: 4);
    _currentListStyleIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FatherWidget(
        enableGetBack: false,
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: Container(
                  height: Get.height,
                  color: UiMS.parseColor("#f9fbff"),
                  child: Column(
                    children: [
                      _buildHeaderWidget(),
                      _buildTabViewWidget(),
                      Expanded(
                          child: RemoveScrollGlowWidget(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              MySummaryWidget(
                                key: key1,
                              ),
                              buildMySummaryWidget(),
                              _buildContentWidget(),
                              CustomDivider(),
                              SuggestionsWidget(key: key2),
                              CustomDivider(),
                              RisksWidget(key: key3),
                              CustomDivider(),
                              DevicesWidget(key: key4),
                            ],
                          ),
                        ),
                      )),
                    ],
                  )),
            ),
          ),
        ));
  }

  Widget _buildHeaderWidget() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1), //(x,y)
              blurRadius: 1.0,
              blurStyle: BlurStyle.outer,
            ),
          ],
          color: Colors.white,
          borderRadius: new BorderRadius.all(Radius.circular(15.0))),
      padding: EdgeInsets.only(left: 20, right: 20),
      height: Get.width * .35,
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.all(Radius.circular(50.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: _avatar,
              width: Get.width * .2,
              height: Get.width * .2,
              placeholder: (context, url) => Image.asset(
                'assets/gif/loading.gif',
                fit: BoxFit.cover,
                width: Get.width * .2,
                height: Get.width * .2,
              ),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error_outline)),
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: Text(widget.name, style: Get.textTheme.headline4)),
          ...[
            SizedBox(width: 27, child: SvgPicture.asset('assets/svg/earn.svg')),
            SizedBox(width: 2.5),
            Text(
              '3.5k',
              style: Get.textTheme.bodyMedium!.merge(
                  TextStyle(color: Get.theme.primaryColor, fontSize: 15)),
            )
          ]
        ],
      ),
    );
  }

  Widget _buildTabViewWidget() {
    return Container(
      width: Get.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ExtendedTabBar(
        foregroundIndicator: true,
        automaticIndicatorColorAdjustment: true,
        dragStartBehavior: DragStartBehavior.start,
        indicatorColor: Colors.transparent,
        isScrollable: true,
        indicatorWeight: 2,
        physics: BouncingScrollPhysics(),
        indicatorPadding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        onTap: (_) {
          setState(() {
            _currentIndex = _;
          });
          switch (_) {
            case 0:
              Scrollable.ensureVisible(
                key1.currentContext!,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );

              break;
            case 1:
              Scrollable.ensureVisible(
                key2.currentContext!,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );

              break;
            case 2:
              Scrollable.ensureVisible(
                key3.currentContext!,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );

              break;
            case 3:
              Scrollable.ensureVisible(
                key4.currentContext!,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );

              break;
            default:
              Scrollable.ensureVisible(
                key1.currentContext!,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
          }
        },
        labelColor: Colors.black,
        scrollDirection: Axis.horizontal,
        tabs: <ExtendedTab>[
          ExtendedTab(
            child: _tabViewItem(0),
            scrollDirection: Axis.horizontal,
          ),
          ExtendedTab(
            child: _tabViewItem(1),
            scrollDirection: Axis.horizontal,
          ),
          ExtendedTab(
            child: _tabViewItem(2),
            scrollDirection: Axis.horizontal,
          ),
          ExtendedTab(
            child: _tabViewItem(3),
            scrollDirection: Axis.horizontal,
          ),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget _tabViewItem(int i) {
    return Container(
      height: 30,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          boxShadow: _currentIndex == i
              ? [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1), //(x,y)
                    blurRadius: 1.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ]
              : null,
          color: _currentIndex == i ? Colors.white : Colors.transparent,
          borderRadius: new BorderRadius.all(Radius.circular(15.0))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 27,
            child: SvgPicture.asset(
              'assets/svg/${_iconsData[i]}.svg',
              color:
                  _currentIndex == i ? Get.theme.primaryColor : Colors.black87,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            _titles[i],
            style: Get.textTheme.bodyMedium!.merge(TextStyle(
              fontSize: 16,
              color:
                  _currentIndex == i ? Get.theme.primaryColor : Colors.black87,
            )),
          ),
        ],
      ),
    );
  }

  Widget buildMySummaryWidget() {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 30),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'My Summary',
              style: Get.textTheme.headline2!.merge(TextStyle(
                fontWeight: FontWeight.normal,
              )),
            ),
            Text(
              'tap on any item to see details',
              style: Get.textTheme.caption,
            ),
          ],
        ),
        Spacer(),
        ...[
          _listStyleWidget('irregular-grid', 0),
          SizedBox(width: 10),
          _listStyleWidget('list-details', 1),
          SizedBox(width: 10),
          _listStyleWidget('bubble-map', 2),
        ],
      ]),
    );
  }

  Widget _buildContentWidget() {
    switch (_currentListStyleIndex) {
      case 0:
        return _content1();
      case 1:
        return _content2();
      case 2:
        return _content3();
      default:
        return _content1();
    }
  }

  Widget _content1() {
    return FadeIn(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 10, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _summaryNormalItemWidget(
                    'Risk level', widget.resultText, widget.bmicolor),
                SizedBox(width: 35),
                _summaryNormalItemWidget(
                    'BMI', widget.bmiResult, widget.bmicolor),
                SizedBox(width: 35),
                _summaryNormalItemWidget(
                    'Ideal Weight', widget.idealweight, widget.bmicolor),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _summaryNormalItemWidget(
                    'Obesity Rate', widget.getObesityRate, widget.bmicolor),
                SizedBox(width: 35),
                _summaryNormalItemWidget('BMR', widget.bmr, widget.bmicolor),
                SizedBox(width: 35),
                _summaryNormalItemWidget('Bio Age', '31', widget.bmicolor),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _summaryNormalItemWidget(
                    'Body type', widget.bodyType, widget.bmicolor),
                SizedBox(width: 35),
                _summaryNormalItemWidget(
                    'Subcutaneous Fat', '12%', Colors.amber),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _content2() {
    return FadeIn(
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(left: 20, right: 20, top: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _summaryNormalItemWidget(
                'Risk level', widget.resultText, widget.bmicolor),
            SizedBox(height: 15),
            _summaryNormalItemWidget('BMI', widget.bmiResult, widget.bmicolor),
            SizedBox(height: 15),
            _summaryNormalItemWidget(
                'Ideal Weight', widget.idealweight, widget.bmicolor),
            SizedBox(height: 15),
            _summaryNormalItemWidget(
                'Obesity Rate', widget.getObesityRate, widget.bmicolor),
            SizedBox(height: 15),
            _summaryNormalItemWidget('BMR', widget.bmr, widget.bmicolor),
            SizedBox(height: 15),
            _summaryNormalItemWidget('Bio Age', '31', Colors.black),
            SizedBox(height: 15),
            _summaryNormalItemWidget(
                'Body type', widget.bodyType, widget.bmicolor),
            SizedBox(height: 15),
            _summaryNormalItemWidget('Subcutaneous Fat', '15%', Colors.amber),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget _content3() {
    return FadeIn(
      child: Container(
        width: Get.width,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Wrap(children: [
          _summaryNormalItemWidget1(
              'Risk level', widget.resultText, widget.bmicolor, 0.9),
          SizedBox(height: 15),
          _summaryNormalItemWidget1(
              'BMI', widget.bmiResult, widget.bmicolor, 0.6),
          SizedBox(height: 15),
          _summaryNormalItemWidget1(
              'Ideal Weight', widget.idealweight, widget.bmicolor, 1),
          SizedBox(height: 15),
          _summaryNormalItemWidget1(
              'Obesity Rate', widget.getObesityRate, widget.bmicolor, 1),
          SizedBox(height: 15),
          _summaryNormalItemWidget1('BMR', widget.bmr, widget.bmicolor, 1),
          SizedBox(height: 15),
          _summaryNormalItemWidget1('Bio Age', '25', Colors.black, 1),
          SizedBox(height: 15),
          _summaryNormalItemWidget1(
              'Body type', widget.bodyType, widget.bmicolor, 1),
          SizedBox(height: 15),
          _summaryNormalItemWidget1('Subcutaneous Fat', '15%', Colors.amber, 1),
          SizedBox(height: 15),
        ]),
      ),
    );
  }

  Widget _listStyleWidget(
    String iconName,
    int index,
  ) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {
        setState(() {
          _currentListStyleIndex = index;
        });
      },
      child: SizedBox(
        width: 25,
        child: SvgPicture.asset(
          'assets/svg/$iconName.svg',
          color: _currentListStyleIndex == index
              ? Get.theme.primaryColor
              : Colors.black,
        ),
      ),
    );
  }

  Widget _summaryNormalItemWidget(
    String label2,
    String value2,
    Color color,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label2,
          style: Get.textTheme.headline2!.merge(TextStyle(
              fontWeight: FontWeight.w800, fontSize: 14, letterSpacing: 0.8)),
        ),
        Text(
          value2,
          style: Get.textTheme.headline2!.merge(TextStyle(
              fontWeight: FontWeight.normal, color: color, letterSpacing: 1)),
        ),
      ],
    );
  }

  Widget _summaryNormalItemWidget1(
    String title,
    String subtitle,
    Color color,
    double rate,
  ) {
    return Container(
      width: HelperMS.getRadius(title, subtitle),
      height: HelperMS.getRadius(title, subtitle),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          //elevation same card
          color: color == Colors.white ? Colors.grey : color.withOpacity(0.1),
          borderRadius: new BorderRadius.all(
            Radius.circular(150.0),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Get.textTheme.headline2!.merge(TextStyle(
                fontWeight: FontWeight.w800, fontSize: 14, letterSpacing: 0.8)),
          ),
          Text(
            subtitle,
            style: Get.textTheme.headline2!.merge(TextStyle(
                fontWeight: FontWeight.normal, color: color, letterSpacing: 2)),
          ),
        ],
      ),
    );
  }
}
