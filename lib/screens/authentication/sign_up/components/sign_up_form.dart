import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:servoo/global/components/custom_elevated_btn.dart';
import 'package:servoo/screens/authentication/authentication_services.dart';

import '../../../../global/constants.dart';
import '../../../../global/enum.dart';
import '../../../../global/keyboard.dart';
import '../../../../global/size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  Who who = Who.serviceProvider;

  bool remember = false;
  final List<String> errors = [];

  TextEditingController emailctrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  TextEditingController confirmPasswordctrl = TextEditingController();
  TextEditingController firstNamectrl = TextEditingController();
  // TextEditingController lastNamectrl = TextEditingController();
  TextEditingController mobilectrl = TextEditingController();
  TextEditingController cnicctrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();

  @override
  void dispose() {
    emailctrl.dispose();
    passwordctrl.dispose();
    confirmPasswordctrl.dispose();
    firstNamectrl.dispose();
    mobilectrl.dispose();
    addressCtrl.dispose();
    cnicctrl.dispose();
    super.dispose();
  }
  //text controller for TextField

  bool? error, sending, success;
  String? msg;

  // String webUrl = baseUrl + "flutterfyp/Registeruser.php";

  // Initially password is obscure
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // bool agree = false;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  // String imageUrl = 'Empty';

  String? fileName;

  // static const snackBar = SnackBar(
  //   content: Text('Provide Required Informaition!'),
  // );

  // String? mtoken = " ";
  // @override
  // void initState() {
  //   // error = false;
  //   // sending = false;
  //   // success = false;
  //   // msg = "";
  //   // super.initState();
  //   // getDeviceToken();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Center(
                //   child: Stack(
                //     children: [
                //       CircleAvatar(
                //         radius: 50.0,
                //         backgroundColor: Colors.white,
                //         child: CircleAvatar(
                //           backgroundColor: Colors.white,
                //           radius: 48.0,
                //           child: ClipRRect(
                //             borderRadius: BorderRadius.circular(48.0),
                //             child: Image.asset(
                //               "assets/images/cleaner_2.png",
                //               fit: BoxFit.fill,
                //               width: 150,
                //               height: 150,
                //             ),
                //             // imageUrl == 'Empty'
                //             //     ? Image.asset(
                //             //         "assets/images/cleaner_2.png",
                //             //         fit: BoxFit.fill,
                //             //         width: 150,
                //             //         height: 150,
                //             //       )
                //             //     : Image.network(
                //             //         imageUrl,
                //             //         fit: BoxFit.cover,
                //             //         width: 150,
                //             //         height: 150,
                //             //       ),
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         right: 0,
                //         bottom: 0,
                //         child: Container(
                //           padding: const EdgeInsets.all(7.5),
                //           decoration: BoxDecoration(
                //               border: Border.all(width: 2, color: Colors.white),
                //               borderRadius: BorderRadius.circular(48.0),
                //               color: kPrimaryColor),
                //           child: InkWell(
                //             onTap: () {
                //               _optionsDialogBox();
                //             },
                //             child: const Icon(
                //               Icons.linked_camera,
                //               color: Colors.white,
                //               size: 18,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                //firstName form

                buildFirstNameFormField(),
                SizedBox(height: getProportionateScreenHeight(12)),

                // buildLastNameFormField(),
                // SizedBox(height: getProportionateScreenHeight(12)),
                //email form
                buildEmailFormField(),
                SizedBox(height: getProportionateScreenHeight(12)),

                buildAddressFormField(),
                SizedBox(height: getProportionateScreenHeight(12)),

                //Postal Code form
                buildMobileFormField(),
                SizedBox(height: getProportionateScreenHeight(12)),
                //Postal CNIC form
                // buildCnicNameFormField(),
                // SizedBox(height: getProportionateScreenHeight(12)),
                //password form
                buildPasswordFormField(),
                SizedBox(height: getProportionateScreenHeight(12)),
                //Confirm password form
                buildConfirmPasswordFormField(),

                SizedBox(height: getProportionateScreenHeight(12)),

                Row(
                  children: [
                    Expanded(
                        child: radioButton("Provider", Who.serviceProvider)),
                    Expanded(child: radioButton("User", Who.customer)),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(12)),
              ],
            ),
          ),
          CustElevatedBtn(
            text: "Sign Up",
            press: () {
              signUp();
            },
          ),
        ],
      ),
    );
  }

  ListTile radioButton(String label, Who value) {
    return ListTile(
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.all(0),
      // tileColor: Colors.blueGrey.withOpacity(0.4),
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.grey.shade600),
      ),
      leading: Radio(
          activeColor: Colors.black,
          value: value,
          groupValue: who,
          onChanged: (Who? val) {
            setState(() {
              who = val!;
            });
          }),
    );
  }

  // Future<void> getDeviceToken() async {
  //   await FirebaseMessaging.instance.getToken().then((token) {
  //     setState(() {
  //       mtoken = token;
  //       print('Token:' + mtoken!);
  //     });
  //   });
  // }

  void signUp() {
    AuthenticationServices authenticationServices = AuthenticationServices();
    print("object1");
    authenticationServices.signUpUser(
        email: "satvilkar123@gmail.com",
        context: context,
        name: "Aaman",
        address:
            "At post Hativ, Taluka Sangmeshwar, District Ratnagiri - 453331",
        phone: "7974969426",
        password: "aman123");
    // if (_formKey.currentState!.validate()) {}
    // KeyboardUtil.hideKeyboard(context);
  }

  // //Camera Method
  Future openCamera() async {
    Navigator.of(context).pop();
    var imageFrmCamera = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _selectedImage = File(imageFrmCamera!.path);
      fileName = _selectedImage!.path.split('/').last;
      print(fileName);
      // uploadImageToFirebase(_selectedImage!, fileName!);
    });
    //if (mounted) Navigator.of(context).pop();
  }

  //Gallery method
  Future openGallery() async {
    Navigator.of(context).pop();
    var pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(pickedFile!.path);
      fileName = _selectedImage!.path.split('/').last;
      print(fileName);
      // uploadImageToFirebase(_selectedImage!, fileName!);
    });
    // if (mounted) Navigator.of(context).pop();
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Your Method'),
          backgroundColor: kFormColor,
          contentPadding: const EdgeInsets.all(20.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  onTap: openCamera,
                  child: const Text("Take a Picture"),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                const Divider(
                  color: Colors.white70,
                  height: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                GestureDetector(
                  onTap: openGallery,
                  child: const Text("Open Gallery"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: firstNamectrl,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return kNameNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Full Name",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: addressCtrl,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return kNameNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Enter your Address",
        fillColor: kFormColor,
        filled: true,
      ),
      minLines: 1,
      maxLines: 2,
    );
  }

  // TextFormField buildLastNameFormField() {
  //   return TextFormField(
  //     // controller: lastNamectrl,
  //     cursorColor: kPrimaryColor,
  //     keyboardType: TextInputType.name,
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return kNameNullError;
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12.0),
  //         borderSide: BorderSide.none,
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12.0),
  //         borderSide: const BorderSide(color: kPrimaryColor),
  //       ),
  //       labelStyle: const TextStyle(color: kPrimaryColor),
  //       focusColor: kPrimaryColor,
  //       hintText: "Last Name",
  //       fillColor: kFormColor,
  //       filled: true,
  //     ),
  //   );
  // }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailctrl,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Enter email",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildMobileFormField() {
    return TextFormField(
      controller: mobilectrl,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return kCodeNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        labelStyle: const TextStyle(color: kPrimaryColor),
        focusColor: kPrimaryColor,
        hintText: "Mobile",
        fillColor: kFormColor,
        filled: true,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordctrl,
      autocorrect: false,
      obscureText: _obscureText,
      enableSuggestions: false,
      cursorColor: kPrimaryColor,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        hintText: "Enter your password",
        fillColor: kFormColor,
        filled: true,
        labelStyle: const TextStyle(color: kPrimaryColor),
        suffixIcon: GestureDetector(
          onTap: _toggle,
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: kTextColorSecondary,
          ),
        ),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: confirmPasswordctrl,
      autocorrect: false,
      obscureText: _obscureText,
      enableSuggestions: false,
      cursorColor: kPrimaryColor,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        } else if (value != passwordctrl.text) {
          return kConfirmPasswordError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        hintText: "Confirm password",
        fillColor: kFormColor,
        filled: true,
        labelStyle: const TextStyle(color: kPrimaryColor),
        suffixIcon: GestureDetector(
          onTap: _toggle,
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: kTextColorSecondary,
          ),
        ),
      ),
    );
  }

  // TextFormField buildCnicNameFormField() {
  //   return TextFormField(
  //     controller: cnicctrl,
  //     cursorColor: kPrimaryColor,
  //     keyboardType: TextInputType.number,
  //     onSaved: (newValue) => cnic = newValue!,
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return kConfirmCniC;
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12.0),
  //         borderSide: BorderSide.none,
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12.0),
  //         borderSide: const BorderSide(color: kPrimaryColor),
  //       ),
  //       labelStyle: const TextStyle(color: kPrimaryColor),
  //       focusColor: kPrimaryColor,
  //       hintText: "CNIC",
  //       fillColor: kFormColor,
  //       filled: true,
  //     ),
  //   );
  // }

}
