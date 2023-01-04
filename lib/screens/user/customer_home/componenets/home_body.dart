import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servoo/global/constants.dart';
import 'package:servoo/screens/models/service_model.dart';
import 'package:servoo/screens/user/customer_home/services/home_services.dart';
import 'package:servoo/state_management/user_provider.dart';

import 'customer_home_header.dart';

class CustomerHomeBody extends StatelessWidget {
  const CustomerHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final HomeService homeService = HomeService();
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: containerBGclr.withOpacity(0.1),
              child: Column(children: [
                kSizedBoxOfH05,
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 8.0),
                  child: Text(
                    "Search for Services",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                kSizedBoxOfH10,
                const CustomerHomeHeader(),
                kSizedBoxOfH10,
                kSizedBoxOfH05,
                const Divider(
                  thickness: 1,
                  color: kTextColorSecondary,
                  height: 2.0,
                ),
              ]),
            ),
            kSizedBoxOfH10,
            Column(
              children: [
                FutureBuilder(
                    future: HomeService()
                        .getNerbyServices(context: context, cityName: "Indore"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<ServiceModel> services = snapshot.data!;

                        if (services.isEmpty) {
                          return Text(
                              "Yet!, you don't have any service provider nearby you.");
                        } else {
                          return ListView.builder(
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: services.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {},
                                child: Card(
                                  elevation: 8,
                                  margin: const EdgeInsets.only(
                                      left: 24, right: 24, top: 16),
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        12, 12, 12, 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          width: 96,
                                          height: 96,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              child: Image.asset(
                                                  "assets/icons/car_wash.png")),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              const SizedBox(height: 4),
                                              Text(
                                                // "data[index]['service_title']",
                                                services[index].title,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: kTextColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                services[index].spName,
                                                // "data[index]['service_provider_name']",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: kTextColorSecondary,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                services[index].subTitle,
                                                // "data[index]['rate']",
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: kPrimaryColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(height: 8),
                                            ],
                                          ),
                                        ),
                                        Visibility(
                                          visible: true,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Navigator.pushNamed(context,
                                              //     ProviderServiceDetailScreen.routeName,
                                              //     arguments: serviceData);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: kPrimaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Text(
                                              "Details",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: kSecondaryColor),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }
                      return CircularProgressIndicator(
                        color: Colors.blue,
                      );
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
