import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.size,
    required this.label,
    required this.controllerinputText,
  });

  final Size size;
  final String label;
  final TextEditingController controllerinputText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
      width: size.width - 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const  TextStyle(
                color: white,
                fontSize: 18,
                fontFamily: "Roboto",
                letterSpacing: 1.3),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: white.withOpacity(0.6))),
            child: TextField(
              controller: controllerinputText,
              cursorColor: white.withOpacity(0.7),
              style: TextStyle(
                  color: white.withOpacity(0.6),
                  fontSize: 18,
                  fontFamily: "Roboto",
                  letterSpacing: 1.2),
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}
