import 'package:flutter/material.dart';
import 'package:servoo/global/components/custom_elevated_btn.dart';
import 'package:servoo/global/constants.dart';
import 'package:servoo/global/keyboard.dart';
import 'package:servoo/screens/provider/home/services/components/service_body.dart';
import 'package:servoo/screens/provider/services/provider_services.dart';

import '../../../global/size_config.dart';

class ChooseServiceFormScreen extends StatelessWidget {
  // static const String routeName = "/choose_service_form";
  const ChooseServiceFormScreen({super.key, required this.serviceName});
  final String serviceName;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        KeyboardUtil.hideKeyboard(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarBGclr,
          title: const Text("Fill the details"),
        ),
        backgroundColor:
            const Color.fromARGB(255, 255, 164, 164).withOpacity(0.5),
        body: ChooseServiceDetailForm(
          serviceName: serviceName,
        ),
      ),
    );
  }
}

class ChooseServiceDetailForm extends StatefulWidget {
  const ChooseServiceDetailForm({super.key, required this.serviceName});
  final String serviceName;

  @override
  State<ChooseServiceDetailForm> createState() =>
      ChooseServiceDetailFormState();
}

class ChooseServiceDetailFormState extends State<ChooseServiceDetailForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController subTitleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController noteCtrl = TextEditingController();
  TextEditingController cityNameCtrl = TextEditingController();
  TextEditingController cityPincodeCtrl = TextEditingController();

  @override
  void dispose() {
    titleCtrl.dispose();
    subTitleCtrl.dispose();
    descriptionCtrl.dispose();
    noteCtrl.dispose();
    cityNameCtrl.dispose();
    cityPincodeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    titleCtrl.text = widget.serviceName;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 08, vertical: 12),
          child: Container(
            color: Colors.blueGrey.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    serviceTitleField(
                        labelText: "Service Title",
                        hintText: "Enter a Title for service",
                        cntrl: titleCtrl),
                    kSizedBoxOfH20,
                    serviceTitleField(
                        labelText: "Service Sub-Title",
                        hintText: "Enter a Sub-Title for service",
                        cntrl: subTitleCtrl),
                    kSizedBoxOfH20,
                    serviceTitleField(
                        labelText: "Service Description",
                        hintText: "Enter a Description for service",
                        cntrl: descriptionCtrl,
                        expandFeild: true),
                    kSizedBoxOfH20,
                    serviceTitleField(
                        labelText: "Note",
                        hintText: "Enter a Note for service",
                        cntrl: noteCtrl,
                        expandFeild: true),
                    kSizedBoxOfH20,
                    Row(
                      children: [
                        Expanded(
                          child: serviceTitleField(
                              labelText: "City Name",
                              hintText: "City Name",
                              cntrl: noteCtrl),
                        ),
                        kSizedBoxOfW20,
                        Expanded(
                          child: serviceTitleField(
                              labelText: "City Pincode",
                              hintText: "City Pincode",
                              cntrl: noteCtrl),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustElevatedBtn(
              text: "Proceed to Next",
              press: () {
                addServiceDetails();
              }),
        )
      ],
    );
  }

  void addServiceDetails() {
    ProviderService providerService = ProviderService();

    providerService.addService(
        context: context,
        title: "Appliance",
        subTitle: "I will repair ur appliance",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
        note:
            "Get 10% off of your first order with us and be the first to know about new arrivals and exclusive offers!",
        cityName: "Indore",
        pinCode: "56443",
        dateTime: DateTime.now().toString());
    // if (_formKey.currentState!.validate()) {
    //   KeyboardUtil.hideKeyboard(context);
    // }
  }

  TextFormField serviceTitleField(
      {required String labelText,
      required String hintText,
      required TextEditingController cntrl,
      bool? expandFeild}) {
    return TextFormField(
      minLines: 1,
      maxLines: expandFeild == null ? null : 5,
      controller: cntrl,
      validator: (value) {
        if (value!.isEmpty) {
          return "Fill this field.";
        }
        return null;
      },
      style: TextStyle(
          color: Colors.grey.withOpacity(0.9),
          fontWeight: FontWeight.w500,
          fontSize: 18),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
