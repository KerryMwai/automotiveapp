import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:automotiveapp/pages/tabs/custom_drawer.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceManagerPage extends StatefulWidget {
  const ServiceManagerPage({super.key});

  @override
  State<ServiceManagerPage> createState() => _ServiceManagerPageState();
}

class _ServiceManagerPageState extends State<ServiceManagerPage> {
  late Future<List<FirebaseFile>> servicesFromFirebaseStorage;

  @override
  void initState() {
    super.initState();
    servicesFromFirebaseStorage =
        FirebaseStorageApis.fetchAllrentalServicesImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: blackfade,
          title: const Text("Service Manager"),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      context.go("/add_service");
                    },
                    child: const Text(
                      "Add service",
                      style: TextStyle(fontSize: 18),
                    )))
          ],
        ),
        drawer: const CustomDrawer(),
        body: FutureBuilder<List<FirebaseFile>>(
          future: servicesFromFirebaseStorage,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }

            if (snapshot.hasData) {
              final files=snapshot.data;
              return ListView(
                children: List.generate(
                    files!.length,
                    (index){
                      final file=files[index];
                      return Card(
                          margin: const EdgeInsets.all(10),
                          color: Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration:  BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.amber,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  file.url),
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
                                 Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Car Brakes",
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
                    }
                        ),
              );
            }

            return const Center(child:Text("Something went wrong", style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w600),) ,);
          },
        ));
  }
}
