// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:io';
import 'package:election_tracker/models/incendent.dart';
import 'package:election_tracker/models/poling_unit.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../util/constants.dart';
import 'package:connectivity/connectivity.dart';

class Services {
  //USER LOGIN
  static userLogin(String username, String password) async {
    try {
      final response =
          await http.post(Uri.parse('$serverLink/authenticate'), body: {
        "phone_number": username,
        "password": password,
      });
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonResponse;
      } else {
        return jsonResponse;
      }
    } catch (e) {
      return e;
    }
  }

   static Future<List> loadPullingUnitsFromAssets() async {
    final jsondata = await rootBundle.loadString('assets/json/polingUnit.json');
    final polingList = json.decode(jsondata) as List<dynamic>;
    return polingList;
  }

  

  //Fetch poling
  static getPolingUnit() async {
    List<PolingUnit> _poling = [];

    //Save poling list in local Storage
    String fileName = "PolingUnitList.json";
    var dir = await getTemporaryDirectory();
    File file = File(dir.path + "/" + fileName);
    var result = await Connectivity().checkConnectivity();

    try {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        final response = await http
            .get(Uri.parse('$serverLink/polling-units?agent=${queryParameters}'), headers: header);
        if (response.statusCode == 200) {
          final data = json.decode(response.body) as Map;
          final jsonData = jsonDecode(response.body);
          //Write poling list in local Storage
          file.writeAsStringSync(response.body,
              flush: true, mode: FileMode.write);
        
          return _poling;
        } else {
          return _poling;
        }
      } else if (file.existsSync()) {
        var jsonData = file.readAsStringSync();
        List localData = json.decode(jsonData);
        localData.map((items) => _poling.add(PolingUnit.fromJson(items))).toList();
        return _poling;
      } else {
        return _poling;
      }
    } catch (e) {
      return throw Exception('Failed to load data $e');
    }
  }

    //Fetch Incedence
   Future<List<Incidence>> getIncedence() async {
    List<Incidence> _incidence = [];

    //Save Incidence list in local Storage
    String fileName = "IncidenceList.json";
    var dir = await getTemporaryDirectory();
    File file = File(dir.path + "/" + fileName);
    var result = await Connectivity().checkConnectivity();

    try {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        final response = await http
            .get(Uri.parse('$serverLink/home-screen?agent=${queryParameters}'), headers: header);
        if (response.statusCode == 200) {
          print(response.body);
          final data = json.decode(response.body) as Map;
          final jsonData = jsonDecode(response.body);
          //Write Incidence list in local Storage
          file.writeAsStringSync(response.body,
              flush: true, mode: FileMode.write);
              jsonData["results"].map((items) => _incidence.add(Incidence.fromJson(items))).toList();
        
          return _incidence;
        } else {
          return _incidence;
        }
      } else if (file.existsSync()) {
        var jsonData = file.readAsStringSync();
        final localData = json.decode(jsonData);
        localData["results"].map((items) => _incidence.add(Incidence.fromJson(items))).toList();
        return _incidence;
      } else {
        return _incidence;
      }
    } catch (e) {
      return throw Exception('Failed to load data $e');
    }
  }


  //POST INCIDENCE
  static postIncidenceReport(formData) async {
    try {
      final response =
          await http.post(Uri.parse('$serverLink/incidence?agent=${queryParameters}'), body: formData);
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonResponse;
      } else {
        return jsonResponse;
      }
    } catch (e) {
      return e;
    }
  }

  //POST RESULT
  static postResult(formData) async {
    try {
      final response =
          await http.post(Uri.parse('$serverLink/results?agent=${queryParameters}'), body: formData);
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return jsonResponse;
      } else {
        return jsonResponse;
      }
    } catch (e) {
      return e;
    }
  }
}
