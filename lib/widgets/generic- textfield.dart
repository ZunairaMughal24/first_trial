import 'package:flutter/material.dart';

class Generictextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final VoidCallback? onSubmitted;
  final VoidCallback? onKeyboardClick;
  Generictextfield(
      {required this.controller,
      required this.hintText,
      this.isPassword = false,
      this.focusNode,
      this.nextFocusNode,
      this.onSubmitted,
      this.onKeyboardClick});

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
            controller: widget.controller,
            focusNode: widget.focusNode,
            obscureText: widget.isPassword ? isVisible : false,
            textInputAction:
                widget.isPassword ? TextInputAction.done : TextInputAction.next,

            // When "Enter" is pressed
            onSubmitted: (value) {
              if (widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              } else if (widget.onSubmitted != null) {
                widget.onSubmitted!();
              }
            },
            onTap: () {
              if (widget.onKeyboardClick != null) {
                widget.onKeyboardClick!();
              }
            },
           

            decoration: InputDecoration(
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
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 121, 116, 116),
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
