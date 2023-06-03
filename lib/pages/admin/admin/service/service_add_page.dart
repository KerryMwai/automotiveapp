import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/widgets/custom_button.dart';
import 'package:automotiveapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.go("/service_management");}, icon:const Icon(Icons.arrow_back_ios),),
        title: const Text("Add Service"),
        centerTitle: true,
        backgroundColor: blackfade,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              width: size.width,
              height: size.width*0.3,
              child: const Image(image: NetworkImage("https://cdn.pixabay.com/photo/2019/04/02/10/58/oldtimer-4097480_640.jpg")),
            ),
            const SizedBox(height: 20,),
            CustomTextField2(size: size, inputController: nameController, obsecureText: false, labeltext: "Service name"),
            const SizedBox(height: 30,),
            CustomButton(titleText: "Add Service", onPressed: (){})
          ],
        ),
      ),
    );
  }
}