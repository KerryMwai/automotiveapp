import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavButton extends StatefulWidget {
  IconData icon;
  String title;
  bool isActive;
  NavButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.isActive});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      decoration: BoxDecoration(
          color: widget.isActive ? blue : transparent,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            widget.isActive ? widget.title : "",
            style: const TextStyle(color: white),
          )
        ],
      ),
    );
  }
}
