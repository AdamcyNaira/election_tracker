import 'package:election_tracker/models/user.dart';
import 'package:election_tracker/providers/provider_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import '../../util/constants.dart';



class Dashboard extends ConsumerStatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {


  
  @override
  Widget build(BuildContext context) {
   final _users = ref.watch(appStateProvider).user;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height * .22,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff598761).withOpacity(0.7),
                      Constants.kPrimaryColor2.withOpacity(0.8),
                    ]),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, left: 15.0, top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi ${_users.user!.agentName ?? "there"},',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quando',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'raleway',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/user-icon.jpg'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .15,
            left: 15,
            right: 15,
            child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 2.0,
                padding: const EdgeInsets.all(0.0),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                shrinkWrap: true,
                primary: false,
                children: [
                  menuCard(
                    context,
                    "Incidence Report ",
                    Ionicons.list_outline,
                    () {
                    Navigator.pushNamed(context, '/incidence_report');
                    },
                  ),
                  menuCard(
                    context,
                    "Election Report",
                    Ionicons.paper_plane_outline,
                    () {
                       //Constants.sharedPref!.setBool("isLoggedIn", false);
                    Navigator.pushNamed(context, '/election_report');
                    },
                  ),
                  menuCard(
                    context,
                    "Logout",
                    Ionicons.log_out_outline,
                    () {
                       Constants.sharedPref!.setBool("isLoggedIn", false);
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                    },
                  ),
                  
                ]),
          ),
        ],
      ),
    );
  }

  Widget menuCard(context, String text, IconData icon, Function() route) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Card(
      color: Constants.kBackgroundColor,
      child: InkWell(
        highlightColor: Constants.kPrimaryColor.withOpacity(0.3),
        onTap: route,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50,),
            SizedBox(
              height: 20.0,
            ),
            Text(
              text,
              style: TextStyle(
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

}