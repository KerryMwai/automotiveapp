import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 15.0),
      padding: const EdgeInsets.only(right: 5, top: 10, bottom: 10, left: 5),
      decoration: BoxDecoration(
          color: blackfade.withOpacity(0.3),
          border: Border.all(color: white.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image and name and the price
          Row(
            children: [
              Container(
                
                width: widget.size.width * 0.2,
                height: widget.size.width * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: white,
                    image: const DecorationImage(
                        image: AssetImage("assets/images/pistonring.jpg"), fit: BoxFit.contain)),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: widget.size.width * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Piston ring",
                      style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Roboto",
                          letterSpacing: 1.2),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$120",
                      style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontSize: 18,
                          fontFamily: "Roboto",
                          letterSpacing: 1.2),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: widget.size.width * 0.38,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove,
                      color: white.withOpacity(0.6),
                    )),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: pink, borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      "15",
                      style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: white.withOpacity(0.6),
                    )),
              ],
            )),
          )
        ],
      ),
    );
  }
}
