//   void _validateAndSubmit() {
//     log(" Validate and Submit Called");
//     String email = _emailController.text.trim();
//     String name = _nameController.text.trim();
//     String password = _passwordController.text.trim();
//     log("Name Entered: $email");
//     log("Name Entered: $name");
//     log("Password Entered: $password");

//     if (name.isEmpty || password.isEmpty || email.isEmpty) {
//       log("Fields cannot be empty!");
//       Fluttertoast.showToast(
//         msg: "Fields cannot be empty!",
//         backgroundColor: const Color.fromARGB(255, 157, 173, 5),
//         gravity: ToastGravity.TOP,
//       );
//       return;
//     }

//     // Validate name (allow spaces but no special characters)
//     if (RegExp(r'[^a-zA-Z0-9 ]').hasMatch(name)) {
//       log("Name contains special characters!");
//       Fluttertoast.showToast(
//         msg: "Special characters are not allowed in Name!",
//         backgroundColor: Colors.red,
//         gravity: ToastGravity.TOP,
//       );
//       return;
//     }

//     // Validate password (only on submission)
//     if (password.length < 8) {
//       log("Password too short!");
//       Fluttertoast.showToast(
//         msg: "Password too short!",
//         backgroundColor: Colors.orange,
//         gravity: ToastGravity.TOP,
//       );
//       return;
//     }

//     Fluttertoast.showToast(
//       msg: "Successfully Submitted",
//       backgroundColor: Colors.green,
//       gravity: ToastGravity.TOP,
//     );

//     log("Final Submitted Name: $name");
//     log("Final Submitted Password: $password");
//   }

import 'dart:developer';
import 'package:first_trial/bloc/authBloc.dart';
import 'package:first_trial/bloc/events.dart';
import 'package:first_trial/bloc/states.dart';
import 'package:first_trial/screens/homeScreen.dart';
import 'package:first_trial/widgets/genericTextfield.dart';
import 'package:first_trial/widgets/genericTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BeautifulView extends StatefulWidget {
  @override
  State<BeautifulView> createState() => _BeautifulViewState();
}

class _BeautifulViewState extends State<BeautifulView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  String? emailError, nameError, passwordError;

  @override
  void initState() {
    super.initState();

    // Adding listeners to detect when a user leaves a field
    _emailFocus.addListener(() {
      if (!_emailFocus.hasFocus) _validateEmail();
    });
    _nameFocus.addListener(() {
      if (!_nameFocus.hasFocus) _validateName();
    });
    _passwordFocus.addListener(() {
      if (!_passwordFocus.hasFocus) _validatePassword();
    });
  }

  bool _isValidEmail(String email) {
    final emailRegExp =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return emailRegExp.hasMatch(email);
  }

  bool _isValidName(String name) {
    return !RegExp(r'[^a-zA-Z0-9 ]').hasMatch(name);
  }

  bool _isValidPassword(String password) {
    return password.length >= 8;
  }

  void _validateEmail() {
    setState(() {
      String email = _emailController.text.trim();
      emailError = email.isEmpty
          ? "Email cannot be empty"
          : (!_isValidEmail(email) ? "Enter a valid email address" : null);
    });
  }

  void _validateName() {
    setState(() {
      String name = _nameController.text.trim();
      nameError = name.isEmpty
          ? "Name cannot be empty"
          : (!_isValidName(name) ? "Special characters not allowed" : null);
    });
  }

  void _validatePassword() {
    setState(() {
      String password = _passwordController.text.trim();
      passwordError = password.isEmpty
          ? "Password cannot be empty"
          : (password.length < 8 ? "Password too short" : null);
    });
  }

  void _validateAndSubmit() {
    log("Validate and Submit Called");

    _validateEmail();
    _validateName();
    _validatePassword();

    if (emailError == null && nameError == null && passwordError == null) {
      FocusScope.of(context).unfocus();
      Fluttertoast.showToast(
        msg: "Successfully Submitted",
        backgroundColor: Colors.green,
        gravity: ToastGravity.TOP,
      );
      log("Final Submitted Email: ${_emailController.text}");
      log("Final Submitted Name: ${_nameController.text}");
      log("Final Submitted Password: ${_passwordController.text}");
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _nameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<Authbloc, AuthStates>(
            listener: (context, state) {
              if (state is AuthenticatedState) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
              if (state is FailureState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            }, // TODO: implement listener

            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Email Field
                  Text("Email",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 6, 30, 82))),
                  SizedBox(height: 5),
                  Generictextfield(
                    controller: _emailController,
                    focusNode: _emailFocus,
                    icon: Icons.email,
                    textInputAction: TextInputAction.next,
                    hintText: "Enter email",
                    errorText: emailError,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),

                  // Name Field
                  Text("Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 6, 30, 82))),
                  SizedBox(height: 5),
                  Generictextfield(
                    controller: _nameController,
                    focusNode: _nameFocus,
                    icon: Icons.person,
                    textInputAction: TextInputAction.next,
                    hintText: "Enter your name",
                    errorText: nameError,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 10),

                  // Password Field
                  Text("Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color.fromARGB(255, 6, 30, 82))),
                  SizedBox(height: 5),
                  Generictextfield(
                    controller: _passwordController,
                    focusNode: _passwordFocus,
                    isPassword: true,
                    hintText: "Enter your password",
                    icon: Icons.lock,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    errorText: passwordError,
                  ),
                  SizedBox(height: 60),

                  // Submit Button

                  GenericTextButton(
                    text: "Submit",
                    // onPressed: _validateAndSubmit,
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final name = _nameController.text;
                      context.read<Authbloc>().add(SignUpRequest(
                            email: email,
                            password: password,
                            name: name,
                          ));
                    },
                  ),
                  SizedBox(height: 20),
                  if (state is LoadingState)
                    Center(child: CircularProgressIndicator()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
