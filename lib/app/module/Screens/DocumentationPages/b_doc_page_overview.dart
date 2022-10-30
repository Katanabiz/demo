import 'package:flutter/material.dart';

import '../../Components/doc_drawer.dart';
import '../../Utils/my_global_variables.dart';
import '../../Utils/my_global_widgets.dart';


class BDocPageOverView extends StatefulWidget {
  const BDocPageOverView({Key? key}) : super(key: key);

  @override
  State<BDocPageOverView> createState() => _BDocPageOverViewState();
}

class _BDocPageOverViewState extends State<BDocPageOverView> {
  late List<Widget> drawerList;
  late DocDrawer docDrawer;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    docDrawer = DocDrawer(scaffoldKey: scaffoldKey, context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: drawerWidget(),
      body: CustomScrollView(
        slivers: <Widget>[
          sliverAppBar(scaffoldKey, gloabalPinnedSliverAppBar),
          sliverSpacer(50),
          const SliverToBoxAdapter(
            child: Center(
              child: Text("B Page"),
            ),
          ),
        ],
      ),
    );
  }

  ///<summary>
  ///
  ///   drawerWidget is called From the scaffold,
  ///   shows all the content from a list.
  ///
  ///</summary>
  Widget drawerWidget() {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: docDrawer.docDrawer(),
        ),
      ),
    );
  }
}
