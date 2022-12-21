import 'package:election_tracker/models/incendent.dart';
import 'package:election_tracker/providers/provider_services.dart';
import 'package:election_tracker/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../util/constants.dart';
import '../../widgets/dashboard_widget.dart';
import '../../widgets/form_widget.dart';

class ElectionReport extends ConsumerStatefulWidget {
  const ElectionReport({Key? key}) : super(key: key);

  @override
  ConsumerState<ElectionReport> createState() => _ElectionReportState();
}

class _ElectionReportState extends ConsumerState<ElectionReport> {

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Incidence>> _incidence = ref.watch(incidenceListState);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Constants.kPrimaryColor.withOpacity(0.8),
        onPressed: () {
          Navigator.pushNamed(context, '/add_result');
        },
        label: Text(
          "Post Result",
           style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Constants.kPrimaryColor.withOpacity(0.8),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white54,
          ),
          onTap: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Election Report',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: 
           Container(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
              height: screenHeight(context),
              width: screenWidth(context),
              child: _incidence.when(
                data: (data) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    print(data[index].description);
                    return listCard(
                      context: context,
                      active: 0,
                      title: data[index].description,
                      subtitle: data[index].summary,
                      date: dateFormater(data[index].timestamp.toString(), "yMMMMd"),
                      picture: null,
                      route: () {
                       _showDetails(context);
                      },
                    );
                  },
                ),
                error: (error, stack) =>
                    networkErrorPage(ref.refresh(incidenceListState.future)),
                loading: () => loadingPage(),
              ),
            ),

    );
  }


   _showDetails(context) {
   // final _user = ref.read(eventStateProvider).user;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputLabelWithoutPadding(title: 'Election Report Details'),
                Divider(height: 5,),
                Text(
                "MEDIA FILE",
                style: GoogleFonts.sourceSansPro(
                  color: Constants.kTitleColor.withOpacity(0.6),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const YMargin(5),
                Image.asset('assets/images/logo.png', fit: BoxFit.fill, height: 100, width: screenWidth(context),),
                Divider(),
                textCard(
                  context: context,
                  value: "Over Voting",
                  key: "INCIDENCE TYPE",
                ),
                Divider(),
                 textCard(
                  context: context,
                  value: "20/01/0001",
                  key: "POLING UNIT CODE",
                ),
                Divider(),
                textCard(
                  context: context,
                  value: "N/A",
                  key: "DESCRIPTION",
                ),
                Divider(),
              ],
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        color: Colors.blueAccent,
                        child: Row(
                          children: const <Widget>[
                            Text(
                              "OK",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 5.0),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ]),
              )
            ],
          );
        });
  }

}