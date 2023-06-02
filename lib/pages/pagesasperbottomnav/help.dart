import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/widgets/custom_button.dart';
import 'package:automotiveapp/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  TextEditingController fullName=TextEditingController();
  TextEditingController contact=TextEditingController();
  TextEditingController emailAddress=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController requestOrQuery=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0.0,
        title: const Text("Help", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: 2),),
        centerTitle: true,
      ),
      backgroundColor: black,
      
      body: SafeArea(child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: ListView(
          children: [
            CustomTextField(size: size, label: "Full name", controllerinputText: fullName),
            CustomTextField(size: size, label: "Contact", controllerinputText: contact),
            CustomTextField(size: size, label: "Email", controllerinputText: emailAddress),
            CustomTextField(size: size, label: "Location", controllerinputText: location),
            CustomTextField(size: size, label: "Your request or Enquiery", controllerinputText: requestOrQuery),
            const SizedBox(height: 20.0,),
            CustomButton(titleText: "Send", onPressed: (){
             
            })
          ],
        ),
      )),
    );
  }
}