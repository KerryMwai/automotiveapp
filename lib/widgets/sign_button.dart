import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  const SignButton({super.key, required this.buttonText});
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: size.width * 0.3,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [btncolor1, btncolor2, btncolor3, btncolor4],
          ),
          borderRadius: BorderRadius.circular(10)),
      child:  Center(
        child: Text(
          buttonText,
          style: const TextStyle(
              color: white,
              fontSize: 18,
              letterSpacing: 1.5,
              fontFamily: "Roboto"),
        ),
      ),
    );
  }
}
