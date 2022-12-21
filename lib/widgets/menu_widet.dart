import 'package:election_tracker/util/constants.dart';
import 'package:flutter/material.dart';

Widget menuCard(context, String? text, String? icon, Function() route) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Card(
      child: InkWell(
        highlightColor: Constants.kPrimaryColor.withOpacity(0.3),
        onTap: route,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon!,
              height: 60,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              text!,
              style: const TextStyle(
                fontSize: 12.0,
                fontFamily: 'Quando',
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    ),
  );
}
