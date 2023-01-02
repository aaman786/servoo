import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servoo/screens/models/service_model.dart';
import 'package:servoo/screens/provider/provider_components/provider_custom_delete_dialog.dart';
import 'package:servoo/screens/provider/provider_components/provider_image_header.dart';
import 'package:servoo/screens/provider/serive_details/components/about_section.dart';
import 'package:servoo/screens/provider/serive_details/components/review_container.dart';
import 'package:servoo/screens/provider/serive_details/components/service_info.dart';

import '../../../../global/constants.dart';
import '../../../../global/size_config.dart';

class ProviderServiceDetailBody extends StatefulWidget {
  const ProviderServiceDetailBody({super.key, required this.serviceData});
  final ServiceModel serviceData;

  @override
  State<ProviderServiceDetailBody> createState() =>
      _ProviderServiceDetailBodyState();
}

class _ProviderServiceDetailBodyState extends State<ProviderServiceDetailBody> {
  bool isAdmin = false;
  // final List<String> _listImages = [];
  bool? error, sending, success;
  String? msg;
  // String webUrl = providerbaseUrl + "delete_service.php";

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   if (box!.containsKey("admin_login")) {
  //     setState(() {
  //       isAdmin = true;
  //     });
  //   } else {
  //     setState(() {
  //       isAdmin = false;
  //     });
  //     error = false;
  //     sending = false;
  //     success = false;

  //     msg = "";
  //   }

  //   _listImages.add(widget.serviceImages);
  //   _listImages.add(widget.serviceImages1);
  //   _listImages.add(widget.serviceImages2);
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            ServiceImagheHeader(
                // listImages: [
                //   widget.serviceImages,
                //   widget.serviceImages1,
                //   widget.serviceImages2
                // ],
                ),
            Positioned(
              top: 44,
              left: 24,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: kFormColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(36)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: kTextColorSecondary,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 44,
              right: 24,
              child: Center(
                child: InkWell(
                  onTap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          // Navigator.of(context).pop();

                          return CusDeleteDialog(
                            press: () {
                              // sendData();
                            },
                            close: () {
                              Navigator.of(context).pop();
                            },
                          );
                        });
                  },
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: kFormColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(36)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          ProviderServiceDetailInfo(serviceData: widget.serviceData),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),

          ProviderServiceDetailsAboutSection(serviceData: widget.serviceData),
          SizedBox(
            height: getProportionateScreenHeight(12),
          ),

          // PROVIDER ID
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: containerBGclr,
                padding:
                    EdgeInsets.only(top: 05, right: 16, left: 24, bottom: 10),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Work Id : ",
                    style: GoogleFonts.abrilFatface(
                        fontSize: 20,
                        letterSpacing: 0.5,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: widget.serviceData.id,
                    style: GoogleFonts.aladin(
                        fontSize: 18,
                        letterSpacing: 01,
                        color: kTextColorSecondary.withGreen(67),
                        fontWeight: FontWeight.w500),
                  )
                ])),
              ),
            ],
          ),

          SizedBox(
            height: getProportionateScreenHeight(12),
          ),
          Visibility(
              visible: isAdmin == true ? false : true,
              child: ProviderServiceDetailReviewContainer()),
        ],
      ),
    );
  }

  // Future<void> sendData() async {
  //   var res = await http.post(Uri.parse(webUrl), body: {
  //     "id": widget.id.toString(),
  //     "service_provider_id": widget.spId.toString(),
  //     "service_status": 'delete',
  //   }); //sending post request with header data

  //   if (res.statusCode == 200) {
  //     print('response:');
  //     print(res.body); //print raw response on console
  //     var data = json.decode(res.body); //decoding json to array
  //     if (data["success"] == 0) {
  //       setState(() {
  //         //refresh the UI when error is recieved from server
  //         sending = false;
  //         error = true;
  //         msg = data["msg"]; //error message from server
  //       });
  //     } else {
  //       setState(() {
  //         msg = "success sendign data.";
  //         print(msg);
  //         sending = false;
  //         success = true;
  //         print(data["msg"]);
  //         Navigator.of(context).pushNamedAndRemoveUntil(
  //           ProviderHomeScreen.routeName,
  //           (route) => false,
  //         );
  //       });
  //     }
  //   } else {
  //     //there is error
  //     setState(() {
  //       error = true;
  //       msg = "Error during sendign data.";
  //       print(msg);
  //       print(res.body);
  //       sending = false;
  //       //mark error and refresh UI with setState
  //     });
  //   }
  // }
}
