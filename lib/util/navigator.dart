import 'package:flutter/material.dart';

route(context) {
  final Map route =
      ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  return route;
}
