import 'dart:async';
import 'dart:convert';
import 'package:election_tracker/screens/dashboard/dashboard.dart';
import 'package:election_tracker/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/user.dart';
import '../../providers/provider_services.dart';
import '../../util/constants.dart';
import '../../widgets/dialog_widget.dart';

class LoadingState extends ConsumerStatefulWidget {
  const LoadingState({Key? key}) : super(key: key);

  @override
  _LoadingStateState createState() => _LoadingStateState();
}

class _LoadingStateState extends ConsumerState<LoadingState> {
  bool isLoadingState = true;

  checkLoginState() async{
    // List polingData = [];
    if (isLoggedIn == true) {
      // if(pollingUnitList == null) {
      //  final polings = await Services.getPullingUnits();
      //  setState(() { polingData = polings;  });
      // }
      Future.delayed(Duration.zero, () {
        Users data = Users.fromJson(jsonDecode(userModel ?? ""));
        ref.read(appStateProvider).setUser(data);
        // ref.read(appStateProvider).setPolingUnitList(polingData);
        setState(() {  isLoadingState = false; });
        Navigator.pushNamedAndRemoveUntil(
            context, '/dashboard', (route) => false);
      });
    } else {
      Future.delayed(Duration.zero, () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
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

    return Scaffold(
      body: isLoadingState ? loadingPage() : Dashboard(),
    );
  }
}
