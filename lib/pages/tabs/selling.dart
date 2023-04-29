import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SellingPage extends StatefulWidget {
  const SellingPage({super.key});

  @override
  State<SellingPage> createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(10, (index) {
          return Container(
            margin: const EdgeInsets.only(left: 5, top: 10, right: 5),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: blackfade, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/brake2.jpg"),
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: orange,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(
                          color: white.withOpacity(0.6), fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Brake pad",
                  style: TextStyle(
                      color: white, fontFamily: "Roboto", fontSize: 19),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "\$120",
                      style: TextStyle(
                          color: white, fontFamily: "Roboto", fontSize: 19),
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: pink),
                      child: const Center(
                        child: Icon(
                          LineIcons.plus,
                          color: white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }));
  }
}
