import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/widgets/custom_button.dart';
import 'package:automotiveapp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    firstName.text = "First";
    lastName.text="Last";
    email.text="firstlast@test.com";
    location.text="Kenya, Nairobi";
    return Scaffold(
      backgroundColor: black,
      body: ListView(
        children: [
          Container(
              height: size.height * 0.3,
              width: size.width,
              color: pink,
              child: Stack(clipBehavior: Clip.none, children: [
                Positioned(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30, left: 20),
                    width: size.width * 0.57,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              LineIcons.arrowLeft,
                              color: white,
                              size: 30,
                            )),
                        const Text(
                          "Edit Profile",
                          style: TextStyle(
                              color: white,
                              fontFamily: "Roboto",
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  width: size.width,
                  bottom: -(size.width * 0.15),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: white),
// pprofile image
                      child: Stack(clipBehavior: Clip.none, children: [
                        Container(
                          width: size.width * 0.3,
                          height: size.width * 0.3,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: blackfade,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/profile.jpg"))),
                        ),
// Uploading profile image
                        Positioned(
                            right: -8,
                            bottom: -8,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: white),
                                child: const Center(
                                    child: Icon(Icons.camera_enhance)),
                              ),
                            ))
                      ]),
                    ),
                  ),
                )
              ])),
          const SizedBox(
            height: 40,
          ),
// Inputing you details ie name, email, location
          CustomTextField(size: size,label: "First Name", controllerinputText: firstName),
          const SizedBox(height: 10,),
          CustomTextField(size: size,label: "Last Name", controllerinputText: lastName),
           const SizedBox(height: 10,),
          CustomTextField(size: size,label: "Email", controllerinputText: email),
           const SizedBox(height: 10,),
          CustomTextField(size: size,label: "Location", controllerinputText: location),
          const SizedBox(height: 10,),
          CustomButton(titleText: "Save", onPressed: (){})
        ],
      ),
    );
  }
}
