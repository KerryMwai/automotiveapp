import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/app_infor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(rentCars.length, (index) {
          return Container(
            margin: const EdgeInsets.only(left: 5, top: 10, right: 5),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: blackfade, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image:  DecorationImage(
                        image: AssetImage(rentCars[index]['image']),
                        fit: BoxFit.contain,
                      )),
                ),
                const SizedBox(
                  height: 5,
                ),
                 Text(
                  rentCars[index]['name'],
                  style:const TextStyle(
                      color: white,
                      fontFamily: "Roboto",
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.airline_seat_recline_extra,
                      color: white.withOpacity(0.5),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${rentCars[index]['seats']} Seat",
                      style: TextStyle(
                          color: white.withOpacity(0.6), fontSize: 18),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                         Text(
                          "\$${rentCars[index]['price']}",
                          style: const TextStyle(
                              color: white,
                              fontFamily: "Roboto",
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "/D",
                          style: TextStyle(
                              color: white.withOpacity(0.5),
                              fontFamily: "Roboto",
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: ()=>context.go("/RentCarDetail"),
                      child: const Icon(
                        LineIcons.arrowRight,
                        size: 35,
                        color: orange,
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
