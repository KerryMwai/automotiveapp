import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/pages/tabs/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: blackfade,
        title: const Text("Admin and logout"),
      ),
      drawer: const CustomDrawer(),
      body: GridView.builder(
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
        itemBuilder: (context, index){
            if(index==0){
              return  GestureDetector(
                onTap: (){
                  context.go("/selling_management");
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:const DecorationImage(image: NetworkImage("https://media.istockphoto.com/id/1147751232/photo/auto-parts-spare-parts-car-on-the-grey-background.jpg?s=1024x1024&w=is&k=20&c=0Tbkn4PDwrDHaVAFi9bENrf977v5s7vLoWHWOB_gSkE="), fit: BoxFit.cover),
                  color: Colors.grey,
                  ),
                  child:  const Center(child: Text("Manage \nSellings", style: TextStyle(color: white, fontSize: 23, fontWeight: FontWeight.w600),),)),
              );
            }else if(index==1){
                 return  GestureDetector(
                  onTap: (){
                    context.go("/rent_management");
                  },
                   child: Container(
                                 margin: const EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10),
                                 image:const DecorationImage(image: NetworkImage("https://cdn.pixabay.com/photo/2016/04/01/12/16/car-1300629_640.png"), fit: BoxFit.cover),
                                 color: Colors.grey,
                                 ),
                                 child:const   Center(child: Text("Manage \nCars", style: TextStyle(color:Color.fromARGB(255, 182, 6, 144), fontSize: 23, fontWeight: FontWeight.w600),),)),
                 );
            }else{
                   return  GestureDetector(
                    onTap: (){
                      context.go("/service_management");
                    },
                     child: Container(
                                   margin: const EdgeInsets.all(10),
                                   decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(10),
                                   image:const DecorationImage(image: NetworkImage("https://cdn.pixabay.com/photo/2018/09/20/22/23/auto-repair-3691962_640.jpg"), fit: BoxFit.cover),
                                   color: Colors.grey,
                                   ),
                                   child:   Center(child: Text("Manage \nServices", style: TextStyle(color:Colors.pink.shade400, fontSize: 23, fontWeight: FontWeight.w600),),)),
                   );
            }
        } 
      )  
    );
  }
}