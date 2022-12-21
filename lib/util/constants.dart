import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static SharedPreferences? sharedPref;
  static const kTextColor = Color(0XFF1E2432);
  static const kMediumTextColor = Color(0XFF53627C);
  static const kLightColor = Color(0XFFACB1C0);
  static const kPrimaryColor = Color.fromARGB(255, 67, 143, 74);
  static const kFormFillColor = Color(0XFFfdfff5);
  final kPrimaryColorOpacity = Color(0xff008080).withOpacity(0.8);
  static const kPrimaryColor2 = Color(0xff123318);
  static const kBackgroundColor = Color(0xFFEbf5f0);
  static const kBlueColor = Color(0xFF2C53B1);
  static const kGreyColor = Color(0xFFB4B0B0);
  static const kTitleColor = Color(0xFF23374D);
  static const kSubtitleColor = Color(0xFF8E8E8E);
  static const kBorderColor = Color(0xFFE8E8F3);
  static const kFillColor = Color(0xFFFFFFFF);
  static const kCardTitleColor = Color(0xFF2E4ECF);
  static const kCardSubtitleColor = kTitleColor;
  static const kSecondaryColor = Color.fromARGB(255, 244, 242, 242);

  static Future<bool> saveImageToSharedPref(String value) async {
    sharedPref = await SharedPreferences.getInstance();
    return sharedPref!.setString("key", value);
  }

  static Future<String> getImageFromPref() async {
    sharedPref = await SharedPreferences.getInstance();
    return sharedPref!.getString("key")!;
  }

  static String base64Sring(Uint8List data) {
    return base64Encode(data);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }
}

class XMargin extends StatelessWidget {
  final double x;
  const XMargin(this.x);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class YMargin extends StatelessWidget {
  final double y;
  const YMargin(this.y);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

//SCREEN SIZE
double screenHeight(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.height * percent;

double screenWidth(BuildContext context, {double percent = 1}) =>
    MediaQuery.of(context).size.width * percent;

// Style for title
var mTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: Constants.kTitleColor, fontSize: 13);

// Style for title
var kNoRecordFoundStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: Colors.black54, fontSize: 13);

// Style for title
var kNairaStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: Colors.white60, fontSize: 20);

// Style for title
var mScheduleTimeStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: Constants.kTitleColor, fontSize: 11);

// Style for subTitle
var mSubTitleStyle = GoogleFonts.inter(
    color: Constants.kTitleColor.withOpacity(0.6), fontSize: 12);

// Style for subTitle
var ktransAmountStyle = GoogleFonts.inter(
  color: Constants.kTitleColor.withOpacity(0.6),
  fontSize: 12,
  fontWeight: FontWeight.bold,
);

// Style for Home Section
var kBoldText = GoogleFonts.inter(
    fontSize: 14, fontWeight: FontWeight.w700, color: Constants.kPrimaryColor);

var kWalletText = GoogleFonts.inter(
    fontSize: 18, fontWeight: FontWeight.w700, color: Constants.kPrimaryColor);

var kWalletAmountText = GoogleFonts.inter(
    fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black54);

// Style for About Section
TextStyle homeTextStyle = GoogleFonts.raleway(
    fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black54);

var mServiceSubtitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w400, fontSize: 10, color: Constants.kSubtitleColor);

String? userID;
String? userName;
String? permission;
String? userPhone;
String? userPollingUnit;
String? userModel;
String? pollingUnitList;
String? token;
bool? isLoggedIn = false;

getData() {
  permission = Constants.sharedPref!.getString("permission");
  userPhone = Constants.sharedPref!.getString("phoneNumber");
  userName = Constants.sharedPref!.getString("agentName");
  userPollingUnit = Constants.sharedPref!.getString("pollingUnit");
  userModel = Constants.sharedPref!.getString("userModel");
  pollingUnitList = Constants.sharedPref!.getString("pollingUnitList");
  token = Constants.sharedPref!.getString("authToken");
  isLoggedIn = Constants.sharedPref!.getBool("isLoggedIn");
}

var spinKitRing = const SpinKitDualRing(
  color: Colors.black54,
  size: 15.0, 
);
    final queryParameters = '09163347700';

