import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AutomotiveApi {

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result =await ref.listAll();

    final urls =await _getDownloadLinks(result.items);

      return urls.asMap().map((key, url){
        final ref=result.items[key];
        final name=ref.name;
        final file=FirebaseFile(ref:ref, name:name, url:url);

        return MapEntry(key, file);
      }).values.toList();
  }

  static Future<void> delete(String ref)async{
    await FirebaseStorage.instance.ref(ref).delete();
  }
  
}

