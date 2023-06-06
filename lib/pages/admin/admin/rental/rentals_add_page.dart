import 'dart:io';

import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/rental_model.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:automotiveapp/widgets/text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddRentalCar extends StatefulWidget {
  const AddRentalCar({super.key});

  @override
  State<AddRentalCar> createState() => _AddRentalCarState();
}

class _AddRentalCarState extends State<AddRentalCar> {
  TextEditingController nameController = TextEditingController();
  TextEditingController seatsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  late String urlDownload;
  late String filename;

// Handling file upload

  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    setState(() {
      pickedFile = result?.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'renting/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    filename = pickedFile!.name;

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    urlDownload = await snapshot.ref.getDownloadURL();

    print("Download link: $urlDownload");
    print("______________________________________");
    print("File name is: $filename");
    uploadTask = null;
  }

  buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;

          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: const TextStyle(color: white),
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 50,
          );
        }
      });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go("/rent_management");
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Add Car Details"),
        centerTitle: true,
        backgroundColor: blackfade,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
          //  SizedBox(
          //     width: size.width,
          //     height: size.width * 0.3,
          //     child: pickedFile == null
          //         ? const Text("Please pick a file")
          //         : Expanded(
          //             child: Container(
          //             color: blue[100],
          //             child: Center(
          //               // child: Text(pickedFile!.name),
          //               child: Image.file(
          //                 File(pickedFile!.path!),
          //                 width: double.infinity,
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           )),
          //   ),
          //   const SizedBox(
          //     height: 10,
          //   ),
          //   buildProgress(),
          //      const SizedBox(
          //     height: 10,
          //   ),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //           onPressed: () {
          //             selectFile();
          //           },
          //           child: const Text(
          //             "Select File",
          //             style: TextStyle(color: white, fontSize: 18),
          //           )),
          //       const SizedBox(
          //         width: 40,
          //       ),
          //       ElevatedButton(
          //           onPressed: () {
          //             uploadFile();
          //           },
          //           child: const Text(
          //             "Upload File",
          //             style: TextStyle(color: white, fontSize: 18),
          //           )),
          //     ],
          //   ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField2(
                size: size,
                inputController: nameController,
                obsecureText: false,
                labeltext: "Model name"),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
                size: size,
                inputController: seatsController,
                obsecureText: false,
                labeltext: "Number of seats"),
            const SizedBox(
              height: 20,
            ),
            CustomTextField2(
                size: size,
                inputController: priceController,
                obsecureText: false,
                labeltext: "Rental price"),
            const SizedBox(
              height: 30,
            ),
             ElevatedButton(
                onPressed: () {
                 FirebaseStorageApis().addRentalCar(RentalModel(
                      name: nameController.text,
                      seats: int.parse(seatsController.text),
                      price: double.parse(priceController.text),
                      url: "https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                      imageName: "ferrari-demo.jpg"))
                      .then((value) {
                    nameController.clear();
                    seatsController.clear();
                    urlDownload = '';
                  }).then((value) => {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Car added successfully")))
                          });
                },
                child:const  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("Add Product"),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.add)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
