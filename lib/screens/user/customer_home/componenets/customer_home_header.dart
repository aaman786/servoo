import 'package:flutter/material.dart';
import 'package:servoo/screens/models/service_model.dart';
import 'package:servoo/screens/user/customer_home/search_service/search_service_screen.dart';
import 'package:servoo/screens/user/customer_home/services/home_services.dart';

import '../../../../global/constants.dart';
import '../../../../global/utils.dart';

class CustomerHomeHeader extends StatefulWidget {
  const CustomerHomeHeader({super.key});

  @override
  State<CustomerHomeHeader> createState() => _CustomerHomeHeaderState();
}

class _CustomerHomeHeaderState extends State<CustomerHomeHeader> {
  final _formKey = GlobalKey<FormState>();
  String selectedService = "Appliance";

  final TextEditingController citynameCtrl = TextEditingController();

  Future<void> searchService() async {
    List<ServiceModel> services;

    HomeService homeService = HomeService();
    services = await homeService.searchService(
        context: context, cityName: "indore", serviceName: "Appliance");

    if (services.isNotEmpty) {
      searchNavigator(services);
    } else {
      displayDialog(
          context: context,
          title: "Sorry For Conviniance",
          content:
              "You don't have any service provider for $selectedService service nearby your area ${citynameCtrl.text}");
    }
  }

  void searchNavigator(List<ServiceModel> services) {
    Navigator.pushNamed(context, SearchServiceScreen.routeName,
        arguments: services);
  }

  @override
  void dispose() {
    citynameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
        child: SizedBox(
          height: 48,
          child: InkWell(
            onTap: () {
              // Navigator.pushNamed(context, SearchScreen.routeName);
            },
            child: Row(
              children: [
                Expanded(child: buildSearchFormField()),
                kSizedBoxOfW10,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 05),
                  decoration: BoxDecoration(
                      color: kTextColorSecondary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: DropdownButton(
                      // dropdownColor: Colors.amber,
                      focusColor: Colors.black45,
                      value: selectedService,
                      items: iconData.map((e) {
                        return DropdownMenuItem<String>(
                            value: e['name'], child: Text(e['name']!));
                      }).toList(),
                      onChanged: (val) {
                        setState(() => selectedService = val!);
                      }),
                ),
                kSizedBoxOfW10,
                GestureDetector(
                  onTap: () async {
                    // TODO :- Search a sercive Custumer Home Screen

                    searchService();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: kTextColorSecondary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildSearchFormField() {
    return TextFormField(
      onTap: () {},
      controller: citynameCtrl,
      cursorColor: kTextColorSecondary.withOpacity(0.2),
      keyboardType: TextInputType.text,
      showCursor: false,
      validator: (value) {
        if (value!.isEmpty) {
          return "Search here";
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: kTextColorSecondary.withOpacity(0.2)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kTextColorSecondary.withOpacity(0.2),
        hintText: "Enter city name",
        hintStyle: TextStyle(color: kTextColor.withOpacity(0.9)),
        fillColor: kTextColorSecondary.withOpacity(0.2),
        filled: true,
      ),
    );
  }
}