String status = "Live";
String serverLink = status == "Dev"
    ? "http://localhost:4480"
    : "https://api.pdp.elmon.com.ng/v1";

     final cloudinary = Cloudinary.full(
    apiKey: "578844177269385",
    apiSecret: 'wbqZKiEi-2x1h6lH9dstmvZ80P0',
    cloudName: 'deoud1dmi',
  );

var header = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  // 'Authorization': 'JWT $token',
};

  List incident = [
        {
            "incidence_code": "0",
            "incidence_name": "Ballot Snatching",
            "description": "Ballot snatching by thugs/hoodlums at polling unit."
        },
        {
            "incidence_code": "1",
            "incidence_name": "Over Voting",
            "description": "Voting continues even after accredited voters have been exhausted"
        },
        {
            "incidence_code": "2",
            "incidence_name": "Underage Voting",
            "description": "Voting by underaged electorates in the polling unit."
        },
        {
            "incidence_code": "3",
            "incidence_name": "Vote Buying",
            "description": "Vote being bought by party at the polling unit."
        },
        {
            "incidence_code": "4",
            "incidence_name": "Security Harrassment",
            "description": "Harrassment by security men at the polling unit."
        },
        {
            "incidence_code": "5",
            "incidence_name": "Others",
            "description": "Other incidences not captured here"
        }
    ];


  List result_type_list = [
        {
            "party_id": "APC",
            "party_name": "All Progressives Congress"
        },
        {
            "party_id": "NNPP",
            "party_name": "New Nigeria People's Party"
        },
        {
            "party_id": "PDP",
            "party_name": "People's Democratic Party"
        },
        {
            "party_id": "PRP",
            "party_name": "People's Redemption Party"
        }
    ];

  List<String> type = [
    'Select Media Type',
    'Image',
    'Video',
  ];


DropdownMenuItem<String> buildMenuItem(String item) =>
    DropdownMenuItem(child: Text(item, style: TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis,), value: item);

dateFormater(date, format) {
  final DateTime now = date != null ? DateTime.parse(date) : DateTime.now();
  final DateFormat formatter =
      format != null ? DateFormat(format) : DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  return formatted;

//   ICU Name                   Skeleton
// --------                   --------
// DAY                          d
// ABBR_WEEKDAY                 E
// WEEKDAY                      EEEE
// ABBR_STANDALONE_MONTH        LLL
// STANDALONE_MONTH             LLLL
// NUM_MONTH                    M
// NUM_MONTH_DAY                Md
// NUM_MONTH_WEEKDAY_DAY        MEd
// ABBR_MONTH                   MMM
// ABBR_MONTH_DAY               MMMd
// ABBR_MONTH_WEEKDAY_DAY       MMMEd
// MONTH                        MMMM
// MONTH_DAY                    MMMMd
// MONTH_WEEKDAY_DAY            MMMMEEEEd
// ABBR_QUARTER                 QQQ
// QUARTER                      QQQQ
// YEAR                         y
// YEAR_NUM_MONTH               yM
// YEAR_NUM_MONTH_DAY           yMd
// YEAR_NUM_MONTH_WEEKDAY_DAY   yMEd
// YEAR_ABBR_MONTH              yMMM
// YEAR_ABBR_MONTH_DAY          yMMMd
// YEAR_ABBR_MONTH_WEEKDAY_DAY  yMMMEd
// YEAR_MONTH                   yMMMM
// YEAR_MONTH_DAY               yMMMMd
// YEAR_MONTH_WEEKDAY_DAY       yMMMMEEEEd
// YEAR_ABBR_QUARTER            yQQQ
// YEAR_QUARTER                 yQQQQ
// HOUR24                       H
// HOUR24_MINUTE                Hm
// HOUR24_MINUTE_SECOND         Hms
// HOUR                         j
// HOUR_MINUTE                  jm
// HOUR_MINUTE_SECOND           jms
// HOUR_MINUTE_GENERIC_TZ       jmv
// HOUR_MINUTE_TZ               jmz
// HOUR_GENERIC_TZ              jv
// HOUR_TZ                      jz
// MINUTE                       m
// MINUTE_SECOND                ms
// SECOND                       s
}
