import 'package:flutter/material.dart';

///<summary>
///
///   sliverSpacer is used for vertical spacing
///
///</summary>
Widget sliverSpacer(double? height) {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: height ?? 0,
    ),
  );
}

/*<summary>

   sliverAppBar is used for sliver Appbar

</summary>*/

Widget sliverAppBar(
    GlobalKey<ScaffoldState> scaffoldKey, bool pinnedSliverAppBar) {
  return SliverAppBar(
    title: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Image(image: AssetImage('assets/img/logo.png')),          

    ),
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(
        Icons.menu,
        color: Colors.blue,
      ),
      onPressed: () => scaffoldKey.currentState!.openDrawer(),
    ),
    pinned: pinnedSliverAppBar,
  );
}
