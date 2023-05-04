import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: white,
          fontSize: 25,
          fontFamily: "RobotoLight",
          fontWeight: FontWeight.w600,
          height: 1.6,
          letterSpacing: 2.0),
    );
  }
}
