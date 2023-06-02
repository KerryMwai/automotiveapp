import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/pages/tabs/custom_drawer.dart';
import 'package:flutter/material.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackfade,
        title: const Text("Admin and logout"),
      ),
      drawer: const CustomDrawer(),
      body: GridView.builder(
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: (context, index){
            return const Card(color: Colors.grey,);
      },)
    );
  }
}