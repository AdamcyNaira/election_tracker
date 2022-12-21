import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 5, right: 10),
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      height: screenHeight(context) * 0.45,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Constants.kPrimaryColor,
            Constants.kPrimaryColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/CPNLogo.png',
            width: screenWidth(context) * 0.60,
            height: screenHeight(context) * 0.20,
          ),
          const YMargin(5),
          Text(
            "Computer Professionals",
            style: GoogleFonts.inter(
                fontSize: 18, fontWeight: FontWeight.w900, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const YMargin(3),
          Text(
            "Registration Council of Nigeria",
            style: GoogleFonts.alike(
                fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
      height: screenHeight(context) * 0.45,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Discover Your \n Dream Job Here",
            style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Constants.kTextColor),
            textAlign: TextAlign.center,
          ),
          const YMargin(10),
          Text(
            "Computer Professionals",
            style: GoogleFonts.alike(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const YMargin(3),
          Text(
            "Registration Council of Nigeria",
            style: GoogleFonts.alike(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const YMargin(80),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: MaterialButton(
                    color: Constants.kPrimaryColor.withOpacity(0.7),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 12),
                    ),
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.all(18),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: MaterialButton(
                    color: Colors.white,
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 12),
                    ),
                    splashColor: Constants.kPrimaryColor.withOpacity(0.2),
                    highlightColor: Constants.kPrimaryColor.withOpacity(0.2),
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Constants.kPrimaryColor.withOpacity(0.1),
                          width: 1),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.all(17),
                    textColor: Colors.black54,
                    onPressed: () {
                      Constants.sharedPref!.setBool("launched", true);
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
