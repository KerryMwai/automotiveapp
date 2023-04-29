import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  CustomButton({super.key, required this.titleText, required this.onPressed});

  String titleText;
  Function onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onPressed;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.only(bottom: 15, left: 30, right: 30),
        // width: size.width*0.6,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(20), color: blue),
        child: Center(
          child: Text(
            widget.titleText,
            style: const TextStyle(
                color: white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
