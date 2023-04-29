import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabButton extends StatefulWidget {
  double size;
  String title;
  IconData icon;
  Color color;
  TabButton({super.key, required this.size, required this.title, required this.icon, required this.color});

  @override
  State<TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<TabButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
      width: widget.size,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children:  [
          Icon(
            widget.icon,
            color: white,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            widget.title,
            style:const TextStyle(color: white, fontFamily: "RobotoLight"),
          )
        ],
      ),
    );
  }
}
