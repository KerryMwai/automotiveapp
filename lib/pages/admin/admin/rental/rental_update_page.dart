import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/rental_model.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:automotiveapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UpdateRentalCar extends StatefulWidget {

  const UpdateRentalCar({super.key,required this.id, required this.name, required this.seats, required this.price});
  final String id;
  final String name;
  final int seats;
  final double price;
  @override
  State<UpdateRentalCar> createState() => _UpdateRentalCarState();
}

class _UpdateRentalCarState extends State<UpdateRentalCar> {
  TextEditingController nameController=TextEditingController();
  TextEditingController seatsController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text=widget.name;
    seatsController.text=widget.seats.toString();
    priceController.text=widget.price.toString();
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.go("/rent_management");
        }, icon:const Icon(Icons.arrow_back_ios)),
        title: const Text("Update Car Details"),
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
            CustomTextField2(size: size, inputController: seatsController, obsecureText: false, labeltext: "Number of seats"),
            const SizedBox(height: 20,),
            CustomTextField2(size: size, inputController: priceController, obsecureText: false, labeltext: "Rental price"),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
               FirebaseStorageApis().updateCar(widget.id,RentalModel(
                      name: nameController.text,
                      seats: int.parse(seatsController.text),
                      price: double.parse(priceController.text),
                      url: "https://cdn.pixabay.com/photo/2017/03/27/14/56/auto-2179220_1280.jpg",
                      imageName: "ferrari-demo.jpg"))
                      .then((value) => {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Car updated successfully")))
                          });
            }, child: const Row(children: [
              Text("Update car"),
              SizedBox(width: 10,),
              Icon(Icons.edit, color: Colors.green,)
            ],))
          ],
        ),
      ),
    );
  }
}