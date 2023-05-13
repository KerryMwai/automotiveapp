import 'package:firebase_storage/firebase_storage.dart';

class AutoStorageInteraction{
  final storageRef=FirebaseStorage.instance.ref();
  void getFileName(){
    print(storageRef);
  }
}