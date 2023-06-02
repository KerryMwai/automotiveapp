import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:automotiveapp/pages/tabs/custom_drawer.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:flutter/material.dart';

class RentManagerPage extends StatefulWidget {
  const RentManagerPage({super.key});

  @override
  State<RentManagerPage> createState() => _RentManagerPageState();
}

class _RentManagerPageState extends State<RentManagerPage> {
  late Future<List<FirebaseFile>> rentalCars;

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    rentalCars=FirebaseStorageApis.fetchAllrentalCarsImages();
    
  }
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
            child: ElevatedButton(onPressed: (){}, child: const Text("Add car", style: TextStyle(fontSize: 18),)))
        ],
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder<List<FirebaseFile>>(
        future: rentalCars,
        builder:(context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(color: Colors.green,),);
            }

            if(snapshot.hasData){
              final files=snapshot.data;
              return ListView(
                  children: List.generate(files!.length, (index){
                    final file=files[index];

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
                              decoration:   BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: NetworkImage(file.url),fit: BoxFit.cover)
                                  ),
                            ),

                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: const Icon(Icons.edit, color: Colors.green,)),
                                IconButton(onPressed: (){}, icon: const Icon(Icons.delete, color: Colors.red,)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("2023 Nissan", style: TextStyle(color: black, fontSize: 18, fontWeight: FontWeight.w500),),
                            Row(
                              children: [
                                Icon(Icons.airline_seat_recline_extra),
                                SizedBox(width: 10,),
                                Text("6 Seat", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  ),
                );
                  }),
              );
            }
            return const Center(child: Text("Something went wrong", style: TextStyle(color: Colors.red, fontSize: 20, letterSpacing: 2),),);
        })
    );
  }
}
