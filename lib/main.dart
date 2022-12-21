import 'package:election_tracker/screens/dashboard/add_incidence.dart';
import 'package:election_tracker/screens/dashboard/add_result.dart';
import 'package:election_tracker/screens/dashboard/incidence_list.dart';
import 'package:election_tracker/screens/home/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/dashboard/dashboard.dart';
import 'screens/dashboard/election_report.dart';
import 'screens/home/loading_state.dart';
import 'screens/home/login.dart';
import 'screens/home/splash_screen.dart';
import 'util/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.sharedPref = await SharedPreferences.getInstance();
  await FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'INEC INCIDENCE REPORT',
      theme: ThemeData(
        primaryColor: Constants.kPrimaryColor.withOpacity(0.8),
        colorScheme: ColorScheme.light(),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        // '/registration': (ctx) => const Registration(),
        '/onBoarding': (ctx) => const OnBoarging(),
        '/login': (ctx) => const Login(),
        '/loading_state': (ctx) => const LoadingState(),
        '/dashboard': (ctx) =>  Dashboard(),
        '/incidence_report': (ctx) =>  IncidenceReport(),
        '/add_incidence': (ctx) =>  AddIncidence(),
        '/election_report': (ctx) =>  ElectionReport(),
        '/add_result': (ctx) =>  AddResult(),
      },
    );
  }
}
