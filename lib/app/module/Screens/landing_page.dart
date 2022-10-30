import 'package:flutter/material.dart';

import '../Utils/my_colors.dart';
import '../Utils/my_font.dart';
import '../Utils/my_global_variables.dart';
import '../Utils/my_global_widgets.dart';
import 'contact_page.dart';


class DemoUserScreen extends StatefulWidget {
  const DemoUserScreen({Key? key}) : super(key: key);

  @override
  State<DemoUserScreen> createState() => _DemoUserScreenState();
}

class _DemoUserScreenState extends State<DemoUserScreen> {
  //Drawer List
  late List<Widget> drawerList;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    drawerList = [
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              scaffoldKey.currentState!.closeDrawer();
            },
          ),
          SizedBox(
            width: 8,
          ),
          Image.asset('assets/images/logo.png')
        ],
      ),
      const Divider(
        thickness: 2,
      ),
      ListTile(
        title: Text(
          "DOCUMENTATION",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
            fontColor: MyCusotmoclors.brilliantAzura,
          ),
        ),
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (builder) => const DocumentationPage(),
          //   ),
          // );
        },
      ),
      ListTile(
        title: Text(
          "FIND A DOCTOR",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
            fontColor: MyCusotmoclors.brilliantAzura,
          ),
        ),
      ),
      ListTile(
        title: Text(
          "CONNECT TO CARE",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
            fontColor: MyCusotmoclors.brilliantAzura,
          ),
        ),
      ),
      ListTile(
        title: Text(
          "FIND LOWEST DRUG PRICES",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
            fontColor: MyCusotmoclors.brilliantAzura,
          ),
        ),
      ),
      ListTile(
        title: Text(
          "FIND A DOCTOR",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
            fontColor: MyCusotmoclors.brilliantAzura,
          ),
        ),
      ),
      ExpansionTile(
        title: Text(
          "HEALTH A-Z",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
            fontColor: MyCusotmoclors.brilliantAzura,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_sharp,
          color: MyCusotmoclors.brilliantAzura,
        ),
        children: [
          ListTile(
            title: Text(
              "A",
              style: MyCustomFonts.getRubik(
                fontSize: 14,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "B",
              style: MyCustomFonts.getRubik(
                fontSize: 14,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "C",
              style: MyCustomFonts.getRubik(
                fontSize: 14,
                fontColor: MyCusotmoclors.brilliantAzura,
              ),
            ),
          ),
        ],
      ),
      ListTile(
        title: Text(
          "Contact",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => const ContactPage(),
            ),
          );
        },
      ),
      ListTile(
        title: Text(
          "Pricing",
          style: MyCustomFonts.getRubik(
            fontSize: 14,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => const ContactPage(),
            ),
          );
        },
      ),
    ];
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RichText(
                text: TextSpan(
                  text: "Your Data Can Cure You",
                  style: MyCustomFonts.getDmSans(
                    fontColor: MyCusotmoclors.maastrichtBlue,
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          sliverSpacer(20),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RichText(
                text: TextSpan(
                  text:
                      "Early stages prediction & prevention of severe diseases that can significantly extend your health span. Powered by artificial intelligence, verified by scientists, generated by Big Data obtained from evidence based only clinical trials.",
                  style: MyCustomFonts.getDmSans(
                    fontColor: MyCusotmoclors.maastrichtBlue.withAlpha(120),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          sliverSpacer(20),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RichText(
                text: TextSpan(
                  text:
                      " We believe that you want to see how your children will raise their grandchildren. We intend to deliver you this product InTime!",
                  style: MyCustomFonts.getDmSans(
                    fontColor: MyCusotmoclors.maastrichtBlue.withAlpha(120),
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          sliverSpacer(20),
          bookADemo(),
          sliverSpacer(50),
          panelTitle(
            text: "Explore many benifits of joining Longevity Intime ",
          ),
          sliverSpacer(20),
          subPanelTextOnly(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
          ),
          sliverSpacer(20),
          subPanelTextOnly(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
          ),
          sliverSpacer(50),
          panelTitle(
              text: "Explore many benifits of joining Longevity Intime ",
              textAlign: TextAlign.center),
          sliverSpacer(20),
          subPanelTextOnly(
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
              textAlign: TextAlign.center),
          sliverSpacer(20),
          iconPanel(
            iconData: Icons.code,
            heading: "Coding skills: ",
            content:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
          ),
          sliverSpacer(20),
          iconPanel(
            iconData: Icons.code,
            heading: "Coding skills: ",
            content:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
          ),
          sliverSpacer(20),
          iconPanel(
            iconData: Icons.code,
            heading: "Coding skills: ",
            content:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
          ),
          sliverSpacer(20),
          iconPanel(
            iconData: Icons.code,
            heading: "Coding skills: ",
            content:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
          ),
          sliverSpacer(50),
          panelTitle(
              text: "Explore many benifits of joining Longevity Intime ",
              textAlign: TextAlign.center),
          sliverSpacer(20),
          subPanelTextOnly(
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
              textAlign: TextAlign.center),
          sliverSpacer(50),
          SliverToBoxAdapter(
            child: Container(
              height: 450,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: const Card(),
            ),
          ),
          sliverSpacer(50),
          SliverToBoxAdapter(
            child: Container(
              height: 450,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: const Card(),
            ),
          ),
          sliverSpacer(50),
          SliverToBoxAdapter(
            child: Container(
              height: 450,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: const Card(),
            ),
          ),
          sliverSpacer(50),
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
          children: drawerList,
        ),
      ),
    );
  }

  ///<summary>
  ///
  ///   bookADemo is a button which,
  ///   navigates to the contact page.
  ///
  ///</summary>
  Widget bookADemo() {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => const ContactPage(),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  MyCusotmoclors.brilliantAzura,
                  Color(0xff003191),
                ],
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  "Book A Demo",
                  style: MyCustomFonts.getRubik(
                    fontColor: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///<summary>
  ///
  ///   panelTitle is a Title bar for a panel.
  ///
  ///</summary>
  Widget panelTitle(
      {required String text, double? fontSize, TextAlign? textAlign}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: RichText(
          textAlign: textAlign ?? TextAlign.start,
          text: TextSpan(
            text: text,
            style: MyCustomFonts.getDmSans(
              fontColor: MyCusotmoclors.maastrichtBlue,
              fontSize: fontSize ?? 32,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }

  ///<summary>
  ///
  ///   subPanelTextOnly is where the text of a panel is showen
  ///
  ///</summary>
  Widget subPanelTextOnly({required String text, TextAlign? textAlign}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: RichText(
          textAlign: textAlign ?? TextAlign.start,
          text: TextSpan(
            text: text,
            style: MyCustomFonts.getDmSans(
              fontColor: MyCusotmoclors.maastrichtBlue,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  ///<summary>
  ///
  ///   iconPanel shows a sub panel with icon, title and content
  ///
  ///</summary>
  Widget iconPanel({
    required IconData iconData,
    required String heading,
    required String content,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(iconData),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: heading,
                  style: MyCustomFonts.getDmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    fontColor: Colors.black87,
                  ),
                ),
                TextSpan(
                  text: content,
                  style: MyCustomFonts.getDmSans(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontColor: Colors.black87,
                  ),
                ),
              ])),
            )
          ],
        ),
      ),
    );
  }
}
