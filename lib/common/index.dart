library common;

import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io' as io;
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'package:line_icons/line_icons.dart';
import 'package:path/path.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart';
// import '../app/module/global_views/something_went_wrong_widget.dart';
import '../app/module/global_widgets/index.dart';
import '/app/models/parents/custom_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

//configs
part 'configs/api.dart';
part 'configs/config_x.dart';

//constants
part 'constants/constants.dart';

//enums
part 'enums/error_type_enum.dart';
part 'enums/success_type_enum.dart';
//error codes
part 'error_codes/error_codes.dart';
part 'error_codes/error_messages.dart';

//success codes

//tools
part 'tools/date_ms.dart';
part 'tools/developer_kit_ms.dart';
part 'tools/helper_ms.dart';
part 'tools/screen_ms.dart';
part 'tools/text_ms.dart';
part 'tools/time_ms.dart';
part 'tools/ui_ms.dart';
part 'tools/validate_ms.dart';
part 'tools/dummy_data_ms.dart';
part 'tools/exception_ms.dart';
// part 'tools/response_ms.dart';
