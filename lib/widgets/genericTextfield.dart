import 'package:flutter/material.dart';

class Generictextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  //  final String LabelText;
  final bool isPassword;
  final IconData? icon;
  final TextInputType keyboardType;
  final VoidCallback? onSubmitted;

  final TextInputAction? textInputAction;
  Generictextfield(
      {required this.controller,
      required this.hintText,
      // required this.LabelText,
      this.isPassword = false,
      this.icon,
      this.keyboardType = TextInputType.text,
      this.onSubmitted,
      this.textInputAction});

  @override
  State<Generictextfield> createState() => _GenerictextfieldState();
}

class _GenerictextfieldState extends State<Generictextfield> {
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    isVisible =
        widget.isPassword; // Initialize visibility based on password field
  }

  void _toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey,
      ),
      height: 50,
      width: 330,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? isVisible : false,
          textInputAction: widget.textInputAction,
          decoration: InputDecoration(
            icon: widget.icon != null
                ? Icon(
                    widget.icon,
                    color: const Color.fromARGB(255, 6, 30, 82),
                  ) // Icon on the left
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black54,
                    ),
                    onPressed: _toggleVisibility,
                  )
                : null,
            border: InputBorder.none,
// labelText: widget.LabelText,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 121, 116, 116),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
