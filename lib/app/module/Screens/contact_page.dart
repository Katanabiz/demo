import 'dart:developer';

import 'package:flutter/material.dart';

import '../Utils/my_colors.dart';
import '../Utils/my_font.dart';
import '../Utils/my_global_variables.dart';
import '../Utils/my_global_widgets.dart';
import '../dashboard/views/bio_parameters_view.dart';
import 'documentation_page.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late List<Widget> drawerList;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var contacyFormKey = GlobalKey<FormState>();

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
      body: CustomScrollView(slivers: <Widget>[
        sliverAppBar(scaffoldKey, gloabalPinnedSliverAppBar),
        sliverSpacer(50),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RichText(
              text: TextSpan(
                text: "See how our app works with a demo.",
                style: MyCustomFonts.getDmSans(
                  fontColor: MyCusotmoclors.maastrichtBlue,
                  fontSize: 45,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
        sliverSpacer(40),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: RichText(
              text: TextSpan(
                text: "Fill the form below and get started.",
                style: MyCustomFonts.getRubik(
                  fontColor: MyCusotmoclors.maastrichtBlue.withAlpha(150),
                  fontSize: 16,
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
            child: Form(
              key: contacyFormKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter you first name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter you last name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter you email address';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter you phone number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Phone',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter you company name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Company',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'How do you hear about us?',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          "Where did you find out about Longevity? eg. Google search, recommendations from a colleague, HubSpot Marketplace, etc.",
                      style: MyCustomFonts.getRubik(
                        fontColor: MyCusotmoclors.maastrichtBlue.withAlpha(200),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      if (contacyFormKey.currentState!.validate()) {
                        log("Can Move Forward");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => const BioParametersView(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: const LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                MyCusotmoclors.brilliantAzura,
                                Color(0xff003191),
                              ])),
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "GET A FREE DEMO",
                            style: MyCustomFonts.getRubik(
                              fontColor: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
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
}
