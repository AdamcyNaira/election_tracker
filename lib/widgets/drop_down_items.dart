import 'package:flutter/material.dart';

DropdownMenuItem<String> buildMenuItem(String item) =>
    DropdownMenuItem(child: Text(item), value: item);

final titleList = [
  'Title',
  'Mr',
  'Mrs',
  'Miss',
  'Ms',
  'Dr',
  'Capt',
  'Prof',
  'HRH'
];

final genderList = ['Gender', 'Male', 'Female'];

final bloodGroupList = [
  'Blood Group',
  'A+',
  'A-',
  'AB+',
  'AB-',
  'B+',
  'B-',
  'O+',
  'O-'
];

final maritalStatusList = [
  'Marital Status',
  'Single',
  'Married',
  'Divorced',
  'Widowed',
  'Separated',
];

final relationshipList = [
  'Relationship',
  'Father',
  'Mother',
  'Husband',
  'Wife',
  'Brother',
  'Sister',
  'Son',
  'Daughter',
];

final religionList = ['Religion', 'Christianity', 'Islam', 'Others'];
