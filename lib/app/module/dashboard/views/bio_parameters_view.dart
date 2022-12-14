import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_selector/widget/flutter_single_select.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get/get.dart';

import '../../../models/bmi_calculator_model.dart';
import '../../../routes/app_routes.dart';
import 'dashboard_view.dart';

class BioParametersView extends StatefulWidget {
  const BioParametersView({super.key});
  static String id = "BioParametersView";

  @override
  State<BioParametersView> createState() => _BioParametersViewState();
}

class _BioParametersViewState extends State<BioParametersView> {
  String name = "";
  int height = 180;
  int weight = 60;
  int age = 20;
  Country country = CountryPickerUtils.getCountryByIsoCode('US');

  Widget _buildDropdownItem(Country country) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(
            width: 20.0,
          ),
          Text("${country.isoCode}"),
        ],
      );

  List<String> selected_diseases = [];
  List<String> diseases = [
    'diabetes',
    'breast cancer',
    'heart attack',
    'stroke',
    'other',
  ];

  String blood_type = "";
  List<String> blood_types = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: const [
                          Icon(Icons.person_add_alt_rounded,
                              size: 30, color: Color(0xff3683FC)),
                          SizedBox(width: 5),
                          Text("1/ea",
                              style: TextStyle(
                                  color: Color(0xff3683FC), fontSize: 20)),
                        ],
                      ),
                    ),
                    SizedBox(
                        child: ScaleTap(
                            scaleMinValue: 1.2,
                            onPressed: () {
                              Get.toNamed(Routes.root);
                            },
                            child: Row(
                              children: [
                                Text('Skip',
                                    style: Get.textTheme.headline6!
                                        .merge(TextStyle(color: Colors.black))),
                                Icon(Icons.keyboard_arrow_right,
                                    size: 30, color: Colors.black),
                              ],
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Add basic profile information, we encourage you to add fill all fields correctly to get fully precise results',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Text("Where are you from?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                      CountryPickerDropdown(
                        isExpanded: true,
                        initialValue: 'US',
                        itemBuilder: _buildDropdownItem,
                        sortComparator: (Country a, Country b) =>
                            a.isoCode.compareTo(b.isoCode),
                        onValuePicked: (Country country) {
                          setState(() {
                            country = country;
                          });
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.black12,
                        activeTrackColor: Colors.black45,
                        thumbColor: const Color(0xff3683FC),
                        overlayColor: const Color.fromARGB(41, 21, 35, 235),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                onPressed: (() {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                                icon: const Icon(Icons.remove, size: 30)),
                            const SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                                onPressed: (() {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                                icon: const Icon(
                                  Icons.add,
                                  size: 30,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Age',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                                onPressed: (() {
                                  setState(() {
                                    age--;
                                  });
                                }),
                                icon: const Icon(
                                  Icons.remove,
                                  size: 30,
                                )),
                            const SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                                onPressed: (() {
                                  setState(() {
                                    age++;
                                  });
                                }),
                                icon: const Icon(
                                  Icons.add,
                                  size: 30,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    const Text("What is your blood type?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    CustomSingleSelectField<String>(
                      selectedItemColor: const Color(0xff3683FC),
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.bloodtype_outlined,
                          color: Color(0xff3683FC),
                        ),
                        hoverColor: const Color(0xff3683FC),
                        hintText: "Select your blood type",
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 43, 102, 196)
                              .withOpacity(0.5),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                      ),
                      items: blood_types,
                      title: "Blood Type",
                      onSelectionDone: (value) {
                        blood_type = value;
                        setState(() {});
                      },
                      itemAsString: (item) => item,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    const Text("do you experience any of the following?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    ChipsChoice<String>.multiple(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      padding: const EdgeInsets.all(15),
                      choiceActiveStyle: const C2ChoiceStyle(
                        backgroundColor: Color(0xff3683FC),
                        color: Colors.white,
                      ),
                      choiceStyle: C2ChoiceStyle(
                        borderRadius: BorderRadius.circular(15.0),
                        borderColor: const Color(0xff3683FC),
                        borderWidth: 2.0,
                        color: const Color(0xff3683FC),
                      ),
                      value: selected_diseases,
                      onChanged: (val) {
                        setState(() => selected_diseases = val);
                      },
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: diseases,
                        value: (i, v) => v,
                        label: (i, v) => v,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: MaterialButton(
                  minWidth: double.infinity,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  onPressed: () {
                    Brain brain = Brain(
                      height: height,
                      weight: weight,
                      age: age,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardView(
                          bmiResult: brain.calculateBMI(),
                          bmicolor: brain.getColor(),
                          resultText: brain.getResult(),
                          interpretation: brain.getInterpretation(),
                          getObesityRate: brain.getObesityRate(),
                          bodyType: brain.getBodyType(),
                          name: name,
                          idealweight: brain.getIdealWeight(),
                          bmr: brain.getbmr(),
                        ),
                      ),
                    );
                  },
                  color: const Color(0xff3683FC),
                  child: const Text(
                    "Go to dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
