import 'dart:async';
import 'package:election_tracker/screens/home/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:election_tracker/util/constants.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var _visible = true;

  AnimationController? animationController;
  Animation<double>? animation;
  Animation<double>? _pulseAnimation;

  bool _isPlaying = false;
  AnimationController? _animationController;

  bool launched = false;
  void getStated() {
    setState(() {
      launched = Constants.sharedPref!.getBool("launched") ?? false;
    });
  }

  void animate() {
    if (_isPlaying)
      // ignore: curly_braces_in_flow_control_structures
      _animationController!.stop();
    else
      // ignore: curly_braces_in_flow_control_structures
      _animationController!.forward();

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getStated();
    // ignore: prefer_const_constructors
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn));

    _pulseAnimation!.addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _animationController!.reverse();
      else if (status == AnimationStatus.dismissed)
        _animationController!.forward();
    });

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut);

    animation!.addListener(() => setState(() {}));
    animationController!.forward();

    Timer(const Duration(seconds: 4), () {
      if (launched == true) {
        Future.delayed(Duration.zero, () async {
          await Navigator.pushReplacementNamed(context, '/loading_state');
        });
      } else {
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                child: const Login(),
                duration: const Duration(milliseconds: 800)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: animation!.value * 150,
                  height: animation!.value * 150,
                ),
                const YMargin(20.0),
                ScaleTransition(
                  scale: _pulseAnimation!,
                  child: Text(
                    "Incidence Report App",
                    style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 74, 79, 94)),
                    textAlign: TextAlign.center,
                  ),
                ),
                const YMargin(3),
                ScaleTransition(
                  scale: _pulseAnimation!,
                  child: Text(
                    "",
                    style: GoogleFonts.alike(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Constants.kTextColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
