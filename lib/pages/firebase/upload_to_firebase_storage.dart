import 'dart:io';

import 'package:automotiveapp/constants/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UploadFilePage extends StatefulWidget {
  const UploadFilePage({super.key});

  @override
  State<UploadFilePage> createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
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
    final urlDownload=await snapshot.ref.getDownloadURL();
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
    return Scaffold(
           appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.go("/DownloadFile"),
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
      
           Container(
            margin: const EdgeInsets.all(5),
            child: ElevatedButton(
                style:ElevatedButton.styleFrom(backgroundColor: pink,),
                onPressed: ()=>context.go("/ViewFiles"),
                
                child: const Text("View Files", style: TextStyle(fontSize: 18),)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pickedFile==null?const Center(child:  Text("Please pick a file")):Expanded(child:Container(
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
            const SizedBox(height: 20,),
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
            buildProgress()
          ],
        ),
      ),
    );
  }
}