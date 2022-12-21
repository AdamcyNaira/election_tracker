// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:election_tracker/util/constants.dart';

AppBar twoButtonsAppbar({
  context,
  String? title,
  IconData? icon1,
  IconData? icon2,
  Function()? route1,
  Function()? route2,
}) {
  return AppBar(
    leading: IconButton(
      onPressed: route1,
      icon: Icon(
        icon1,
        color: Colors.black54,
      ),
    ),
    title: Text(
      title!,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black54,
      ),
    ),
    centerTitle: true,
    backgroundColor: Constants.kBackgroundColor,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: route2,
          child: Icon(
            icon2,
            color: Constants.kPrimaryColor,
          ),
        ),
      )
    ],
  );
}

AppBar centeredAppbar({
  context,
  String? title,
  IconData? icon1,
  IconData? icon2,
  Function()? route1,
  Function()? route2,
}) {
  return AppBar(
    leading: IconButton(
      onPressed: route1,
      icon: Icon(
        icon1,
        color: Colors.black54,
      ),
    ),
    title: Center(
      child: Text(
        title!,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    ),
    backgroundColor: Constants.kBackgroundColor,
    elevation: 0,
    actions: [
      const XMargin(70),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: route2,
          child: Icon(
            icon2,
            color: Constants.kPrimaryColor,
          ),
        ),
      )
    ],
  );
}

AppBar exAppBar({title, context}) {
  return AppBar(
    backgroundColor: Constants.kPrimaryColor.withOpacity(.03),
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: IconButton(
        icon: const Icon(
          Icons.close,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        color: Constants.kPrimaryColor.withOpacity(0.5),
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
          fontFamily: " ", color: Colors.black54, fontSize: 18.0),
    ),
  );
}

Widget chooseMenu(
    {context,
    String? title,
    String? subtitle,
    String? img,
    Function()? route}) {
  return Column(
    children: [
      Card(
        child: InkWell(
          highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
          onTap: route,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  child: Image.asset(
                    img!,
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Text(
        title!,
        style: mSubTitleStyle,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

myMenu({Function()? route, IconData? icon1, String? title, IconData? icon2}) {
  return Column(
    children: <Widget>[
      Container(
          height: 60.0,
          color: Constants.kBackgroundColor,
          child: InkWell(
              onTap: route,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          icon1,
                          color: Colors.black87,
                          size: 20.0,
                        ),
                        const SizedBox(width: 20.0),
                        Text(
                          title!,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black87,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      icon2,
                      color: Colors.black54,
                      size: 15,
                    ),
                  ],
                ),
              ))),
      const Divider(
        height: 1.0,
      ),
    ],
  );
}

profileCard(
    {Function()? route,
    IconData? icon1,
    String? title,
    String? title2,
    IconData? icon2}) {
  return Column(
    children: <Widget>[
      Container(
          height: 60.0,
          color: Colors.transparent,
          child: InkWell(
              onTap: route,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          icon1,
                          color: Colors.black87,
                          size: 20.0,
                        ),
                        const SizedBox(width: 20.0),
                        Row(
                          children: [
                            Text(
                              title!,
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 14.0,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              title2!,
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 10.0,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      icon2,
                      color: Colors.black54,
                      size: 15,
                    ),
                  ],
                ),
              ))),
      const Divider(
        height: 1.0,
      ),
    ],
  );
}

Drawer dashboardDrawer(context, patient) {
  return Drawer(
    backgroundColor: Constants.kBackgroundColor,
    child: ListView(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://bazeuniversityhospital-server.herokuapp.com/public/uploads/patient_passport/}',
              errorWidget: (context, url, error) => const CircleAvatar(
                radius: 65,
                child: Icon(Ionicons.person_outline),
              ),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 65,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => const CircleAvatar(
                radius: 65,
                child: CircularProgressIndicator(
                  backgroundColor: Constants.kBackgroundColor,
                  strokeWidth: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'patientName',
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Constants.kPrimaryColor),
              textAlign: TextAlign.center,
            ),
            const Divider(),
          ],
        ),
      ),
      myMenu(
          icon1: Ionicons.home_outline,
          title: "Dashboard",
          icon2: Icons.arrow_forward_ios,
          route: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          }),
      myMenu(
          icon1: Ionicons.calendar_outline,
          title: "Appointment",
          icon2: Icons.arrow_forward_ios,
          route: () {
            Navigator.pushNamed(context, '/patient_appointment');
          }),
      myMenu(
          icon1: Ionicons.cash_outline,
          title: "Wallet",
          icon2: Icons.arrow_forward_ios,
          route: () {
            Navigator.pushNamed(context, '/wallet');
          }),
      myMenu(
          icon1: Ionicons.list,
          title: "Report",
          icon2: Icons.arrow_forward_ios,
          route: () {
            Navigator.pushNamed(context, '/consultation_report');
          }),
      myMenu(
          icon1: Ionicons.lock_closed_outline,
          title: " Change Password",
          icon2: Icons.arrow_forward_ios,
          route: () {
            Navigator.pushNamed(context, '/change_password');
          }),
      myMenu(
          icon1: Ionicons.information_circle_outline,
          title: "About",
          icon2: Icons.arrow_forward_ios,
          route: () {
            Navigator.pushNamed(context, '/about');
          }),
      myMenu(
          icon1: Ionicons.log_out_outline,
          title: "Log Out",
          icon2: Icons.arrow_forward_ios,
          route: () {
            Constants.sharedPref!.clear();
            Future.delayed(Duration.zero, () async {
              // await Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => const PatientLogin()),
              //     (Route<dynamic> route) => false);
            });
          }),
    ]),
  );
}

