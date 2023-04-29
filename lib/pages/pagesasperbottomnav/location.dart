import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/GoogleMapTA.jpg"),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            height: 60,
            width: size.width - 30,
            decoration: BoxDecoration(
                color: blackfade, borderRadius: BorderRadius.circular(30)),
            child: TextField(
              style: TextStyle(
                color: white.withOpacity(0.6),
                fontSize: 17,
                fontFamily: "RobotoLight",
                letterSpacing: 1.5,
                
              ),
              cursorColor: white.withOpacity(0.6),
              decoration: InputDecoration(
                prefixIcon:Icon(LineIcons.search, color: white.withOpacity(0.8), size: 30),
                suffixIcon:const  Icon(Icons.zoom_in_map_outlined, color: orange,),
                hintStyle: TextStyle(
                    color: white.withOpacity(0.5),
                    fontSize: 18,
                    fontFamily: "Roboto"),
                border: InputBorder.none,
                hintText: "Search",
              ),
            ),
          )
        ],
      ),
    ));
  }
}
