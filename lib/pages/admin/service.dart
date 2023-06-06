import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/service_model.dart';
import 'package:automotiveapp/pages/tabs/custom_drawer.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceManagerPage extends StatefulWidget {
  const ServiceManagerPage({super.key});

  @override
  State<ServiceManagerPage> createState() => _ServiceManagerPageState();
}

class _ServiceManagerPageState extends State<ServiceManagerPage> {
  TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
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
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseStorageApis().fetchAllServices(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }

            if (snapshot.hasData) {
              final services=snapshot.data!.docs;
              return ListView(
                children: List.generate(
                    services.length,
                    (index){
                      final service=services[index];
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
                                                  service['url']),
                                              fit: BoxFit.cover)),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                           showDialog(
                                              context: context,
                                              builder: (context) {
                                                final String name =
                                                    service['name'];
                                                
                                                nameController.text = name;
                                                return AlertDialog(
                                                  title: const Text(
                                                      "Update Service"),
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
                                                              .updateService(
                                                                  service.id,
                                                                  ServiceModel(
                                                                      name: nameController
                                                                          .text,
                                                                    
                                                                      downloadurl:
                                                                          "https://media.istockphoto.com/id/1347150429/photo/professional-mechanic-working-on-the-engine-of-the-car-in-the-garage.jpg?s=1024x1024&w=is&k=20&c=yFM-ZakZSgmuMl3bOng86UWO1bfQFCPeQS06myTNkQI=",
                                                                      imageName:
                                                                          "service-demo.jpg"))
                                                              .then((value) => {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(const SnackBar(
                                                                            content:
                                                                                Text("Service updated successfully")))
                                                                  })
                                                              .then((value) =>
                                                                  Navigator.pop(
                                                                      context));
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
                                                      .deleteSellingDocument(
                                                          service.id)
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children:  [
                                    Text(
                                      service['name'],
                                      style:const  TextStyle(
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
