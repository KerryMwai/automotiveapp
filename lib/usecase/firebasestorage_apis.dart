import 'dart:io';

import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:automotiveapp/respository/automotive_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageApis {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  // Fetching the urls to be displayed in the app
  static Future<List<FirebaseFile>> fetchAllrentalCarsImages() async {
    return await AutomotiveApi.listAll('renting/');
  }

  static Future<List<FirebaseFile>> fetchAllrentalSellingmages() async {
    return await AutomotiveApi.listAll('selling/');
  }

  static Future<List<FirebaseFile>> fetchAllrentalServicesImages() async {
    return await AutomotiveApi.listAll('services/');
  }

  // Selecting file from the device
  Future selectImageFile() async {
    final result = await FilePicker.platform.pickFiles();
    pickedFile = result?.files.first;
  }

// Uploading file to rental cars bucket
  Future uploadFileToRentCars() async {
    final path = 'renting/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print("Download link: $urlDownload");
    uploadTask = null;
  }

  Future uploadFileToSelling() async {
    final path = 'selling/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print("Download link: $urlDownload");
    uploadTask = null;
  }

  Future uploadFileServices() async {
    final path = 'services/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print("Download link: $urlDownload");
    uploadTask = null;
  }


// Handling deletion
  static Future<void> delete(String ref) async {
    await FirebaseStorage.instance.ref(ref).delete();
  }
}