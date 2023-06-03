import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/widgets/custom_button.dart';
import 'package:automotiveapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdateSellingPart extends StatefulWidget {
  const UpdateSellingPart({super.key});

  @override
  State<UpdateSellingPart> createState() => _UpdateSellingPartState();
}

class _UpdateSellingPartState extends State<UpdateSellingPart> {
  TextEditingController nameController=TextEditingController();
  TextEditingController rateController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.go("/selling_management");
        }, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Update Product"),
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
              child: const Image(image: NetworkImage("https://cdn.pixabay.com/photo/2014/09/07/22/34/car-race-438467_1280.jpg")),
            ),
            const SizedBox(height: 20,),
            CustomTextField2(size: size, inputController: nameController, obsecureText: false, labeltext: "Model name"),
            const SizedBox(height: 20,),
            CustomTextField2(size: size, inputController: rateController, obsecureText: false, labeltext: "Number of stars"),
            const SizedBox(height: 20,),
            CustomTextField2(size: size, inputController: priceController, obsecureText: false, labeltext: "Rental price"),
            const SizedBox(height: 30,),
            CustomButton(titleText: "Update Product", onPressed: (){})
          ],
        ),
      ),
    );
  }
}