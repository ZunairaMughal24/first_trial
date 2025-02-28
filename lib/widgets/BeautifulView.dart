// import 'package:flutter/material.dart';

// class BeautifulView extends StatelessWidget {
//   final String title;
//   final Color? color;
//   final double? size;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final String fontFamily;

//   const BeautifulView({
//     required this.title,
//     this.color = Colors.blue,
//     this.size,
//     this.borderRadius,
//     this.padding,
//     this.fontFamily = "sana",
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: padding ?? EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 129, 109, 109),
//         borderRadius: BorderRadius.circular(borderRadius ?? 0),
//       ),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: size ?? 16,
//           color: Colors.black,
//           fontFamily: fontFamily,
//         ),
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BeautifulView extends StatefulWidget {
  final String title;
  final String color;
  final String size;
  final String borderRadius;
  final String padding;
  final String fontFamily;
  final String buttonText;

  BeautifulView({
    required this.title,
    required this.buttonText,
    this.color = "Blue",
    this.size = "16",
    this.borderRadius = "12",
    this.padding = "16",
    this.fontFamily = "sana",
    super.key,
  });

  @override
  State<BeautifulView> createState() => _BeautifulViewState();
}

class _BeautifulViewState extends State<BeautifulView> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _PasswordController = TextEditingController();

  String? nameError;

  String? passwordError;
  bool isVisible = true;
  void _validateAndSubmit() {
    log(" Validate and Submit Called");
    String name = _nameController.text.trim();
    String password = _PasswordController.text.trim();

    log("Name Entered: $name");
    log("Password Entered: $password");

    if (name.isEmpty || password.isEmpty) {
      log("Fields cannot be empty!");
      Fluttertoast.showToast(
          msg: "Fields cannot be empty!", backgroundColor: Colors.red);
      return;
    }

    if (nameError != null || passwordError != null) {
      log("Fix errors before submitting!");
      Fluttertoast.showToast(
          msg: "Fix errors before submitting!", backgroundColor: Colors.red);
      return;
    }

    Fluttertoast.showToast(
        // msg: "Name: $name\nPassword: $password",
        msg: "Successfully Submitted",
        backgroundColor: Colors.green);

    log("Final Submitted Name: $name");
    log("Final Submitted Password: $password");
  }

  void _validateName(String value) {
    log("Validating Name: $value");
    if (RegExp(r'[^a-zA-Z0-9]').hasMatch(value)) {
      log("Name contains special characters!");
      setState(() {
        nameError = "Special characters are not allowed!";
      });
      Fluttertoast.showToast(
          msg: "Special characters are not allowed!",
          backgroundColor: Colors.red);
    } else {
      log("Name is valid");
      setState(() {
        nameError = null;
      });
    }
  }

  void _validatePassword(String value) {
    log("Validating Password: $value");
    if (value.length < 8) {
      log("⚠️ Password too short!");
      setState(() {
        // passwordError = "Password must be at least 8 characters!";
      });
      Fluttertoast.showToast(
          msg: "⚠️ Password too short!", backgroundColor: Colors.orange);
    } else {
      log("✅ Password is valid");
      Fluttertoast.showToast(
          msg: "⚠️ Password is okay!", backgroundColor: Colors.green);
      setState(() {
        passwordError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                  ),
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType:
                          TextInputType.text, // Allows letters and numbers
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(
                            r'[a-zA-Z0-9]')) // Only allows letters and numbers
                      ],
                      controller: _nameController,
                      onChanged: _validateName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "enter your name",
                        errorText: nameError,
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 121, 116, 116),
                          fontSize: 18,
                        ),
                        // labelText: "name",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                  ),
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: isVisible,
                      keyboardType:
                          TextInputType.text, // Allows letters and numbers
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(
                            r'[a-zA-Z0-9@#\$%&*]')) // Only allows letters and numbers
                      ],

                      controller: _PasswordController,
                      onChanged: _validatePassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "enter your password",

                        errorText: passwordError,
                        hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 121, 116, 116),
                          fontSize: 18,
                        ),
                        // labelText: "name",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    _validateAndSubmit();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 6, 30, 82),
                    ),
                    height: 50,
                    width: 330,
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
        // child: Container(
        //   padding: EdgeInsets.all(double.tryParse(padding) ?? 16),
        //   decoration: BoxDecoration(
        //     color: const Color.fromARGB(255, 175, 161, 161),
        //     borderRadius:
        //         BorderRadius.circular(double.tryParse(borderRadius) ?? 12),
        //   ),
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Text(
        //         title,
        //         style: TextStyle(
        //           fontSize: 16,
        //           fontWeight: FontWeight.bold,
        //           color: Colors.white,
        //         ),
        //       ),
        //       const SizedBox(height: 12),
        //       ElevatedButton(
        //         style: ElevatedButton.styleFrom(
        //           backgroundColor: Colors.white,
        //           foregroundColor: Colors.black,
        //           padding:
        //               const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(8),
        //           ),
        //         ),
        //         onPressed: () {},
        //         child: Text(
        //           buttonText,
        //           style: TextStyle(
        //             fontSize: 16,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),

        );
  }
}
