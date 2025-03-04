import 'dart:developer';
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
        gravity: ToastGravity.Top,
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
                height: 50,
                   width: 330,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 121, 116, 116),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
                height: 50,
                   width: 330,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: isVisible,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisible ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      border: InputBorder.none,
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 121, 116, 116),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60),
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
