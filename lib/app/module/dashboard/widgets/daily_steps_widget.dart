import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../../common/index.dart';
import '../../../models/steps_model.dart';

class DailyStepsWidget extends StatefulWidget {
  const DailyStepsWidget({Key? key}) : super(key: key);

  @override
  State<DailyStepsWidget> createState() => _DailyStepsWidgetState();
}

class _DailyStepsWidgetState extends State<DailyStepsWidget> {
// steps counter
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  int stepsI = 0;
  int stepsTotal = 10000;
  double exactDistance = 0.0;
  double previousDistance = 0.0;

  String getFormatedSteps(int steps) {
    if (steps < 1000) {
      return steps.toString();
    } else {
      return ('${NumberFormat("###.#", "en_US").format(steps / 1000)}k');
    }
  }

  List<charts.Series<Steps, int>> _createSampleData() {
    final data = [
      Steps(
          percentual: stepsI,
          color: charts.MaterialPalette.blue.shadeDefault), //Actual Steps
      Steps(
          percentual: stepsTotal - stepsI,
          color: charts.MaterialPalette.white), //Missing Steps
    ];

    return [
      charts.Series<Steps, int>(
        id: 'Steps',
        domainFn: (Steps steps, _) => steps.percentual,
        measureFn: (Steps steps, _) => steps.percentual,
        colorFn: (Steps steps, _) => steps.color,
        data: data,
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    _createSampleData();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AccelerometerEvent>(
        stream: SensorsPlatform.instance.accelerometerEvents,
        builder: (context, snapshort) {
          if (snapshort.hasData) {
            x = snapshort.data!.x;
            y = snapshort.data!.y;
            z = snapshort.data!.z;
            exactDistance = getValue(x, y, z);
            if (exactDistance > 6) {
              stepsI++;
            }
          }
          return Container(
            height: Get.width * .3,
            width: Get.width * .8,
            decoration: BoxDecoration(
                color: UiMS.parseColor("#f2f3f4"),
                borderRadius: new BorderRadius.all(
                  const Radius.circular(15.0),
                )),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 35,
                    child: Row(
                      children: [
                        Text('Jane Copper',
                            style: Get.textTheme.headline4!.merge(TextStyle(
                              fontSize: 15,
                            ))),
                        Spacer(),
                        SizedBox(
                            width: 22,
                            child: SvgPicture.asset('assets/svg/earn.svg')),
                        SizedBox(width: 2.5),
                        Text(
                          '25k',
                          style: Get.textTheme.bodyMedium!.merge(TextStyle(
                              color: Get.theme.primaryColor, fontSize: 14)),
                        )
                      ],
                    ),
                  ),
                  Row(children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: charts.PieChart<int>(_createSampleData(),
                          animate: false,
                          layoutConfig: charts.LayoutConfig(
                            leftMarginSpec: charts.MarginSpec.fixedPixel(12),
                            topMarginSpec: charts.MarginSpec.fixedPixel(12),
                            rightMarginSpec: charts.MarginSpec.fixedPixel(12),
                            bottomMarginSpec: charts.MarginSpec.fixedPixel(12),
                          ),
                          defaultRenderer:
                              charts.ArcRendererConfig(arcWidth: 4)),
                    ),
                    SizedBox(
                      height: 70,
                      child: Column(children: [
                        Container(
                          width: 150,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Text(getDilyStepsSubtitle(stepsI),
                              style: Get.textTheme.bodyMedium!.merge(
                                  TextStyle(color: Get.theme.primaryColor))),
                        ),
                        Container(
                          height: 35,
                          width: 150,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Row(children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                stepsI.toString(),
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 23),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                '/${getFormatedSteps(stepsTotal)}',
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 18),
                              ),
                            ),
                          ]),
                        ),
                      ]),
                    ),
                  ]),
                ]),
          );
        });
  }

  double getValue(
    double x,
    double y,
    double z,
  ) {
    double magnitude = sqrt(x * x + y * y + z * z);
    getPreviouseValue();
    double modDistance = magnitude - previousDistance;
    setPreviousValue(magnitude);
    return modDistance;
  }

  void setPreviousValue(double distance) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setDouble("perValue", distance);
  }

  void getPreviouseValue() async {
    SharedPreferences perferens = await SharedPreferences.getInstance();
    setState(() {
      previousDistance = perferens.getDouble('perValue') ?? 0;
    });
  }

  getDilyStepsSubtitle(int stepsI) {
    if (stepsI <= 10) {
      return "Let's start".tr;
    } else if (stepsI <= 20) {
      return "Keep going".tr;
    } else if (stepsI <= 30) {
      return "Almost there".tr;
    } else if (stepsI <= 40) {
      return "Well done".tr;
    }
  }
}
