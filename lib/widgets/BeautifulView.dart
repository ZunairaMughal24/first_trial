import 'dart:developer';

import 'package:first_trial/widgets/generic-%20textfield.dart';
import 'package:first_trial/widgets/generic-textButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BeautifulView extends StatefulWidget {
  @override
  State<BeautifulView> createState() => _BeautifulViewState();
}

class _BeautifulViewState extends State<BeautifulView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isVisible = true;

  void _validateAndSubmit() {
    log(" Validate and Submit Called");
    String name = _nameController.text.trim();
    String password = _passwordController.text.trim();

    log("Name Entered: $name");
    log("Password Entered: $password");

    if (name.isEmpty || password.isEmpty) {
      log("Fields cannot be empty!");
      Fluttertoast.showToast(
        msg: "Fields cannot be empty!",
        backgroundColor: const Color.fromARGB(255, 157, 173, 5),
        gravity: ToastGravity.TOP,
      );
      return;
    }

    // Validate name (allow spaces but no special characters)
    if (RegExp(r'[^a-zA-Z0-9 ]').hasMatch(name)) {
      log("Name contains special characters!");
      Fluttertoast.showToast(
        msg: "Special characters are not allowed in Name!",
        backgroundColor: Colors.red,
        gravity: ToastGravity.TOP,
      );
      return;
    }

    // Validate password (only on submission)
    if (password.length < 8) {
      log("Password too short!");
      Fluttertoast.showToast(
        msg: "Password too short!",
        backgroundColor: Colors.orange,
        gravity: ToastGravity.TOP,
      );
      return;
    }

    Fluttertoast.showToast(
      msg: "Successfully Submitted",
      backgroundColor: Colors.green,
      gravity: ToastGravity.TOP,
    );

    log("Final Submitted Name: $name");
    log("Final Submitted Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Generictextfield(
              controller: _nameController,
              isPassword: false,
              hintText: "Enter Name",
            ),
            SizedBox(height: 15),
            Generictextfield(
              controller: _passwordController,
              isPassword: true,
              hintText: "Enter your password",
            ),
            SizedBox(height: 60),
            GenericTextButton(text: "Submit", onPressed: _validateAndSubmit)
          ],
        ),
      ),
    );
  }
}
