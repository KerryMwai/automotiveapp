import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/selling_model.dart';
import 'package:automotiveapp/pages/tabs/custom_drawer.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SellManagerPage extends StatefulWidget {
  const SellManagerPage({super.key});

  @override
  State<SellManagerPage> createState() => _SellManagerPageState();
}

class _SellManagerPageState extends State<SellManagerPage> {
  // late Future<List<FirebaseFile>> sellings;
  // @override
  // void initState() {
  //   super.initState();
  //   sellings = FirebaseStorageApis.fetchAllrentalSellingmages();
  // }
  TextEditingController nameController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: blackfade,
          title: const Text("Selling manager"),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      context.go("/add_selling");
                    },
                    child: const Text(
                      "Add product",
                      style: TextStyle(fontSize: 18),
                    )))
          ],
        ),
        drawer: const CustomDrawer(),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseStorageApis().fetchAllSellItems(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }

              if (snapshot.hasData) {
                final sellingdocs = snapshot.data!.docs;

                return ListView(
                  children: List.generate(sellingdocs.length, (index) {
                    final singledoc = sellingdocs[index];
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
                                      // color: Colors.amber,
                                      image: DecorationImage(
                                          image: NetworkImage(singledoc['url']),
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
                                                    singledoc['name'];
                                                final String rate =
                                                    singledoc['rate']
                                                        .toString();
                                                final String price =
                                                    singledoc['price']
                                                        .toString();
                                                nameController.text = name;
                                                rateController.text = rate;
                                                priceController.text = price;
                                                return AlertDialog(
                                                  title: const Text(
                                                      "Update Rental Car"),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      children: [

                                                        const SizedBox(
                                                          height: 20,
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
                                                                rateController,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText: "Rate",
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
                                                              .updateProduct(
                                                                  singledoc.id,
                                                                  SellingModel(
                                                                      name: nameController
                                                                          .text,
                                                                      rate: double.parse(
                                                                          rateController
                                                                              .text),
                                                                      price: double.parse(
                                                                          priceController
                                                                              .text),
                                                                      url:
                                                                          "https://media.istockphoto.com/id/528679231/photo/auto-parts.jpg?s=1024x1024&w=is&k=20&c=Ilxyx0tJCzRjqg47N9oReerDBdexnwysJpG3FQtG9T0=",
                                                                      imageName:
                                                                          "spare-demo.jpg"))
                                                              .then((value) => {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(const SnackBar(
                                                                            content:
                                                                                Text("Selling updated successfully")))
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
                                          FirebaseStorageApis().deleteSellingDocument(singledoc.id);
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
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    singledoc['name'],
                                    style: const TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$ ${singledoc['price']}",
                                      style: const TextStyle(
                                          color: black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(singledoc['rate'].toString())
                                      ],
                                    )
                                  ],
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
