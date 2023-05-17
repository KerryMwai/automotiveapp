import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/app_infor.dart';
import 'package:automotiveapp/pages/tabs/rent.dart';
import 'package:automotiveapp/pages/tabs/selling.dart';
import 'package:automotiveapp/pages/tabs/service.dart';
import 'package:automotiveapp/widgets/tab_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
  Size size=MediaQuery.of(context).size;
    return ListView(
          children: [
            Container(
              width: size.width - 10,
              height: size.height * 0.34,
              decoration: BoxDecoration(
                  color: blackfade, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 14.0, top: 20),
                        margin: const EdgeInsets.all(15),
                        width: size.width - 15,
                        height: size.height * 0.171,
                        decoration: BoxDecoration(
                            color: pink,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "We provide",
                                style: TextStyle(
                                    color: white,
                                    fontFamily: "Roboto",
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "20% DISCOUNT",
                                style: TextStyle(
                                    color: white,
                                    fontFamily: "PhuduMedium",
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: size.width * 0.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children:  [
                                    const Text(
                                      "Explore Now",
                                      style:
                                          TextStyle(color: white, fontSize: 16),
                                    ),
                                    GestureDetector(
                                      onTap: ()=>context.go("/UploadFile"),
                                      child: const Icon(
                                        LineIcons.arrowCircleRight,
                                        color: white,
                                        size: 25,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: size.width * 0.368,
                            height: size.width * 0.368,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/ad.jpg"),
                                    fit: BoxFit.contain)),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                            List.generate(tabsInformation.length, (index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeIndex = index;
                                });
                              },
                              child: TabButton(
                                size: (size.width - 90) / 3,
                                title: tabsInformation[index]['title'],
                                icon: tabsInformation[index]['icon'],
                                color:
                                    activeIndex == index ? blue : transparent,
                              ));
                        })),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Text(
              pageTitles[activeIndex],
              style:const TextStyle(color: white, fontSize: 18, fontFamily: "Phudu"),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: size.height * 0.6,
              width: size.width - 10,
              child: IndexedStack(
                index: activeIndex,
                children: const [ServicesPage(), RentPage(), SellingPage()],
              ),
            )
          ],
        );
  }
}