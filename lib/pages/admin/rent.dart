import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/pages/admin/admin/rental/rental_update_page.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdateRentalCar(
                                                          id: car.id,
                                                          name: car['name'],
                                                          seats: car['seats'],
                                                          price:
                                                              car['price'])));
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
