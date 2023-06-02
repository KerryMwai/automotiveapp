import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:automotiveapp/pages/tabs/custom_drawer.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:flutter/material.dart';

class SellManagerPage extends StatefulWidget {
  const SellManagerPage({super.key});

  @override
  State<SellManagerPage> createState() => _SellManagerPageState();
}

class _SellManagerPageState extends State<SellManagerPage> {
  late Future<List<FirebaseFile>> sellings;
  @override
  void initState() {
    super.initState();
    sellings = FirebaseStorageApis.fetchAllrentalSellingmages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blackfade,
          title: const Text("Selling manager"),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Add product",
                      style: TextStyle(fontSize: 18),
                    )))
          ],
        ),
        drawer: const CustomDrawer(),
        body: FutureBuilder<List<FirebaseFile>>(
            future: sellings,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }

              if (snapshot.hasData) {
                final files = snapshot.data;

                return ListView(
                  children: List.generate(files!.length, (index) {
                    final file = files[index];
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
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.amber,
                                      image: DecorationImage(
                                          image: NetworkImage(file.url),
                                          fit: BoxFit.cover)),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    IconButton(
                                        onPressed: () {},
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
                            const Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$140/D",
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text("4.8")
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Piston ring",
                                  style: TextStyle(
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
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              );
            }));
  }
}
