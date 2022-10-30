import 'dart:developer';

import 'package:flutter/material.dart';
import '../Utils/Routes/my_auto_route_paths.dart';
import '../Utils/my_colors.dart';
import '../Utils/my_font.dart';

class DocDrawer {
  DocDrawer({required this.scaffoldKey, required this.context});
  final GlobalKey<ScaffoldState> scaffoldKey;
  final BuildContext context;
  List<Widget> docDrawer() {
    return [
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              scaffoldKey.currentState!.closeDrawer();
            },
          ),
          const SizedBox(
            width: 8,
          ),
          Image.asset('assets/img/logo.png')
        ],
      ),
      const Divider(
        thickness: 2,
      ),
      ListTile(
        title: Text(
          "Getting Started",
          style: MyCustomFonts.getRubik(
            fontSize: 12,
            fontColor: MyCusotmoclors.brilliantAzura,
          ),
        ),
        onTap: () {
          log("Tapped On A Overview");
          //AutoRouter.of(context).pushNamed(gettingStartedDocPathInfo);
        },
      ),
      ExpansionTile(
        trailing: null,
        title: Text(
          "A",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
            fontColor: MyCusotmoclors.brilliantAzura,
          ),
        ),
        children: [
          ListTile(
            title: Text(
              "Overview",
              style: MyCustomFonts.getRubik(
                fontSize: 12,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
            onTap: () {
              log("Tapped On A Overview");
           //   AutoRouter.of(context).pushNamed(aDocPathInfo);
            },
          ),
          ListTile(
            title: Text(
              "a",
              style: MyCustomFonts.getRubik(
                fontSize: 12,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "b",
              style: MyCustomFonts.getRubik(
                fontSize: 12,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "c",
              style: MyCustomFonts.getRubik(
                fontSize: 12,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
          ),
        ],
      ),
      ExpansionTile(
        trailing: null,
        title: Text(
          "B",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
            fontColor: MyCusotmoclors.brilliantAzura,
          ),
        ),
        children: [
          ListTile(
            title: Text(
              "Overview",
              style: MyCustomFonts.getRubik(
                fontSize: 12,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
            onTap: () {
              log("Tapped On B Overview");
           //   AutoRouter.of(context).pushNamed(bDocPathInfo);
            },
          ),
          ListTile(
            title: Text(
              "a",
              style: MyCustomFonts.getRubik(
                fontSize: 12,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "b",
              style: MyCustomFonts.getRubik(
                fontSize: 12,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "c",
              style: MyCustomFonts.getRubik(
                fontSize: 12,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
          ),
        ],
      ),
    ];
  }
}