Widget eventCard({
  context,
  String? name,
  String? location,
  String? date,
  String? time,
  Function()? route,
  Color? cardColor,
  bool? selected,
  int? size,
}) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    margin: const EdgeInsets.only(right: 5.0),
    width:
        size! > 1 ? screenWidth(context) * 0.83 : screenWidth(context) * 0.92,
    decoration: BoxDecoration(
      color: selected == true
          ? Constants.kPrimaryColor.withOpacity(0.8)
          : Constants.kSecondaryColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Material(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.transparent,
      child: GestureDetector(
        onTap: route,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const XMargin(5),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name!,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700,
                            color: selected == true
                                ? Constants.kSecondaryColor
                                : Constants.kTitleColor.withOpacity(0.9),
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Divider(
                          height: 15,
                          color: Constants.kPrimaryColor.withOpacity(0.8),
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            Icon(
                              Ionicons.location_outline,
                              size: 15,
                              color: selected == true
                                  ? Constants.kSecondaryColor.withOpacity(0.8)
                                  : Constants.kTitleColor.withOpacity(0.8),
                            ),
                            const XMargin(5),
                            Text(
                              location!,
                              style: GoogleFonts.inter(
                                color: selected == true
                                    ? Constants.kSecondaryColor.withOpacity(0.8)
                                    : Constants.kTitleColor.withOpacity(0.6),
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const YMargin(7),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const Icon(
                              Ionicons.calendar_outline,
                              size: 15,
                            ),
                            const XMargin(5),
                            Text(
                              date!,
                              style: mScheduleTimeStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const XMargin(5),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            const Icon(
                              Ionicons.time,
                              size: 15,
                            ),
                            const XMargin(10),
                            Text(
                              time!,
                              style: mScheduleTimeStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget patientAppointmentCard({
  context,
  String? img,
  String? name,
  String? specialization,
  String? date,
  String? time,
  Function()? deleteRoute,
  Function()? rescheduleRoute,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 8, 15, 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Card(
        elevation: 2,
        child: InkWell(
          highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
          onTap: () {},
          child: SizedBox(
            height: screenHeight(context) * 0.23,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          img!,
                        ),
                        radius: 30,
                      ),
                    ),
                    const XMargin(5),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dr. " + name!,
                            style: mTitleStyle,
                          ),
                          const YMargin(5),
                          Text(
                            specialization!,
                            style: mSubTitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const YMargin(7),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Ionicons.calendar_outline,
                                    size: 15,
                                  ),
                                  const XMargin(10),
                                  Text(
                                    date!,
                                    style: mScheduleTimeStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const XMargin(5),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Ionicons.time,
                                    size: 15,
                                  ),
                                  const XMargin(10),
                                  Text(
                                    time!,
                                    style: mScheduleTimeStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: deleteRoute,
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const XMargin(5),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: rescheduleRoute,
                          child: const Text('Reschedule'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.deepOrange),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side:
                                    const BorderSide(color: Colors.deepOrange),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget patientCompletedAppointmentCard({
  context,
  String? img,
  String? name,
  String? specialization,
  String? date,
  String? time,
  Function()? route,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15, 8, 15, 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Card(
        elevation: 2,
        child: InkWell(
          highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
          onTap: route!,
          child: SizedBox(
            height: screenHeight(context) * 0.20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          img!,
                        ),
                        radius: 30,
                      ),
                    ),
                    const XMargin(5),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name!,
                            style: mTitleStyle,
                          ),
                          const YMargin(5),
                          Text(
                            specialization!,
                            style: mSubTitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const YMargin(7),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Ionicons.calendar_outline,
                                    size: 15,
                                  ),
                                  const XMargin(10),
                                  Text(
                                    date!,
                                    style: mScheduleTimeStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const XMargin(5),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Ionicons.time,
                                    size: 15,
                                  ),
                                  const XMargin(10),
                                  Text(
                                    time!,
                                    style: mScheduleTimeStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget searchInput({
  TextEditingController? controller,
  FormFieldSetter? onSave,
  FormFieldSetter? onChange,
  FormFieldValidator<String>? validator,
  TextInputType? keyboardType,
  TextStyle? style,
  IconData? prefixIcon,
  Color? iconColor,
  String? hintText,
}) {
  return TextFormField(
    controller: controller,
    onSaved: onSave,
    onChanged: onChange,
    validator: validator,
    keyboardType: keyboardType,
    style: style,
    decoration: InputDecoration(
      prefixIcon: Icon(
        prefixIcon,
        size: 20.0,
        color: iconColor,
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w500, color: Colors.white54),
      contentPadding: const EdgeInsets.all(15.0),
      filled: true,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    ),
  );
}

Widget chooseDoctorCard({
  context,
  String? title,
  String? name,
  String? specialization,
  String? img,
  Function()? route,
}) {
  return Card(
    child: InkWell(
      highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
      onTap: route,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(img!),
              )),
          Text(
            name!,
            style: mTitleStyle,
            textAlign: TextAlign.center,
          ),
          const YMargin(5),
          Text(
            specialization!,
            style: mSubTitleStyle,
          ),
        ],
      ),
    ),
  );
}

Widget appointmentRecordCard({
  context,
  String? name,
  String? subTitle,
  String? img,
  Function()? route,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20.0),
    child: Card(
      child: InkWell(
        highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
        onTap: route,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                img!,
                height: 140,
                width: 120,
              ),
            ),
            Text(
              name!,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w800,
                  color: Constants.kTitleColor,
                  fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const YMargin(5),
            Text(
              subTitle!,
              style: mSubTitleStyle,
            ),
            const YMargin(10),
          ],
        ),
      ),
    ),
  );
}

Widget doctorBioCard({
  context,
  String? img,
  String? name,
  String? specialization,
  String? date,
  String? time,
  List<String>? specializationList,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15.0),
    child: Card(
      color: Constants.kBackgroundColor.withOpacity(0.1),
      elevation: 0,
      child: InkWell(
        highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
        onTap: () {},
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 5),
                    child: Container(
                      height: screenHeight(context) * 0.12,
                      width: screenWidth(context) * 0.23,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Constants.kPrimaryColor),
                          image: DecorationImage(
                            image: AssetImage(img!),
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  const XMargin(5),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          name!,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: Constants.kPrimaryColor,
                              fontSize: 16),
                        ),
                        const YMargin(5),
                        Text(
                          specialization!,
                          style: mSubTitleStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const YMargin(7),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                    padding: const EdgeInsets.all(0),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "BIOGRAPHY",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black45),
                        ),
                        const YMargin(8),
                        Text(
                          '$name  is a board certified doctor who specialized on $specialization, practicing in Abuja and Nigeria at large.',
                          style: GoogleFonts.sourceSansPro(
                            fontWeight: FontWeight.w600,
                            color: Constants.kPrimaryColor,
                            height: 1.7,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                          // textDirection: TextDirection.ltr,
                        ),
                        const YMargin(15),
                        Text(
                          "SPECIALITIES",
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black45),
                        ),
                        const YMargin(8),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: ListView.builder(
                            primary: false,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: specializationList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 0, 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: InkWell(
                                    highlightColor: Constants.kPrimaryColor
                                        .withOpacity(0.2),
                                    onTap: () {},
                                    child: Container(
                                      // width: screenWidth(context) * 0.0,
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                        child: Text(
                                          specializationList[index],
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54,
                                              fontSize: 11),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget patientscheduleCard({
  context,
  String? img,
  String? name,
  String? specialization,
  String? date,
  String? time,
  Function()? route,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 8, 5, 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Card(
        elevation: 2,
        child: InkWell(
          highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
          onTap: route,
          child: SizedBox(
            height: screenHeight(context) * 0.20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          img!,
                        ),
                        radius: 30,
                      ),
                    ),
                    const XMargin(5),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name!,
                            style: mTitleStyle,
                          ),
                          const YMargin(5),
                          Text(
                            specialization!,
                            style: mSubTitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const YMargin(7),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Ionicons.calendar_outline,
                                    size: 15,
                                  ),
                                  const XMargin(10),
                                  Text(
                                    date!,
                                    style: mScheduleTimeStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const XMargin(5),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                children: [
                                  const Icon(
                                    Ionicons.time,
                                    size: 15,
                                  ),
                                  const XMargin(10),
                                  Text(
                                    time!,
                                    style: mScheduleTimeStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget doctorInfoCard({
  context,
  String? title,
  String? name,
  String? specialization,
  String? img,
  Function()? route,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Card(
        color: const Color(0xffFAFAFA),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(img!),
                  )),
              Text(
                name!,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: Constants.kPrimaryColor,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const YMargin(5),
              Text(
                specialization!,
                style: mSubTitleStyle,
              ),
              const YMargin(15),
              // ignore: deprecated_member_use
              MaterialButton(
                minWidth: screenWidth(context) * 0.80,
                color: Colors.white,
                child: const Text(
                  'Start Conversation',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Constants.kPrimaryColor.withOpacity(0.5),
                      width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(12),
                textColor: Constants.kPrimaryColor,
                onPressed: () {
                  Navigator.of(context).pushNamed("/consultation", arguments: {
                    'doctor_name': 'Dr. Ahmad Muhammad',
                    'img': "assets/images/user-icon.jpg",
                    'specialization': "Dermathologist",
                  });
                },
              ),
              const YMargin(5),
              // ignore: deprecated_member_use
              MaterialButton(
                minWidth: screenWidth(context) * 0.80,
                color: Constants.kPrimaryColor.withOpacity(0.8),
                child: const Text(
                  'Cancel Schedule',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Constants.kPrimaryColor.withOpacity(0.5),
                      width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(12),
                textColor: Colors.white,
                onPressed: () {},
              ),
              const YMargin(10),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget upComingScheduleCard({
  context,
  String? title,
  String? specialization,
  String? date,
  String? time,
  Function()? route,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Card(
        color: const Color(0xffFAFAFA),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Text(
                  'Upcoming Schedule',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: Constants.kPrimaryColor,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, top: 5),
                      child: Container(
                        height: screenHeight(context) * 0.12,
                        width: screenWidth(context) * 0.23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.deepOrange),
                          color: Colors.deepOrange[700],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '12',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                            const YMargin(5),
                            Text(
                              'DEC',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const XMargin(5),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            specialization!,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 14),
                          ),
                          const YMargin(5),
                          Text(
                            '10:30 AM',
                            style: mSubTitleStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget appointmentDetailsCard({
  context,
  String? title,
  String? name,
  String? specialization,
  String? img,
  Function()? route,
  Map? doctorDetails,
  String? selectedDate,
  String? selectedTime,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Card(
        color: const Color(0xffFAFAFA),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: NetworkImage(img!),
                  )),
              Text(
                title! + " " + name!,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    color: Constants.kPrimaryColor,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const YMargin(5),
              Text(
                specialization!,
                style: mSubTitleStyle,
              ),
              const YMargin(15),
              // ignore: deprecated_member_use
              Container(
                  margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Appointment Date',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          Text(
                            selectedDate!,
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const YMargin(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Appointment Time',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          Text(
                            selectedTime!,
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const YMargin(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Amount Payable',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          Text(
                            selectedTime,
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  )),
              const YMargin(5),
              // ignore: deprecated_member_use
              MaterialButton(
                minWidth: screenWidth(context) * 0.80,
                color: Constants.kPrimaryColor.withOpacity(0.8),
                child: const Text(
                  'Make Payment',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Constants.kPrimaryColor.withOpacity(0.5),
                      width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(12),
                textColor: Colors.white,
                onPressed: () {},
              ),
              const YMargin(10),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget medicalReportCard({
  context,
  String? title,
  String? date,
  String? img,
  Function()? route,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: InkWell(
      highlightColor: Constants.kPrimaryColor,
      onTap: route,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        color: Colors.blueGrey[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                height: 50,
                width: 50,
                color: Colors.grey[50],
                child: Image.asset(
                  img!,
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
              height: 50,
              width: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title!,
                    style: mTitleStyle,
                  ),
                  const YMargin(3),
                  Text(
                    date!,
                    style: mSubTitleStyle,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget transactionHistoryCard({
  context,
  String? title,
  String? type,
  String? date,
  String? amount,
  String? format,
  String? formatCurrency,
  Function()? route,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: InkWell(
        highlightColor: Constants.kPrimaryColor,
        onTap: route,
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  height: 30,
                  width: 30,
                  color: Colors.teal[300],
                  child: Center(
                    child: Text(
                      format!,
                      style: kNairaStyle,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                height: 70,
                width: 270,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: mTitleStyle,
                    ),
                    const YMargin(3),
                    Text(
                      date!,
                      style: mSubTitleStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          type!,
                          style: GoogleFonts.inter(
                            color: type == 'Credit'
                                ? Colors.greenAccent
                                : Colors.redAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(format),
                            Text(
                              formatCurrency.toString(),
                              style: ktransAmountStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget userInfoCard({
  context,
  String? title,
  String? name,
  String? specialization,
  String? email,
  String? img,
  bool? isPersonalInfo,
  Function()? route,
  Function()? route2,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Card(
        color: const Color(0xffFAFAFA),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  imageUrl: img!,
                  errorWidget: (context, url, error) => const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/images/user-icon.jpg'),
                  ),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 75,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) => const CircleAvatar(
                    radius: 75,
                    child: CircularProgressIndicator(
                      backgroundColor: Constants.kBackgroundColor,
                      strokeWidth: 1,
                    ),
                  ),
                ),

                // CircleAvatar(
                //   radius: 75,
                //   backgroundImage: NetworkImage(img!),
                // )),
              ),
              Text(
                name!,
                style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w600,
                    color: Constants.kPrimaryColor,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const YMargin(5),
              Text(
                email!,
                style: mSubTitleStyle,
              ),
              const YMargin(5),
              Text(
                specialization!,
                style: mSubTitleStyle,
              ),
              const YMargin(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ignore:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 5.0),
                    child: MaterialButton(
                      minWidth: screenWidth(context) * 0.41,
                      color: isPersonalInfo!
                          ? Constants.kPrimaryColor.withOpacity(0.7)
                          : Colors.white,
                      child: Text(
                        'Personal Info',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isPersonalInfo
                              ? Colors.white
                              : Constants.kPrimaryColor.withOpacity(0.7),
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Constants.kPrimaryColor.withOpacity(0.5),
                            width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(12),
                      textColor: Constants.kPrimaryColor,
                      onPressed: route!,
                    ),
                  ),
                  // ignore:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 5.0),
                    child: MaterialButton(
                      minWidth: screenWidth(context) * 0.41,
                      color: isPersonalInfo
                          ? Colors.white
                          : Constants.kPrimaryColor.withOpacity(0.7),
                      child: Text(
                        'Membership Benefits',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isPersonalInfo
                              ? Constants.kPrimaryColor.withOpacity(0.7)
                              : Colors.white,
                        ),
                      ),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Constants.kPrimaryColor.withOpacity(0.5),
                            width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(12),
                      textColor: Constants.kPrimaryColor,
                      onPressed: route2!,
                    ),
                  ),
                ],
              ),
              const YMargin(5),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget presenterInfoCard({
  context,
  String? title,
  String? name,
  String? specialization,
  String? email,
  String? img,
  bool? isPersonalInfo,
  Function()? route,
  Function()? route2,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Card(
        color: const Color(0xffFAFAFA),
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CachedNetworkImage(
                  imageUrl: img!,
                  errorWidget: (context, url, error) => const CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/images/user-icon.jpg'),
                    backgroundColor: Color.fromARGB(255, 189, 213, 201),
                  ),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 75,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) => const CircleAvatar(
                    radius: 75,
                    child: CircularProgressIndicator(
                      backgroundColor: Constants.kBackgroundColor,
                      strokeWidth: 1,
                    ),
                  ),
                ),

                // CircleAvatar(
                //   radius: 75,
                //   backgroundImage: NetworkImage(img!),
                // )),
              ),
              Text(
                name!,
                style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w600,
                    color: Constants.kPrimaryColor,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const YMargin(5),
              Text(
                email!,
                style: mSubTitleStyle,
              ),
              const YMargin(5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Ionicons.logo_linkedin,
                    color: Colors.blue,
                    size: 20,
                  ),
                  XMargin(5),
                  Text(
                    specialization!,
                    style: mSubTitleStyle,
                  ),
                ],
              ),
              const YMargin(15),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
                child: MaterialButton(
                  minWidth: screenWidth(context) * 0.80,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Download Paper',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold),
                      ),
                      XMargin(10),
                      Icon(Ionicons.download_outline),
                    ],
                  ),
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Constants.kPrimaryColor.withOpacity(0.5),
                        width: 1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(12),
                  textColor: Constants.kPrimaryColor,
                  onPressed: route!,
                ),
              ),
              const YMargin(5),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget textCard({
  context,
  String? value,
  String? key,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 8, top: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          key!,
          style: GoogleFonts.sourceSansPro(
            color: Constants.kTitleColor.withOpacity(0.6),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const YMargin(5),
        Text(
          value!,
          style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 94, 92, 92),
              fontSize: 14),
          textAlign: TextAlign.justify,
        ),
        const YMargin(8),
      ],
    ),
  );
}

Widget medicationCard({
  context,
  String? name,
  String? dosage,
  String? frequency,
  String? prescription,
  String? img,
  Function()? route,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        highlightColor: Constants.kPrimaryColor,
        onTap: route,
        child: Container(
          width: screenWidth(context),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                  height: screenHeight(context) * 0.15,
                  width: screenWidth(context) * 0.15,
                  color: Colors.teal,
                  child: Image.asset(
                    img!,
                    width: 20,
                    height: 30,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 5.0, 0.0),
                  height: screenHeight(context) * 0.15,
                  width: screenWidth(context) * 0.78,
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    children: [
                      const YMargin(8),
                      Row(
                        children: [
                          Text(
                            "Drug: ",
                            style: GoogleFonts.inter(
                              color: const Color.fromARGB(255, 82, 85, 88),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              name!,
                              style: mSubTitleStyle,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dosage: ",
                            style: GoogleFonts.inter(
                              color: const Color.fromARGB(255, 82, 85, 88),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              dosage!,
                              style: mSubTitleStyle,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Frequency: ",
                            style: GoogleFonts.inter(
                              color: const Color.fromARGB(255, 82, 85, 88),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              frequency!,
                              style: mSubTitleStyle,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Prescription: ",
                            style: GoogleFonts.inter(
                              color: const Color.fromARGB(255, 82, 85, 88),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              prescription!,
                              style: mSubTitleStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

AppBar backgroundAppbar({
  context,
  String? title,
  IconData? icon1,
  IconData? icon2,
  Function()? route1,
  Function()? route2,
}) {
  return AppBar(
    leading: IconButton(
      onPressed: route1,
      icon: Icon(
        icon1,
        color: Colors.white,
      ),
    ),
    title: Text(
      title!,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    backgroundColor: const Color.fromARGB(255, 97, 168, 168),
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: GestureDetector(
          onTap: route2,
          child: Icon(
            icon2,
            color: Constants.kPrimaryColor,
          ),
        ),
      )
    ],
  );
}

Widget aboutListTile({
  context,
  IconData? icon,
  String? title,
  String? content,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: screenHeight(context) * 0.09,
        width: screenWidth(context) * 0.2,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Icon(
          icon!,
          size: 50,
          color: Colors.black54,
        ),
      ),
      Flexible(
        child: Container(
          // height: screenHeight(context) * 0.09,
          // width: screenWidth(context) * 0.2,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Constants.kPrimaryColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const YMargin(3),
              Text(
                content!,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                width: screenWidth(context) * 0.2,
                child: const Divider(
                  height: 10,
                  thickness: 2,
                  color: Constants.kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget dashboardMenu({
  context,
  String? title,
  String? subtitle,
  IconData? icon,
  Function()? route,
}) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    // margin: const EdgeInsets.only(right: 5.0),
    // width: screenWidth(context) * 0.83,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 244, 242, 242),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Material(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        onTap: route,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                height: 40,
                width: 40,
                color: Color.fromARGB(255, 232, 243, 232),
                child: Icon(icon),
              ),
            ),
            const YMargin(10),
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title!,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: Constants.kTitleColor,
                            fontSize: 12),
                      ),
                      const YMargin(5),
                      Text(
                        subtitle!,
                        style: GoogleFonts.inter(
                            color: Constants.kTitleColor.withOpacity(0.6),
                            fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget agendaCard({
  context,
  String? title,
  String? subtitle,
  String? start,
  String? end,
  bool? presenter,
  int? active,
  IconData? icon,
  Function()? route,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15.0),
    child: Row(
      children: [
        Container(
          child: Column(
            children: [
              Icon(Ionicons.checkmark_outline),
              const YMargin(5),
              Container(
                height: 75,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Constants.kPrimaryColor, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          margin: const EdgeInsets.only(left: 10.0),
          width: screenWidth(context) * 0.90,
          decoration: BoxDecoration(
            color: active == 1
                ? Color(0xFF454547)
                : Color.fromARGB(255, 230, 231, 234),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Material(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        height: 40,
                        width: 40,
                        color: Colors.white,
                        child: Icon(icon),
                      ),
                    ),
                    XMargin(10),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w700,
                              color: active == 0
                                  ? Color(0xFF272727)
                                  : Color(0xFFF0F2F5),
                              fontSize: 14.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          YMargin(5),
                          Text(
                            subtitle!,
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w500,
                              color: active == 0
                                  ? Color(0xFF272727)
                                  : Color(0xFFF0F2F5),
                              fontSize: 12.0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      'Start:',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          color: active == 0
                                              ? Color(0xFF272727)
                                              : Color(0xFFF0F2F5),
                                          fontSize: 10),
                                    ),
                                    XMargin(5),
                                    Text(
                                      start!,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          color: active == 0
                                              ? Color(0xFF272727)
                                              : Color(0xFFF0F2F5),
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Row(
                                  children: [
                                    Text(
                                      'End:',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          color: active == 0
                                              ? Color(0xFF272727)
                                              : Color(0xFFF0F2F5),
                                          fontSize: 10),
                                    ),
                                    XMargin(5),
                                    Text(
                                      end!,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          color: active == 0
                                              ? Color(0xFF272727)
                                              : Color(0xFFF0F2F5),
                                          fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              presenter!
                                  ? Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0.0, 0.0, 0.0, 0.0),
                                      child: MaterialButton(
                                        color: Colors.white,
                                        child: Text(
                                          'Presenter',
                                          style: GoogleFonts.sourceSansPro(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Constants.kPrimaryColor
                                                .withOpacity(0.7),
                                          ),
                                        ),
                                        shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Constants.kPrimaryColor
                                                  .withOpacity(0.5),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        padding: const EdgeInsets.all(12),
                                        textColor: Constants.kPrimaryColor,
                                        onPressed: route,
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget resourceCard({
  context,
  String? title,
  String? subtitle,
  int? active,
  String? picture,
  Function()? route,
}) {
  return GestureDetector(
    onTap: route,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              width: screenWidth(context) * 0.18,
              height: screenHeight(context) * 0.085,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 242, 242),
                image: picture!.isEmpty
                    ? DecorationImage(
                        image: AssetImage(
                          'assets/images/placeholder.png',
                        ),
                        fit: BoxFit.fill,
                      )
                    : DecorationImage(
                        image: NetworkImage(
                          picture,
                        ),
                        fit: BoxFit.fill,
                      ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            margin: const EdgeInsets.only(left: 10.0),
            width: screenWidth(context) * 0.74,
            decoration: BoxDecoration(
              color: active == 1 ? Color(0xFF454547) : Color(0xFFF0F2F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      XMargin(10),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title!,
                              style: GoogleFonts.sourceSansPro(
                                fontWeight: FontWeight.w700,
                                color: active == 0
                                    ? Color(0xFF272727)
                                    : Color(0xFFF0F2F5),
                                fontSize: 14.0,
                              ),
                            ),
                            YMargin(10),
                            Text(
                              subtitle!,
                              style: GoogleFonts.sourceSansPro(
                                fontWeight: FontWeight.w500,
                                color: active == 0
                                    ? Color(0xFF272727)
                                    : Color(0xFFF0F2F5),
                                fontSize: 12.0,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Divider(
                              color: Colors.grey,
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget boardMembers({
  context,
  String? title,
  String? designation,
  String? picture,
  Function()? route,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10.0),
    child: Container(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
      color: Colors.grey[300],
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: InstaImageViewer(
              child: Container(
                height: screenHeight(context) * 0.19,
                decoration: BoxDecoration(
                  image: picture != null
                      ? DecorationImage(
                          image: NetworkImage(picture),
                          fit: BoxFit.fitWidth,
                        )
                      : DecorationImage(
                          image: AssetImage('assets/images/placeholder.png'),
                          fit: BoxFit.fitWidth,
                        ),
                ),
              ),
            ),
          ),
          YMargin(5),
          Text(
            title ?? "N/A",
            style: TextStyle(
              color: Color.fromRGBO(97, 90, 90, 30),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          YMargin(5),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              designation ?? "N/A",
              style: TextStyle(
                color: Color.fromRGBO(97, 90, 90, 30),
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget dealsCard({
  context,
  String? title,
  String? subtitle,
  String? discount,
  int? active,
  String? picture,
  Function()? route,
}) {
  return GestureDetector(
    onTap: route,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          ClipRRect(
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: Colors.black12),
                image: picture != null
                    ? DecorationImage(
                        image: NetworkImage(
                          picture,
                        ),
                        fit: BoxFit.fill,
                      )
                    : DecorationImage(
                        image: AssetImage(
                          'assets/images/hotel.jpeg',
                        ),
                        fit: BoxFit.fill,
                      ),
              ),
              width: screenWidth(context) * 0.20,
              height: screenHeight(context) * 0.08,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
            margin: const EdgeInsets.only(left: 10.0),
            width: screenWidth(context) * 0.72,
            decoration: BoxDecoration(
              color: active == 1 ? Color(0xFF454547) : Color(0xFFF0F2F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      XMargin(10),
                      Flexible(
                        child: Container(
                          width: screenWidth(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title ?? "",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  color: active == 0
                                      ? Color(0xFF272727)
                                      : Color(0xFFF0F2F5),
                                  fontSize: 14.0,
                                ),
                              ),
                              YMargin(10),
                              Text(
                                subtitle ?? "0",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w500,
                                  color: active == 0
                                      ? Color(0xFF272727)
                                      : Color(0xFFF0F2F5),
                                  fontSize: 12.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Container(
                          height: 25,
                          width: 30,
                          color: Colors.red[600],
                          child: Center(
                              child: Text(
                            discount ?? "0%",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget listCard({
  context,
  String? title,
  String? subtitle,
  String? date,
  int? active,
  String? picture,
  Function()? route,
}) {
  return GestureDetector(
    onTap: route,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
      
          Container(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
            margin: const EdgeInsets.only(left: 0.0),
            width: screenWidth(context) * 0.92,
            decoration: BoxDecoration(
              color: active == 1 ? Color(0xFF454547) : Color(0xFFF0F2F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      XMargin(10),
                      Flexible(
                        child: Container(
                          width: screenWidth(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title ?? "",
                                style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w700,
                                  color: active == 0
                                      ? Color(0xFF272727)
                                      : Color(0xFFF0F2F5),
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Divider(color: Colors.grey,),
                              YMargin(5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    subtitle ?? "",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w500,
                                      color: active == 0
                                          ? Color(0xFF272727)
                                          : Color(0xFFF0F2F5),
                                      fontSize: 12.0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    date ?? "",
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w500,
                                      color: active == 0
                                          ? Color(0xFF272727)
                                          : Color(0xFFF0F2F5),
                                      fontSize: 12.0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



Widget showImage(imageFile, photoName) {
  if (imageFile != null) {
    return CircleAvatar(
      backgroundImage: FileImage(imageFile!),
      radius: 50,
    );
  } else if (photoName != null) {
    return CircleAvatar(
      backgroundImage: MemoryImage(base64Decode(photoName!)),
      radius: 50,
    );
  } else {
    return const CircleAvatar(
      backgroundColor: Colors.black12,
      child: Icon(
        Ionicons.person_outline,
        size: 50,
        color: Constants.kPrimaryColor,
      ),
      radius: 50,
    );
  }
}

Widget showBiodataImage(imageFile, photoName, imageData) {
  if (imageFile != null) {
    return CircleAvatar(
      backgroundImage: FileImage(imageFile!),
      radius: 50,
    );
  } else if (imageData != null) {
    return CachedNetworkImage(
      imageUrl: 'http://3.83.39.250:3000/farmer/uploads/passport/${imageData}',
      errorWidget: (context, url, error) => CircleAvatar(
        radius: 50,
        child: Icon(Icons.person),
      ),
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 50,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => CircleAvatar(
        radius: 50,
        child: CircularProgressIndicator(
          backgroundColor: Constants.kBackgroundColor,
          strokeWidth: 1,
        ),
      ),
    );
  } else {
    return const CircleAvatar(
      backgroundColor: Colors.black12,
      child: Icon(
        Ionicons.person_outline,
        size: 50,
        color: Constants.kPrimaryColor,
      ),
      radius: 50,
    );
  }
}

Widget showIDCardImage(imageFile, photoName, imageData) {
  if (imageFile != null) {
    return CircleAvatar(
      backgroundImage: FileImage(imageFile!),
      radius: 50,
    );
  } else if (imageData != null) {
    return CachedNetworkImage(
      imageUrl:
          'http://3.83.39.250:3000/farmer/uploads/identity_card/${imageData}',
      errorWidget: (context, url, error) => CircleAvatar(
        radius: 50,
        child: Icon(Icons.person),
      ),
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: 50,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => CircleAvatar(
        radius: 50,
        child: CircularProgressIndicator(
          backgroundColor: Constants.kBackgroundColor,
          strokeWidth: 1,
        ),
      ),
    );
  } else {
    return const CircleAvatar(
      backgroundColor: Colors.black12,
      child: Icon(
        Ionicons.person_outline,
        size: 50,
        color: Constants.kPrimaryColor,
      ),
      radius: 50,
    );
  }
}