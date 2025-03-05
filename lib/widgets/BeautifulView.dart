import 'dart:developer';

import 'package:first_trial/widgets/genericTextfield.dart';
import 'package:first_trial/widgets/genericTextButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BeautifulView extends StatefulWidget {
  @override
  State<BeautifulView> createState() => _BeautifulViewState();
}

class _BeautifulViewState extends State<BeautifulView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _nameFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  bool isVisible = true;

  void _validateAndSubmit() {
    log(" Validate and Submit Called");
    String email = _emailController.text.trim();
    String name = _nameController.text.trim();
    String password = _passwordController.text.trim();
    log("Name Entered: $email");
    log("Name Entered: $name");
    log("Password Entered: $password");

    if (name.isEmpty || password.isEmpty || email.isEmpty) {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft, // Aligns text to the right
              child: Text(
                "Email",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 6, 30, 82),
                ),
              ),
            ),
            SizedBox(height: 5),
            Generictextfield(
              controller: _emailController,
              icon: Icons.email,
              // Move focus to password field

              isPassword: false,
              textInputAction: TextInputAction.next,
              hintText: "Enter email",
              // LabelText: "Email",
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: const Color.fromARGB(255, 6, 30, 82),
              ),
            ),
            SizedBox(height: 5),
            Generictextfield(
              icon: Icons.person,
              controller: _nameController,
              // Move focus to password field

              isPassword: false,
              textInputAction: TextInputAction.next,
              hintText: "Enter Name",
              // LabelText: "Name",
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 10),
            Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: const Color.fromARGB(255, 6, 30, 82),
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 5),
            Generictextfield(
              controller: _passwordController,
              isPassword: true,
              hintText: "Enter your password",
              icon: Icons.lock,
              // LabelText: "password",
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,

              onSubmitted: _validateAndSubmit, // Call validation on Enter
            ),
            SizedBox(height: 60),
            GenericTextButton(text: "Submit", onPressed: _validateAndSubmit)
          ],
        ),
      ),
    );
  }
}
