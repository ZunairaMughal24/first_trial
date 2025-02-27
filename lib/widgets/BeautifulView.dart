import 'package:flutter/material.dart';

class BeautifulView extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final double? borderRadius;
  final EdgeInsets? padding;
  final String fontFamily;

  const BeautifulView({
    required this.title,
    this.color = Colors.blue,
    this.size,
    this.borderRadius,
    this.padding,
    this.fontFamily = "Arial",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: size ?? 18,
          color: Colors.black,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
