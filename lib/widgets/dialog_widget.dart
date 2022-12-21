// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:election_tracker/util/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import 'dashboard_widget.dart';

var spinkit = SpinKitThreeBounce(
  color: Constants.kPrimaryColor.withOpacity(0.8),
  size: 15.0,
);

var dashboardSpinkit = const SpinKitThreeBounce(
  color: Colors.white,
  size: 15.0,
);

// void showLoadingDialog(context) {
//   // flutter defined function
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext context) {
//       // return object of type Dialog
//       return AlertDialog(
//         content: Row(
//           children: const <Widget>[
//             CircularProgressIndicator(),
//             XMargin(25),
//             Text("Please wait..."),
//           ],
//         ),
//       );
//     },
//   );
// }

showIncorrectSnackBar({context, String? msg}) {
  final snackbar = SnackBar(
    content: Text(
      msg!,
      style: const TextStyle(fontSize: 16.0, color: Colors.redAccent),
    ),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.black87,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

showSuccessSnackBar({context, String? msg, Function()? route}) {
  final snackbar = SnackBar(
    content: Text(msg!,
        style: const TextStyle(fontSize: 16.0, color: Colors.greenAccent)),
    onVisible: () {
      Timer(const Duration(seconds: 3), () {
        Future.delayed(Duration.zero, () {
          route!;
        });
      });
    },
    backgroundColor: Colors.black87,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}

Widget pageLoader() {
  return Container(
    color: Constants.kBackgroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: spinkit,
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'Loading...',
          ),
        ),
      ],
    ),
  );
}

Widget loadingPage() {
  return Container(
    color: Color.fromARGB(255, 251, 254, 253),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: spinkit,
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'Please wait...',
          ),
        ),
      ],
    ),
  );
}

Widget networkErrorPage(action) {
  return Container(
    color: Color.fromARGB(255, 251, 254, 253),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        YMargin(150),
        Icon(
          Ionicons.wifi_outline,
          size: 200,
          color: Colors.grey[400],
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'An internet error occurred, please try again',
          ),
        ),
        YMargin(15),
        InkWell(
          onTap: () {
            action;
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Ionicons.reload,
              ),
              XMargin(10),
              Text(
                "Retry",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget noRecordPage() {
  return Container(
    color: Color.fromARGB(255, 251, 254, 253),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Ionicons.search_outline,
          size: 80,
          color: Colors.grey[400],
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'Sorry, No Record Found',
          ),
        ),
        YMargin(15),
      ],
    ),
  );
}

Widget doctorPageLoader(context) {
  return Container(
    height: screenHeight(context) * 0.50,
    color: Constants.kBackgroundColor,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: spinkit,
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Loading...',
            style: mSubTitleStyle,
          ),
        ),
      ],
    ),
  );
}

showDialogue({
  context,
  String? title,
  String? content,
  String? img,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    child: contentBox(context, title, content, img),
  );
}

contentBox(context, title, content, img) {
  return Stack(
    children: <Widget>[
      Container(
        padding: const EdgeInsets.only(
            left: 20, top: 45 + 20, right: 20, bottom: 20),
        margin: const EdgeInsets.only(top: 45),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            content == null
                ? Container(
                    height: screenHeight(context) * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No Task!",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : Text(
                    content,
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
            const SizedBox(
              height: 22,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: MaterialButton(
                  color: Constants.kBackgroundColor,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(fontSize: 18),
                  )),
            ),
          ],
        ),
      ),
      Positioned(
        left: 20,
        right: 20,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 45,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(45)),
              child: Image.asset("assets/images/$img")),
        ),
      ),
    ],
  );
}

showConfirmSubmission({context, title, Function()? route, Function()? route2}) {
  CoolAlert.show(
    barrierDismissible: false,
    context: context,
    type: CoolAlertType.confirm,
    title: title,
    backgroundColor: Constants.kPrimaryColor,
    confirmBtnText: 'Yes',
    cancelBtnText: 'No',
    onConfirmBtnTap: route,
    onCancelBtnTap: route2,
  );
}

willScopeErrorDialog({
  context,
  msg,
  title,
}) {
  CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    title: title,
    text: msg,
    loopAnimation: false,
    barrierDismissible: false,
    confirmBtnColor: Constants.kPrimaryColor,
    backgroundColor: Constants.kPrimaryColor,
  );
}
