// import 'package:flutter/material.dart';

// class BeautifulView extends StatelessWidget {
//   final String title;
//   final Color? color;
//   final double? size;
//   final double? borderRadius;
//   final EdgeInsets? padding;
//   final String fontFamily;

//   const BeautifulView({
//     required this.title,
//     this.color = Colors.blue,
//     this.size,
//     this.borderRadius,
//     this.padding,
//     this.fontFamily = "sana",
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: padding ?? EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color.fromARGB(255, 129, 109, 109),
//         borderRadius: BorderRadius.circular(borderRadius ?? 0),
//       ),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: size ?? 16,
//           color: Colors.black,
//           fontFamily: fontFamily,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class BeautifulView extends StatelessWidget {
  final String title;
  final String color;
  final String size;
  final String borderRadius;
  final String padding;
  final String fontFamily;
  final String buttonText;

  const BeautifulView({
    required this.title,
    required this.buttonText,
    this.color = "Blue",
    this.size = "16",
    this.borderRadius = "12",
    this.padding = "16",
    this.fontFamily = "sana",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(double.tryParse(padding) ?? 16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 175, 161, 161),
            borderRadius:
                BorderRadius.circular(double.tryParse(borderRadius) ?? 12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
