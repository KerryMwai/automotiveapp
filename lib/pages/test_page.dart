import 'package:automotiveapp/firebase/storage_service.dart';
import 'package:flutter/material.dart';
class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              AutoStorageInteraction storage=AutoStorageInteraction();
              storage.getFileName();
            }, child: const Text("Clicke me"))
          ],

        ),
      ),
    );
  }
}