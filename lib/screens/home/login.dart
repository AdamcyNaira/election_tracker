import 'dart:async';
import 'dart:convert';

import 'package:election_tracker/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity/connectivity.dart';

import '../../models/user.dart';
import '../../providers/provider_services.dart';
import '../../services/api_services.dart';
import '../../widgets/form_widget.dart';
import '../../widgets/general_widget.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController emaill = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool isLoading = false;
  bool? isLoggedIn = false;
  String password = '';
  String username = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  userLogin() async {
    if (formKey.currentState!.validate()) {
      var result = await Connectivity().checkConnectivity();

      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        formKey.currentState!.save();
        setState(() {
          isLoading = true;
        });
        isLoading
            ? showLoadingDialog(context)
            : Navigator.of(context, rootNavigator: true).pop('dialog');
        Timer(const Duration(seconds: 3), () {});

        final loginResponse = await Services.userLogin(username, password);

        if (loginResponse["user"] !=null) {
          //SAVE USER DETAILS IN LOCAL STORAGE
          setState(() {
            Constants.sharedPref!.setString(
                "agentName", loginResponse["user"]["agentName"].toString());
            Constants.sharedPref!.setString(
                "permission", loginResponse["user"]["permission"].toString());
            Constants.sharedPref!
                .setString("pollingUnit", loginResponse["user"]["pollingUnit"].toString());
            Constants.sharedPref!.setString(
                "phoneNumber", loginResponse["user"]["phoneNumber"].toString());
            Constants.sharedPref!
                .setString("authToken", loginResponse["authToken"].toString());
            Constants.sharedPref!
                .setString("userModel", jsonEncode(loginResponse));
            Constants.sharedPref!.setBool("isLoggedIn", true);
            isLoading = false;
          });

          Users _user = Users.fromJson(loginResponse);
          ref.read(appStateProvider).setUser(_user);
          getData();
          isLoading
              ? showLoadingDialog(context)
              : Navigator.of(context, rootNavigator: true).pop('dialog');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text('Login Successful'),
            onVisible: () {
              Timer(const Duration(seconds: 2), () {
                Future.delayed(Duration.zero, () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/dashboard', (route) => false);
                });
              });
            },
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.black87,
          ));
        } else if (loginResponse["code"] != null) {
          setState(() {
            isLoading = false;
          });
          isLoading
              ? showLoadingDialog(context)
              : Navigator.of(context, rootNavigator: true).pop('dialog');
          showErrorDialog(
              context: context,
              msg: "Invalid Login Credential!",
              title: "Oops!");
        } else {
          setState(() {
            isLoading = false;
          });
          isLoading
              ? showLoadingDialog(context)
              : Navigator.of(context, rootNavigator: true).pop('dialog');
           showErrorDialog(
              context: context,
              msg: "Invalid Login Credential!",
              title: "Oops!");
        }
      } else {
        showInternetError();
      }
    }
  }

  checkLoginState() {
    if (isLoggedIn == true) {
      Future.delayed(Duration.zero, () {
        Users data = Users.fromJson(jsonDecode(userModel ?? ""));
        ref.read(appStateProvider).setUser(data);
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (route) => false);
      });
    }
  }

  getData() {
    setState(() {
      permission = Constants.sharedPref!.getString("permission");
      userPhone = Constants.sharedPref!.getString("phoneNumber");
      userName = Constants.sharedPref!.getString("agentName");
      userPollingUnit = Constants.sharedPref!.getString("pollingUnit");
      userModel = Constants.sharedPref!.getString("userModel");
      pollingUnitList = Constants.sharedPref!.getString("pollingUnitList");
      token = Constants.sharedPref!.getString("authToken");
      isLoggedIn = Constants.sharedPref!.getBool("isLoggedIn");
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    checkLoginState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          height: screenHeight(context),
          width: screenWidth(context),
          child: SingleChildScrollView(
            primary: false,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello Again!",
                            style: GoogleFonts.poppins(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Constants.kTextColor),
                            textAlign: TextAlign.center,
                          ),
                          YMargin(10),
                          Text(
                            "Welcome back you've \n been missed!",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          YMargin(30),
                        ]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      usernameInput(
                        controller: emaill,
                        onSave: (val) {
                          setState(() {
                            username = val!;
                          });
                        },
                        validator: (val) =>
                            val!.isEmpty ? 'Please enter your username' : null,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black54),
                        prefixIcon: Icons.person,
                        iconColor: Constants.kPrimaryColor.withOpacity(0.6),
                        hintText: 'Enter username',
                      ),
                      const YMargin(30),
                      PasswordInpute(
                        controller: pass,
                        onSave: (val) {
                          setState(() {
                            password = val!;
                          });
                        },
                        validator: (val) =>
                            val!.isEmpty ? 'Please enter your password' : null,
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black54),
                        prefixIcon: Icons.lock,
                        iconColor: Constants.kPrimaryColor.withOpacity(0.6),
                        hintText: 'Password',
                        suffixIconVisibility: Icons.visibility,
                        suffixIconVisibilityOff: Icons.visibility_off,
                        suffixIconColor:
                            Constants.kPrimaryColor.withOpacity(0.6),
                      ),
                      const YMargin(30),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 15.0),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     children: [
                      //       InkWell(
                      //         onTap: () async {},
                      //         child: Text(
                      //           ' Password Recovery',
                      //           style: TextStyle(
                      //             fontFamily: 'Roboto',
                      //             fontSize: 12,
                      //             color:
                      //                 Constants.kPrimaryColor.withOpacity(0.8),
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //           textAlign: TextAlign.right,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const YMargin(30),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                        // ignore: deprecated_member_use
                        child: MaterialButton(
                          color: Constants.kPrimaryColor.withOpacity(0.8),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 14),
                          ),
                          shape: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Constants.kPrimaryColor, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(20),
                          textColor: Colors.white,
                          onPressed: () {
                            userLogin();
                            //Navigator.pushNamed(context, '/dashboard');
                          },
                        ),
                      ),
                 
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
