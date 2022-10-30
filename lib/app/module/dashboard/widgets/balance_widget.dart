import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/index.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({Key? key}) : super(key: key);

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width * .3,
      width: Get.width * .8,
      margin: EdgeInsets.only(left: 20, right: 20),
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
              height: 45,
              child: Row(
                children: [
                  Text('My Balance',
                      style: Get.textTheme.headline4!.merge(TextStyle(
                        fontSize: 15,
                      ))),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: RichText(
                text: TextSpan(
                    text: '3.',
                    style: Get.textTheme.headline1!.merge(TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColor,
                    )),
                    children: <TextSpan>[
                      TextSpan(
                        text: '578  ',
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      TextSpan(
                        text: "\$LONG",
                        style: TextStyle(color: Colors.black87, fontSize: 15),
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 22)
          ]),
    );
  }
}
