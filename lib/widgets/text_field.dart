import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2(
      {super.key,
      required this.size,
      required this.inputController,
      required this.obsecureText,
      required this.labeltext});

  final Size size;
  final TextEditingController inputController;
  final bool obsecureText;
  final String labeltext;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 15),
      width: size.width,
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            width: 1,
            color: brown.withOpacity(0.4),
          ),
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: inputController,
        cursorColor: brown,
        style: TextStyle(
          color: brown.withOpacity(0.4),
          fontSize: 18,
          letterSpacing: 1.2,
        ),
        obscureText: obsecureText,
        decoration: InputDecoration(
            border: InputBorder.none,
            label: Text(
              labeltext,
              style: TextStyle(
                  color: brown.withOpacity(0.4),
                  fontSize: 18,
                  letterSpacing: 1.2),
            )),
      ),
    );
  }
}
