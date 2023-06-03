import 'package:automotiveapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: black,
      width: size.width * 0.6,
      child: ListView(
        children: [
          DrawerHeader(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.purpleAccent, shape: BoxShape.circle),
              ),
            ],
          )),
          const Divider(
            height: 6,
            color: Colors.grey,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {},
              child:  Row(
                children: const [
                  Icon(Icons.person, color: white,),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, letterSpacing: 1.6),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                context.go("/Home");
              },
              child:  Row(
                children: const[
                  Icon(Icons.home, color: white,),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, letterSpacing: 1.6),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                context.go("/service_management");
              },
              child:  Row(
                children:const [
                  Icon(Icons.credit_card, color: white,),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Manage service",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, letterSpacing: 1.6),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                context.go("/rent_management");
              },
              child:  Row(
                children: const[
                  Icon(Icons.car_rental, color: white,),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Manage rent",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, letterSpacing: 1.6),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                context.go("/selling_management");
              },
              child:  Row(
                children:const [
                  Icon(Icons.credit_score, color: white,),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Manage selling",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, letterSpacing: 1.6),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {

                context.go("/");
              },
              child:  Row(
                children: const[
                  Icon(Icons.logout, color: white,),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.grey, fontSize: 18, letterSpacing: 1.6),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
