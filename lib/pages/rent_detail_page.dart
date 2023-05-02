import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';

class RentDetailPage extends StatefulWidget {
  const RentDetailPage({super.key});

  @override
  State<RentDetailPage> createState() => _RentDetailPageState();
}

class _RentDetailPageState extends State<RentDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0.0,
        title: const Text(
          "Rent Details",
          style: TextStyle(color: white),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.32,
                width: size.width,
                child: Column(children: [
                  Container(
                    width: size.width * 0.45,
                    height: size.width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/car40.png"))),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: white, shape: BoxShape.circle),
                    child: const Center(child: Icon(Icons.refresh)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(10, (index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 15.0),
                          width: size.width * 0.3,
                          height: size.width * 0.15,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/car21.png"))),
                        );
                      }),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Volvo C40 Recharge",
                    style: TextStyle(
                        color: white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Roboto"),
                  ),
                  SizedBox(
                    width: 50,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: orange,
                        ),
                        Text(
                          "4.9",
                          style: TextStyle(
                              color: white.withOpacity(0.6), fontSize: 18),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: white.withOpacity(0.6),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "1605K User",
                    style:
                        TextStyle(color: white.withOpacity(0.5), fontSize: 18),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * 0.13,
                child: Text(
                  "Volvo C40 Recharge: Discover our first pure electric crossover with leather free interrior & Google built-in",
                  style: TextStyle(fontSize: 18, color: white.withOpacity(0.8)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Model Details",
                style: TextStyle(
                    color: white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Roboto"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Rear",
                          style: TextStyle(
                            color: white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "38.4 in",
                          style: TextStyle(
                              color: white.withOpacity(0.8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Seats",
                          style: TextStyle(
                            color: white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "5",
                          style: TextStyle(
                              color: white.withOpacity(0.8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Length",
                          style: TextStyle(
                            color: white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "174.8 in",
                          style: TextStyle(
                              color: white.withOpacity(0.8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                            color: white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "62 in",
                          style: TextStyle(
                              color: white.withOpacity(0.8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 15),
        width: size.width,
        height: 90,
        color: blackfade.withOpacity(0.6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "\$400/h",
                  style: TextStyle(
                      color: white.withOpacity(0.7),
                      fontSize: 21,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Container(
              margin:const EdgeInsets.only(bottom: 20, top: 5),
              width: size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: blue),
              child: const Center(
                child: Text(
                  "Book Now",
                  style: TextStyle(
                      color: white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Roboto"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
