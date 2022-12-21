import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../util/constants.dart';
class OnBoarging extends StatefulWidget {
  const OnBoarging({Key? key}) : super(key: key);

  @override
  State<OnBoarging> createState() => _OnBoargingState();
}

class _OnBoargingState extends State<OnBoarging> {
final Color kDarkBlueColor = Color(0xFF053149);
  
  @override
  Widget build(BuildContext context) {
    return  CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(
        finishButtonColor: Constants.kPrimaryColor.withOpacity(0.8),
        controllerColor: kDarkBlueColor,
      headerBackgroundColor: Constants.kBackgroundColor,
      pageBackgroundColor: Constants.kBackgroundColor,
        // headerBackgroundColor: Colors.white,
        indicatorAbove: true,
        indicatorPosition: 80,
        finishButtonText: 'Get Started',
        finishButtonTextStyle:  GoogleFonts.sourceSansPro(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Constants.kBackgroundColor,
                  ),
        onFinish: (){
           Constants.sharedPref!.setBool("launched", true);
                      Navigator.pushNamed(context, '/login');
        },
        skipTextButton: Text('Skip'),
        trailing:  Padding(
                        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                        // ignore: deprecated_member_use
                        child: MaterialButton(
                          color: Constants.kPrimaryColor.withOpacity(0.8),
                          child: const Text(
                            'HOW TO SIGNUP',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          shape: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Constants.kPrimaryColor, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
            
                          textColor: Colors.white,
                          onPressed: () {
                           Navigator.pushNamed(context, '/how_to_register');
                          },
                        ),
                      ),
        background: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 30, 10),
            child: Image.asset('assets/images/silde5.png', fit: BoxFit.fill, width: screenWidth(context),),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 80, 20, 10),
            child: Image.asset('assets/images/slide2.png', fit: BoxFit.fill, width: screenWidth(context),),
          ),
           Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 30, 10),
            child: Image.asset('assets/images/slide3.png', fit: BoxFit.fill, width: screenWidth(context),),
          ),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40, ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: screenHeight(context)/1.7,
                  width: screenWidth(context),
                ),
                Text(
                  "WELCOME",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Constants.kTitleColor.withOpacity(0.9),
                  ),
                ),
                const YMargin(10),
                Text('Welcome to the Computer Professionals Registration Council of Nigeria (CPN).'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: screenHeight(context)/1.7,
                ),
                Text(
                  "VENUE",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Constants.kTitleColor.withOpacity(0.9),
                  ),
                ),
                const YMargin(5),
                Text('Joint the CPN Conference at Nicon Luxury Abuja.'),
              ],
            ),
          ),
           Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: screenHeight(context)/1.7,
                ),
                Text(
                  "NETWORKING",
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Constants.kTitleColor.withOpacity(0.9),
                  ),
                  textAlign: TextAlign.left,
                ),
                const YMargin(10),
                Text('Connect and discuss with the conference member.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
  }
