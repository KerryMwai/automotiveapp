import 'package:automotiveapp/notifiers/service_notifier.dart';
import 'package:automotiveapp/pages/cart.dart';
import 'package:automotiveapp/pages/home_page.dart';
import 'package:automotiveapp/pages/part_detail_page.dart';
import 'package:automotiveapp/pages/rent_detail_page.dart';
import 'package:automotiveapp/pages/signin_page.dart';
import 'package:automotiveapp/pages/signup_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var options = const FirebaseOptions(
      apiKey: "AIzaSyBzAM9S1xgLYs6hn7tk70SNul6rQbKDcyI",
      appId: "1:1040747138095:android:eee28e958a7053a24a4ada",
      messagingSenderId: "1040747138095",
      projectId: "senior-and-more");
  await Firebase.initializeApp(options: options);
  runApp(const RootApp());
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const SignInPage();
      },
      routes: [
        GoRoute(
            path: "Signup",
            builder: (BuildContext context, GoRouterState state) {
              return const SignUpPage();
            }),
        GoRoute(
            path: "Home",
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            }),
        GoRoute(
            path: "PartDetails",
            builder: (BuildContext context, GoRouterState state) {
              return const PartDetailPage();
            }),
        GoRoute(
            path: "RentCarDetail",
            builder: (BuildContext context, GoRouterState state) {
              return const RentDetailPage();
            }),
        GoRoute(
            path: "cart",
            builder: (BuildContext context, GoRouterState state) {
              return const CartPage();
            }),
      ])
]);

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ServiceChangeNotifer())
      ],
      child:MaterialApp.router(
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
      ),
    );
  }
}
