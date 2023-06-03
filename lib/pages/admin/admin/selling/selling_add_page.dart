import 'dart:io';

import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/selling_model.dart';
import 'package:automotiveapp/usecase/firebasestorage_apis.dart';
import 'package:automotiveapp/widgets/text_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddSellingPart extends StatefulWidget {
  const AddSellingPart({super.key});

  @override
  State<AddSellingPart> createState() => _AddSellingPartState();
}

class _AddSellingPartState extends State<AddSellingPart> {
  TextEditingController nameController=TextEditingController();
  TextEditingController rateController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  late String urlDownload;

// Handling file upload

    PlatformFile? pickedFile;
    UploadTask? uploadTask;
  Future selectFile()async{
      final result=await FilePicker.platform.pickFiles();
      setState(() {
        pickedFile=result?.files.first;
      });
  }

 Future  uploadFile()async{
    final path='renting/${pickedFile!.name}';
    final file=File(pickedFile!.path!);

    final ref=FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask=ref.putFile(file);
    });

    final snapshot=await uploadTask!.whenComplete((){});
    urlDownload=await snapshot.ref.getDownloadURL();

    print("Download link: $urlDownload");
    uploadTask=null;
  }
 buildProgress()=>StreamBuilder<TaskSnapshot>(
  stream: uploadTask?.snapshotEvents,
  builder:(context, snapshot){
    if(snapshot.hasData){
      final data=snapshot.data!;
      double progress=data.bytesTransferred/data.totalBytes;

      return SizedBox(height: 50,
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
                '${(100*progress).roundToDouble()}%',
                style: const TextStyle(color: white),
              ),
            )
          ],
        ),
      );
    }else{
      return const SizedBox(height: 50,);
    }
  });






  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.go("/selling_management");
        }, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Add Product"),
        centerTitle: true,
        backgroundColor: blackfade,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              width: size.width,
              height: size.width*0.3,
              child: pickedFile==null?const Text("Please pick a file"):Expanded(child:Container(
              color: blue[100],
              child: Center(
                // child: Text(pickedFile!.name),
                child: Image.file(
                  File(pickedFile!.path!),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            )),
            ),
            const SizedBox(height: 10,),
            buildProgress(),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  selectFile();
                }, child: const Text("Select File", style: TextStyle(color: white, fontSize: 18),)),
                const SizedBox(width: 40,),
                 ElevatedButton(onPressed: (){
                  uploadFile();
                }, child: const Text("Upload File", style: TextStyle(color: white, fontSize: 18),)),
              ],
            ),
            const SizedBox(height: 20,),
            CustomTextField2(size: size, inputController: nameController, obsecureText: false, labeltext: "Model name"),
            const SizedBox(height: 20,),
            CustomTextField2(size: size, inputController: rateController, obsecureText: false, labeltext: "Number of stars"),
            const SizedBox(height: 20,),
            CustomTextField2(size: size, inputController: priceController, obsecureText: false, labeltext: "Rental price"),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              FirebaseStorageApis().addSelling(SellingModel(name: nameController.text, price: double.parse(priceController.text), rate: double.parse(rateController.text), url: urlDownload)).then((value){
                nameController.clear();
                priceController.clear();
                rateController.clear();
                urlDownload='';
              }).then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Car added successfully"))
                )
              });
            }, child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Add Product"),
              SizedBox(width: 10,),
              Icon(Icons.add)
            ],))
          ],
        ),
      ),
    );
  }
}