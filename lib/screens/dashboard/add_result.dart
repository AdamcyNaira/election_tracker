import 'dart:io';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:election_tracker/services/api_services.dart';
import 'package:election_tracker/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../util/constants.dart';
import '../../widgets/form_widget.dart';
import '../../widgets/general_widget.dart';

class AddResult extends ConsumerStatefulWidget {
  const AddResult({Key? key}) : super(key: key);

  @override
  ConsumerState<AddResult> createState() => _AddResultState();
}

class _AddResultState extends ConsumerState<AddResult> {
  // ignore: unused_field
  bool _isLoading = true;

  double _uploadingPercentage = 0;

  final formKey = GlobalKey<FormState>();

  // ignore: prefer_final_fields
  bool isLoading = true;
  TextEditingController media_type = TextEditingController();
  TextEditingController media_url = TextEditingController();
  TextEditingController pu_code = TextEditingController();
  TextEditingController election_type = TextEditingController();
  TextEditingController apc = TextEditingController();
  TextEditingController lp = TextEditingController();
  TextEditingController pdp = TextEditingController();
  TextEditingController prp = TextEditingController();
  TextEditingController caption = TextEditingController();

   String media_type_val = "";
  String media_url_val = "";
  String pu_code_val = "";
  String election_type_val = "";
  String apc_val = "";
  String lp_val = "";
  String pdp_val = "";
  String prp_val = "";
  String caption_val = "";

  dynamic result;

  List items = [];


  getPoling() async {
    final _data = await Services.loadPullingUnitsFromAssets();
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
          'Add Election Result',
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
                        inputLabel(title: 'Electiion Type'),
                        buildDropDownBtn(
                          controller: election_type ,
                          onChanged: (newValue) {
                            setState(() {
                              election_type_val = newValue;
                            });
                          },
                          items: result_type_list.map((item) {
                            return DropdownMenuItem(
                              value: item['party_id'].toString(),
                              child: Text(
                                item['party_name'].toString(),
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
                          hintText: 'Election Type',
                        ),
                        const YMargin(5),
                        inputLabel(title: 'Select Poling Unit'),
                        buildDropDownBtn(
                          controller: pu_code,
                          onChanged: (newValue) {
                            setState(() {
                              pu_code_val = newValue;
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
                          controller: media_type ,
                          onChanged: (newValue) {
                            setState(() {
                              media_type_val = newValue;
                            });
                          },
                          items: type.map(buildMenuItem).toList(),
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0XFFffffff),
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Media Type',
                        ),
                        const YMargin(5),
                        inputLabel(title: 'Media URL'),
                        BuildDatePickerInput(
                          controller: media_url,
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
                                    media_url_val =
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
                              media_url_val == "" ? "Add Media" : media_url_val,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                          iconColor: Colors.teal,
                        ),
                         const YMargin(5),
                        inputLabel(title: 'APC'),
                        buildTextInput(
                          controller: apc,
                          onChanged: (val) {
                            setState(() {
                              apc_val = val!;
                            });
                          },
                          keyboardType: TextInputType.text,
                          hintText: 'APC',
                        ),
                         const YMargin(5),
                        inputLabel(title: 'PDP'),
                        buildTextInput(
                          controller: pdp,
                          onChanged: (val) {
                            setState(() {
                              pdp_val = val!;
                            });
                          },
                          keyboardType: TextInputType.text,
                          hintText: 'PDP',
                        ),
                         const YMargin(5),
                        inputLabel(title: 'PRP'),
                        buildTextInput(
                          controller: prp,
                          onChanged: (val) {
                            setState(() {
                              prp_val = val!;
                            });
                          },
                          keyboardType: TextInputType.text,
                          hintText: 'PRP',
                        ),
                         const YMargin(5),
                        inputLabel(title: 'LP'),
                        buildTextInput(
                          controller: lp,
                          onChanged: (val) {
                            setState(() {
                              lp_val = val!;
                            });
                          },
                          keyboardType: TextInputType.text,
                          hintText: 'LP',
                        ),
                        const YMargin(5),
                        inputLabel(title: 'Description'),
                        buildTextInput(
                          controller: caption,
                          onChanged: (val) {
                            setState(() {
                              caption_val = val!;
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
    if (election_type == "") {
      showErrorDialog(
          context: context,
          msg: "Incidence Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

    if (pu_code_val == "") {
      showErrorDialog(
          context: context,
          msg: "Poling Unit Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

    if (media_type_val == "") {
      showErrorDialog(
          context: context,
          msg: "Media Type Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

    if (media_url_val == "") {
      showErrorDialog(
          context: context,
          msg: "Media URL Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

     if (apc_val == "") {
      showErrorDialog(
          context: context,
          msg: "APC Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }


     if (pdp_val == "") {
      showErrorDialog(
          context: context,
          msg: "PDP Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

     if (prp_val == "") {
      showErrorDialog(
          context: context,
          msg: "PRP Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

     if (lp_val == "") {
      showErrorDialog(
          context: context,
          msg: "LP Form Field is Required!",
          title: "EMPTY FIELD!");
      return false;
    }

    final formData = {
      "election_type": election_type_val,
      "pu_code": userPollingUnit,
      "media_type": media_type_val,
      "media_url": media_url_val,
      "caption": caption_val,
      "apc": apc_val,
      "lp": lp_val,
      "pdp": pdp_val,
      "prp": prp_val,
    };

    //API CALL RESPONSE
    final responceRes = await Services.postResult(formData);

    if (responceRes["status"]) {
      showSuccessDialog(
        context: context,
        msg: "Election Result sent successfully!",
        title: "Result Sent",
        route: () {
          Navigator.pushNamedAndRemoveUntil(
              context, "/dashboard", (route) => false);
        },
      );
      //reset form data
      media_type.text = "";
      media_url.text = "";
      pu_code.text = "";
      election_type.text = "";
      apc.text = "";
      lp.text = "";
      pdp.text = "";
      prp.text = "";
      caption.text = "";
    }else{
       showErrorDialog(
          context: context,
          msg: "Something Went Wrong, Please Try Again!",
          title: "ERROR!");
      return false;
    }
      
  }
}
