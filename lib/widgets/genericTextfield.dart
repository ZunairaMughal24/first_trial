import 'package:flutter/material.dart';

class Generictextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  //  final String LabelText;
  final bool isPassword;
  final IconData? icon;
  final TextInputType keyboardType;
  final VoidCallback? onSubmitted;
  final String? errorText; // ✅ Added for validation errors
  final FocusNode? focusNode; // ✅ Added for managing focus state
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  Generictextfield(
      {required this.controller,
      required this.hintText,
      // required this.LabelText,
      this.isPassword = false,
      this.icon,
      this.keyboardType = TextInputType.text,
      this.onSubmitted,
      this.textInputAction,
      this.errorText,
      this.focusNode,
      this.onChanged});

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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey,
            border: Border.all(
              color: widget.errorText != null
                  ? Colors.red
                  : Colors.transparent, // ✅ Red border on error
              width: 1.5,
            ),
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
              focusNode: widget.focusNode, // ✅ Assigning focus node
              onChanged: widget.onChanged,
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
        ),
        if (widget.errorText !=
            null) // ✅ Show error message only if it's not null
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Text(
              widget.errorText!,
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
      ],
    );
  }
}
