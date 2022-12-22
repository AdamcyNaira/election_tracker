import 'dart:io';
import 'dart:convert';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:election_tracker/models/user.dart';
import 'package:election_tracker/services/api_services.dart';
import 'package:election_tracker/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../util/constants.dart';
import 'package:http/http.dart' as http;
import '../../widgets/form_widget.dart';
import '../../widgets/general_widget.dart';

class AddIncidence extends ConsumerStatefulWidget {
  const AddIncidence({Key? key}) : super(key: key);

  @override
  ConsumerState<AddIncidence> createState() => _AddIncidenceState();
}

class _AddIncidenceState extends ConsumerState<AddIncidence> {
  // ignore: unused_field
  bool _isLoading = true;

  double _uploadingPercentage = 0;

  final formKey = GlobalKey<FormState>();

  // ignore: prefer_final_fields
  bool isLoading = true;
  bool isFormLoading = false;
  TextEditingController incidentCode = TextEditingController();
  TextEditingController puCode = TextEditingController();
  TextEditingController mediaType = TextEditingController();
  TextEditingController mediaUrl = TextEditingController();
  TextEditingController caption = TextEditingController();

  String incidentCode_Val = "";
  String puCode_Val = "";
  String mediaType_Val = "";
  String mediaUrl_Val = "";
  String caption_Val = "";
  dynamic result;

  List items = [];
  List items1 = [];

  Future<void> getIncidentReports() async {
    // setState(() {
    //   isLoading = false;
    // });
    final queryParameters = '09163347700';

    final url =
        'https://api.pdp.elmon.com.ng/v1/home-screen?agent=${queryParameters}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;

      final result = json['results'] as List;

      setState(() {
        items1 = result;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  getPoling() async {
    final _data = await Services.loadPullingUnitsFromAssets();
    print(_data);
    setState(() {
      items = _data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getPoling();
    // print(poling.pollingUnits);
    // ref.read(appStateProvider).setPolingList(poling);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Add Incidence',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: isLoading
          ? loadingPage()
          : Form(
              key: formKey,
              child: Column(children: [
                Expanded(
                  child: Container(
                    height: screenHeight(context),
                    decoration: const BoxDecoration(
                      color: Constants.kBackgroundColor,
                    ),
                    child: ListView(
                      children: [
                        const YMargin(10),
                        const YMargin(5),
                        inputLabel(title: 'Incidence Type'),
                        buildDropDownBtn(
                          controller: incidentCode,
                          onChanged: (newValue) {
                            setState(() {
                              incidentCode_Val = newValue;
                            });
                          },
                          items: incident.map((item) {
                            return DropdownMenuItem(
                              value: item['incidence_code'].toString(),
                              child: Text(
                                item['incidence_name'].toString(),
                                style: TextStyle(fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0XFFffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Incidence Type',
                        ),
                        const YMargin(5),
                        inputLabel(title: 'Select Poling Unit'),
                        buildDropDownBtn(
                          controller: puCode,
                          onChanged: (newValue) {
                            setState(() {
                              puCode_Val = newValue;
                            });
                          },
                          items: items
                              .where((element) =>
                                  element["pu_code"].toString() ==
                                  userPollingUnit.toString())
                              .map((item) {
                            return DropdownMenuItem(
                              value: item['ra_name'].toString(),
                              child: Text(
                                item['pu_name'].toString() +" - (${item['lga_name'].toString()})",
                                style: TextStyle(fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0XFFffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Poling Units',
                        ),
                        const YMargin(5),
                        inputLabel(title: 'Media Type'),
                        buildDropDownBtn(
                          controller: mediaType,
                          onChanged: (newValue) {
                            setState(() {
                              mediaType_Val = newValue;
                            });
                          },
                          items: type.map(buildMenuItem).toList(),
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0XFFffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Incidence Type',
                        ),
                        const YMargin(5),
                        inputLabel(title: 'Media URL'),
                        BuildDatePickerInput(
                          controller: mediaUrl,
                          onPressed: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();
                            if (result != null) {
                              File file = File(result.files.single.path!);

                              try {
                                final response =
                                    await cloudinary.uploadResource(
                                  CloudinaryUploadResource(
                                    filePath: file.path,
                                    fileBytes: file.readAsBytesSync(),
                                    resourceType: CloudinaryResourceType.auto,
                                    folder: "Inec-Uploads",
                                    fileName: 'some-name',
                                    progressCallback: (count, total) {
                                      setState(() {
                                        _uploadingPercentage = count / total;
                                      });
                                      print(
                                          'Uploading image from file with progress: $count/$total');
                                    },
                                  ),
                                );

                                if (response.isSuccessful) {
                                  print(
                                      'Get your image from with ${response.secureUrl}');
                                  setState(() {
                                    mediaUrl_Val =
                                        response.secureUrl.toString();
                                  });
                                }
                              } catch (e) {
                                print("ERROR!!!!!!!!!!!!!!!!");
                              }
                            } else {
                              // User canceled the picker
                            }
                          },
                          keyboardType: TextInputType.text,
                          hintText:
                              mediaUrl_Val == "" ? "Add Media" : mediaUrl_Val,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                          iconColor: Colors.teal,
                        ),
                        const YMargin(5),
                        inputLabel(title: 'Description'),
                        buildTextInput(
                          controller: caption,
                          onChanged: (val) {
                            setState(() {
                              caption_Val = val!;
                            });
                          },
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          hintText: 'Description here...',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 35.0),
                          // ignore: deprecated_member_use
                          child: MaterialButton(
                            color: Constants.kPrimaryColor.withOpacity(0.8),
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(fontSize: 14),
                            ),
                            shape: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(15),
                            textColor: Colors.white,
                            onPressed: () async {
                              await submitForm();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
    );
  }

  submitForm() async {
    if (incidentCode_Val == "") {
      showErrorDialog(
          context: context,
          msg: "Incidence Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

    if (puCode_Val == "") {
      showErrorDialog(
          context: context,
          msg: "Poling Unit Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

    if (mediaType_Val == "") {
      showErrorDialog(
          context: context,
          msg: "Media Type Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

    if (mediaUrl_Val == "") {
      showErrorDialog(
          context: context,
          msg: "Media URL Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

    final formData = {
      "incidence_code": incidentCode_Val,
      "pu_code": userPollingUnit,
      "media_type": mediaType_Val,
      "media_url": mediaUrl_Val,
      "caption": caption_Val,
    };

    setState(() {
          isFormLoading = true;
        });
        isFormLoading
            ? showLoadingDialog(context)
            : Navigator.of(context, rootNavigator: true).pop('dialog');

    //API CALL RESPONSE
    final responceRes = await Services.postIncidenceReport(formData);

    if (responceRes["status"]) {
      setState(() {
          isFormLoading = false;
        });
        isFormLoading
            ? showLoadingDialog(context)
            : Navigator.of(context, rootNavigator: true).pop('dialog');
      showSuccessDialog(
        context: context,
        msg: "Incidence Report sent successfully!",
        title: "Report Sent",
        route: () {
          Navigator.pushNamedAndRemoveUntil(
              context, "/dashboard", (route) => false);
        },
      );

      //reset form data
      incidentCode.text = "";
      puCode.text = "";
      mediaType.text = "";
      mediaUrl.text = "";
      caption.text = "";
    }else{
      setState(() {
          isFormLoading = false;
        });
        isFormLoading
            ? showLoadingDialog(context)
            : Navigator.of(context, rootNavigator: true).pop('dialog');
      showErrorDialog(
          context: context,
          msg: "Something Went Wrong, Please Try Again!",
          title: "ERROR!");
    }
  }
}
