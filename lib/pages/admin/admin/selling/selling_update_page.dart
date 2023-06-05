import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/selling_model.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:automotiveapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdateSellingPart extends StatefulWidget {
  const UpdateSellingPart({super.key, required this.id, required this.name, required this.price, required this.rate});
  final String id;
  final String name;
  final double price;
  final double rate;
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
    nameController.text=widget.name;
    rateController.text=widget.rate.toString();
    priceController.text=widget.price.toString();
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
           ElevatedButton(onPressed: (){
            FirebaseStorageApis().updateProduct(widget.id, SellingModel(name: widget.name, price: double.parse(priceController.text), rate:double.parse(rateController.text), url:"https://cdn.pixabay.com/photo/2017/09/22/00/11/spare-parts-2774041_640.jpg" , imageName: "product-demo.png"));
           }, child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Update Sell"),
              SizedBox(width: 10,),
              Icon(Icons.edit)
            ],
           ))
          ],
        ),
      ),
    );
  }
}