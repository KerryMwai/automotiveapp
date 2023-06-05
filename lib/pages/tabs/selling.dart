import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

class SellingPage extends StatefulWidget {
  const SellingPage({super.key});

  @override
  State<SellingPage> createState() => _SellingPageState();
}

class _SellingPageState extends State<SellingPage> {
  late Future<List<FirebaseFile>> services;
  @override
  void initState() {
    super.initState();
    services = FirebaseStorageApis.fetchAllrentalSellingmages();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseStorageApis().fetchAllSellItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          }

          if (snapshot.hasData) {
            final sellItems = snapshot.data!.docs;
            return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(sellItems.length, (index) {
                  final sellItem=sellItems[index];
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
                          margin: const EdgeInsets.only(left: 20),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(sellItem['url']),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: orange,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${sellItem['rates']}",
                              style: TextStyle(
                                  color: white.withOpacity(0.6), fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                         Text(
                          sellItem['name'],
                          style: const TextStyle(
                              color: white, fontFamily: "Roboto", fontSize: 19),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                              "\$ ${sellItem['price']}",
                              style:  const TextStyle(
                                  color: white,
                                  fontFamily: "Roboto",
                                  fontSize: 19),
                            ),
                            GestureDetector(
                              onTap: () => context.go("/cart"),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: pink),
                                child: const Center(
                                  child: Icon(
                                    LineIcons.plus,
                                    color: white,
                                  ),
                                ),
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
