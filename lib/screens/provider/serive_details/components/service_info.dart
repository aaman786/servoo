import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servoo/screens/models/service_model.dart';

import '../../../../global/constants.dart';
import '../../../../global/size_config.dart';

class ProviderServiceDetailInfo extends StatefulWidget {
  const ProviderServiceDetailInfo({super.key, required this.serviceData});
  final ServiceModel serviceData;

  @override
  State<ProviderServiceDetailInfo> createState() =>
      _ProviderServiceDetailInfoState();
}

class _ProviderServiceDetailInfoState extends State<ProviderServiceDetailInfo> {
  bool _favourite = true;
  bool isAdmin = false;

  // @override
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
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final ServiceModel serviceData = widget.serviceData;

    return Container(
      color: containerBGclr,
      padding: const EdgeInsets.only(left: 24, right: 16, top: 05, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                serviceData.title,
                // "widget.title",
                style: const TextStyle(
                  color: kTextColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Visibility(
              //   visible: false,
              //   child: IconButton(
              //     icon: Icon(
              //       _favourite
              //           ? Icons.favorite_outline_rounded
              //           : Icons.favorite,
              //       color: kPrimaryColor,
              //     ),
              //     onPressed: () {
              //       setState(() {
              //         _favourite = !_favourite;
              //       });
              //     },
              //   ),
              // ),
              SizedBox(
                width: getProportionateScreenWidth(89),
              ),
              Visibility(
                visible: isAdmin == true ? false : true,
                child: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.star,
                          size: 26,
                          color: textClr1,
                        ),
                      ),
                      TextSpan(
                        text: "4.5",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: textClrBlueGreyB157,
                        ),
                      ),
                      TextSpan(
                        text: " | ",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: textClr1,
                        ),
                      ),
                      TextSpan(
                        text: "40 ",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: textClrBlueGreyB157,
                        ),
                      ),
                      TextSpan(
                        text: "Reviews",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 14.0,
                            letterSpacing: 1,
                            color: textClr1,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(8),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Text(
                  serviceData.subTitle,
                  maxLines: 2,
                  // "widget.spName",
                  style: GoogleFonts.aBeeZee(
                    color: textClrBlueGreyB157,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(8),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 120,
                height: 32,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    serviceData.spName,
                    // "widget.speciality",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Icon(
                Icons.location_on,
                size: 24,
                color: kPrimaryColor,
              ),
              Flexible(
                child: Text(
                  serviceData.address,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: kTextColorSecondary,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(16),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: " Price  ",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: kTextColorSecondary,
                        ),
                      ),
                      TextSpan(
                        text: "20 Rs",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      TextSpan(
                        text: " ( Per Hour ) ",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: kTextColorSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
