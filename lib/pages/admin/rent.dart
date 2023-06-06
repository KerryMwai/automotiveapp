import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/rental_model.dart';
import 'package:automotiveapp/pages/tabs/custom_drawer.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RentManagerPage extends StatefulWidget {
  const RentManagerPage({super.key});

  @override
  State<RentManagerPage> createState() => _RentManagerPageState();
}

class _RentManagerPageState extends State<RentManagerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: blackfade,
          title: const Text("Car Rent Manager"),
          centerTitle: true,
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      context.go("/add_car");
                    },
                    child: const Text(
                      "Add car",
                      style: TextStyle(fontSize: 18),
                    )))
          ],
        ),
        drawer: const CustomDrawer(),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseStorageApis().fetchAllRentalCars(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }

              if (snapshot.hasData) {
                final rentalCars = snapshot.data!.docs;
                return ListView(
                  children: List.generate(rentalCars.length, (index) {
                    final car = rentalCars[index];

                    return Card(
                      margin: const EdgeInsets.all(10),
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(car['url']),
                                          fit: BoxFit.cover)),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                final String name = car['name'];
                                                final String seats =
                                                    car['seats'].toString();
                                                final String price =
                                                    car['price'].toString();
                                                nameController.text = name;
                                                seatsController.text = seats;
                                                priceController.text = price;
                                                return AlertDialog(
                                                  title: const Text(
                                                      "Update Rental Car"),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  18.0),
                                                          child: TextField(
                                                            controller: null,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(18.0),
                                                          child: TextField(
                                                            controller:
                                                                nameController,
                                                            decoration:
                                                                const InputDecoration(
                                                                    hintText:
                                                                        "Name"),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(18.0),
                                                          child: TextField(
                                                            controller:
                                                                seatsController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText: "Seats",
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(18.0),
                                                          child: TextField(
                                                            controller:
                                                                priceController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText: "Price",
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                            "Cancel")),
                                                    ElevatedButton(
                                                        onPressed: () {
                                                          FirebaseStorageApis()
                                                              .updateCar(
                                                                  car.id,
                                                                  RentalModel(
                                                                      name: nameController
                                                                          .text,
                                                                      seats: int.parse(
                                                                          seatsController
                                                                              .text),
                                                                      price: double.parse(
                                                                          priceController
                                                                              .text),
                                                                      url:
                                                                          "https://cdn.pixabay.com/photo/2017/03/27/14/56/auto-2179220_1280.jpg",
                                                                      imageName:
                                                                          "ferrari-demo.jpg"))
                                                              .then((value) => {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(const SnackBar(
                                                                            content:
                                                                                Text("Car updated successfully")))
                                                                  }).then((value) => Navigator.pop(context));
                                                        },
                                                        child: const Text(
                                                            "Update")),
                                                  ],
                                                );
                                              });
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          FirebaseStorageApis()
                                              .deleteRentingDocument(car.id)
                                              .then((value) => ScaffoldMessenger
                                                      .of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          "Deleted successfully"))));
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      car['name'],
                                      style: const TextStyle(
                                          color: black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                            Icons.airline_seat_recline_extra),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${car['seats']} seats",
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "\$ ${car['price']}",
                                  style: const TextStyle(
                                      color: black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }
              return const Center(
                child: Text(
                  "Something went wrong",
                  style: TextStyle(
                      color: Colors.red, fontSize: 20, letterSpacing: 2),
                ),
              );
            }));
  }
}
