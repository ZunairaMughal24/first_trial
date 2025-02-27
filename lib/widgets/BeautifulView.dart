import 'package:flutter/material.dart';

class BeautifulView extends StatelessWidget {
  final String title;
  final Color color;
  final double size;

  const BeautifulView({
    required this.title,
    required this.color,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: color,
      child: Text(
        title,
        style: TextStyle(fontSize: size, color: Colors.white),
      ),
    );
  }
}
