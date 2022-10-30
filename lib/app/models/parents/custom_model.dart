
import 'package:flutter/cupertino.dart';

import '../../../common/index.dart';

abstract class CustomModel {
  void fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }

  Color colorFromJson(Map<String, dynamic>? json, String attribute,
      {String defaultHexColor = "#000000"}) {
    try {
      return UiMS.parseColor(json != null
          ? json[attribute] != null
              ? json[attribute].toString()
              : defaultHexColor
          : defaultHexColor);
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }


}
