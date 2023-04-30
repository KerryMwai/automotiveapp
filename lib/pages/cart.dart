import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0.0,
        leading: Container(
          margin: const EdgeInsets.only(top: 20.0, left: 20.0),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            width: size.width,
            height: size.height * 0.6,
            child: Column(children: [
              SizedBox(
                width: size.width - 20,
                child: const Center(
                  child: Text(
                    "My Cart",
                    style: TextStyle(
                        color: white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Roboto",
                        letterSpacing: 1.6),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
// Cart details section
              SizedBox(
                height: size.height * 0.4,
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(
                    5,
                    (index) => CustomCard(size: size),
                  )),
                ),
              ),
            ]),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Delivery Address",
                  style: TextStyle(
                      color: white, fontSize: 22, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "517 washington Ave, Manchester\n Newcastle Street B56",
                  style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
        width: size.width,
        height: 80,
        decoration: BoxDecoration(
          color: blackfade.withOpacity(0.4),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total amount:",
                  style: TextStyle(color: white.withOpacity(0.6), fontSize: 18),
                ),
                 Text(
                  "\$560.00",
                  style: TextStyle(color: white.withOpacity(0.6), fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: size.width-60,
                decoration: BoxDecoration(
                  color: blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(child: Text("Buy Now", style: TextStyle(color: white, fontWeight: FontWeight.w600, fontSize: 19, fontFamily: "Roboto"),),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
