import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'balance_widget.dart';
import 'daily_steps_widget.dart';

class MySummaryWidget extends StatefulWidget {
  const MySummaryWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MySummaryWidget> createState() => _MySummaryWidgetState();
}

class _MySummaryWidgetState extends State<MySummaryWidget> {
  List cardList = [DailyStepsWidget(), BalanceWidget()];

  List<T> map<T>(List list, Function handle) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handle(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              height: 105.0,
              enableInfiniteScroll: false,
            ),
            items: cardList.map((card) {
              return Builder(builder: (BuildContext context) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: card,
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }
}
