import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/app_infor.dart';
import 'package:automotiveapp/pages/logout.dart';
import 'package:automotiveapp/pages/pagesasperbottomnav/help.dart';
import 'package:automotiveapp/pages/pagesasperbottomnav/home.dart';
import 'package:automotiveapp/pages/pagesasperbottomnav/location.dart';
import 'package:automotiveapp/pages/pagesasperbottomnav/profile.dart';
import 'package:automotiveapp/pages/tabs/custom_drawer.dart';
import 'package:automotiveapp/widgets/nav_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomActiveIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      drawer:const SafeArea(child:   CustomDrawer()),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: IndexedStack(
                index: bottomActiveIndex,
                children: const [Home(), LocationPage(), Help(), Profile(), LogoutPage()],
              ))),
      bottomNavigationBar: Container(
        width: size.width,
        height: 75.0,
        decoration: const BoxDecoration(
          color: blackfade,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(bottomNavInformation.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    bottomActiveIndex = index;
                  });
                },
                child: NavButton(
                    icon: bottomNavInformation[index]['icon'],
                    title: bottomNavInformation[index]['title'],
                    isActive: bottomActiveIndex == index),
              );
            }),
          ),
        ),
      ),
    );
  }
}
