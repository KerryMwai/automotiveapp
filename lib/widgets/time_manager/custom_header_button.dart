import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonHeaderWidget extends StatefulWidget {
  const ButtonHeaderWidget(
      {super.key,
      required this.title,
      required this.text,
      required this.onClicked});
  final String title;
  final String text;
  final VoidCallback onClicked;

  @override
  State<ButtonHeaderWidget> createState() => _ButtonHeaderWidgetState();
}

class _ButtonHeaderWidgetState extends State<ButtonHeaderWidget> {
  @override
  Widget build(BuildContext context) => HeaderWidget(
      title: widget.title,
      child: ButtonWidget(text: widget.text, onClicked: widget.onClicked));
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.text, required this.onClicked});
  final String text;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: onClicked,
      style:const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.only(left:10 , right: 10, top: 10, bottom: 10)),
        backgroundColor:MaterialStatePropertyAll(white)
      ),
      child: FittedBox(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20, color: black, fontWeight: FontWeight.w500),
        ),
      ));
}
}


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: white),),
        const SizedBox(height: 15,),
        child
      ],
    );
  }
}