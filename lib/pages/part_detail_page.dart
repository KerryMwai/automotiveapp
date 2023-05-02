import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PartDetailPage extends StatefulWidget {
  const PartDetailPage({super.key});

  @override
  State<PartDetailPage> createState() => _PartDetailPageState();
}

class _PartDetailPageState extends State<PartDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white.withOpacity(0.4),
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.45,
            child: Center(
              child: Container(
                width: size.width * 0.6,
                height: size.width * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/pistonring.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: size.width,
              decoration: BoxDecoration(
                  color: black.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    width: size.width,
                      top: -65,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: size.width * 0.35,
                          height: size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 30,
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: black),
                                    child: const Center(
                                      child: Text(
                                        "1",
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Roboto"),
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.remove,
                                    size: 30,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: "Roboto"),
                                    ),
                                    Text(
                                      "\$120",
                                      style: TextStyle(
                                          fontSize: 18, fontFamily: "Roboto"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Carl Kia Motors",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto",
                            color: white.withOpacity(0.9)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Roboto",
                                  color: white.withOpacity(0.9)),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: orange,
                                ),
                                Text(
                                  "4.9 Review",
                                  style: TextStyle(
                                      color: white.withOpacity(0.6),
                                      fontSize: 18),
                                )
                              ],
                            )
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: size.height * 0.13,
                        child: Text(
                          "The piston rings prevent leakage of gas pressure from the combustion chamber and reduce to a minimum the seepage of oil...",
                          style: TextStyle(
                              fontSize: 18, color: white.withOpacity(0.6)),
                        ),
                      ),
                        const SizedBox(
                        height: 60,
                      ),
                      CustomButton(titleText: "Buy Now", onPressed: (){})
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
