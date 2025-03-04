import 'dart:developer';
import 'package:first_trial/widgets/generic-Textfield.dart';
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
      backgroundColor: const Color.fromARGB(255, 168, 225, 253),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    height: 65,
                    width: 330,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomTextField(
                        controller: _nameController,
                        isVisible: true,
                        isPassword: false,
                        hintText: 'Enter your name',
                      ),
                    ))),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: _validateAndSubmit,
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
            ),
          ],
        ),
      ),
    );
  }
}
