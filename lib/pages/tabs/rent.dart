import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  late Future<List<FirebaseFile>> serviceImages;

  @override
  void initState() {
    super.initState();
    serviceImages = FirebaseStorageApis.fetchAllrentalCarsImages();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
            final cars = snapshot.data!.docs;

            return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(cars.length, (index) {
                  final car= cars[index];
                  return Container(
                    margin: const EdgeInsets.only(left: 5, top: 10, right: 5),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: blackfade,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(car['url']),
                                fit: BoxFit.contain,
                              )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                         Text(
                          car['name'],
                          style: const TextStyle(
                              color: white,
                              fontFamily: "Roboto",
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.airline_seat_recline_extra,
                              color: white.withOpacity(0.5),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              car['seats'].toString(),
                              style: TextStyle(
                                  color: white.withOpacity(0.6), fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$ ${car['price']}",
                                  style: const TextStyle(
                                      color: white,
                                      fontFamily: "Roboto",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "/D",
                                  style: TextStyle(
                                      color: white.withOpacity(0.5),
                                      fontFamily: "Roboto",
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => context.go("/RentCarDetail"),
                              child: const Icon(
                                LineIcons.arrowRight,
                                size: 35,
                                color: orange,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }));
          }
          return const Center(
            child: Text(
              "Something went wrong while fetching the data",
              style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          );
        });
  }
}
