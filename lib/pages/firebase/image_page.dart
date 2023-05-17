import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:flutter/material.dart';


class ImagePage extends StatelessWidget {
  const ImagePage({super.key, required this.file});

  final FirebaseFile file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(file.name),
        centerTitle: true,
      ),
      body: Image.network(file.url, height: double.infinity, fit: BoxFit.cover,),
    );
  }
}