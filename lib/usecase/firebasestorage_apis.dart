import 'dart:io';

import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:automotiveapp/models/rental_model.dart';
import 'package:automotiveapp/models/selling_model.dart';
import 'package:automotiveapp/models/service_model.dart';
import 'package:automotiveapp/respository/automotive_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageApis {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  FirebaseFirestore firestorInstance = FirebaseFirestore.instance;

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
   Future<void> deleteImagefromFirebaseStorage(String ref) async {
    await FirebaseStorage.instance.ref(ref).delete();
  }

  // Firebasefirestore operations
  Stream<QuerySnapshot> fetchAllSellItems() {
    return firestorInstance.collection("selling").snapshots();
  }

  Future<void> addService(ServiceModel service) async {
    CollectionReference automotiveReference =
        firestorInstance.collection("services");
    automotiveReference.add({'name': service.name, 'url': service.downloadurl, 'image_name':service.imageName});
  }

  Future<void> addSelling(SellingModel selling) async {
    CollectionReference automotiveReference =
        firestorInstance.collection("selling");
    automotiveReference.add({
      'name': selling.name,
      'price': selling.price,
      'rate': selling.rate,
      'url': selling.url,
      'image_name':selling.imageName
    });
  }

  Future<void> addRentalCar(RentalModel rentalcar) async {
    CollectionReference automotiveReference =
        firestorInstance.collection("renting");
    automotiveReference.add({
      'name': rentalcar.name,
      'seats': rentalcar.seats,
      'url': rentalcar.url,
      'image_name':rentalcar.imageName
    });
  }

  // Handle deletion
  Future<void> deleteSellingDocument(String id) async {
    CollectionReference selldoc = firestorInstance.collection("selling");
    selldoc
        .doc(id)
        .delete()
        .then((value) => print("Sell doc Deleted"))
        .catchError((error) => print("Failed to delete sell doc: $error"));
  }

  Future<void> deleteServiceDocument(String id) async {
    CollectionReference servicedoc = firestorInstance.collection("services");
    servicedoc
        .doc(id)
        .delete()
        .then((value) => print("Sell doc Deleted"))
        .catchError((error) => print("Failed to delete sell doc: $error"));
  }

  Future<void> deleteRentingDocument(String id) async {
    CollectionReference rentingdoc = firestorInstance.collection("renting");
    rentingdoc
        .doc(id)
        .delete()
        .then((value) => print("Renting doc Deleted"))
        .catchError((error) => print("Failed to delete renting doc: $error"));
  }
}
