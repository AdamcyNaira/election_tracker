import 'package:election_tracker/models/poling_unit.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class AppState extends ChangeNotifier {
  // GETTERS
  Users user = Users();
  PolingUnit poling = PolingUnit();
  String videoID = '';

  List polingUnitList = [];
 

  //SETTERS
  void setUser(value) {
    user = value;
    notifyListeners();
  }

  void setPolingUnitList(value) {
    polingUnitList = value;
    notifyListeners();
  }

  void setVideoID(value) {
    videoID = value;
    notifyListeners();
  }
}
