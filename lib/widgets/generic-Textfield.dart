import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final bool isVisible;
  final VoidCallback? toggleVisibility;

  CustomTextField({
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.isVisible = true,
    this.toggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            controller: controller,
            obscureText: isPassword ? isVisible : false,
            decoration: InputDecoration(
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black54,
                      ),
                      onPressed: toggleVisibility,
                    )
                  : null,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: const Color.fromARGB(255, 121, 116, 116),
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
