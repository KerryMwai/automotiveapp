import 'package:automotiveapp/controller/automotive_changenotifier.dart';
import 'package:automotiveapp/pages/admin/admin/rental/rental_update_page.dart';
import 'package:automotiveapp/pages/admin/admin/rental/rentals_add_page.dart';
import 'package:automotiveapp/pages/admin/admin/selling/selling_add_page.dart';
import 'package:automotiveapp/pages/admin/admin/selling/selling_update_page.dart';
import 'package:automotiveapp/pages/admin/admin/service/service_add_page.dart';
import 'package:automotiveapp/pages/admin/admin/service/service_update_page.dart';
import 'package:automotiveapp/pages/admin/rent.dart';
import 'package:automotiveapp/pages/admin/selling.dart';
import 'package:automotiveapp/pages/admin/service.dart';
import 'package:automotiveapp/pages/cart.dart';
import 'package:automotiveapp/pages/firebase/upload_to_firebase_storage.dart';
import 'package:automotiveapp/pages/firebase/view_files_from_firebase.dart';
import 'package:automotiveapp/pages/home_page.dart';
import 'package:automotiveapp/pages/pagesasperbottomnav/profile.dart';
import 'package:automotiveapp/pages/part_detail_page.dart';
import 'package:automotiveapp/pages/rent_detail_page.dart';
import 'package:automotiveapp/pages/signin_page.dart';
import 'package:automotiveapp/pages/signup_page.dart';
import 'package:automotiveapp/pages/firebase/download_from_firebase_storage.dart';
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
      projectId: "senior-and-more",
      storageBucket: 'gs://senior-and-more.appspot.com');
  await Firebase.initializeApp(options: options);
  runApp(ChangeNotifierProvider(
    create: (_) => AutomotiveChangeNotifier(),
    child: const RootApp(),
  ));
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
        GoRoute(
            path: "ViewFiles",
            builder: (BuildContext context, GoRouterState state) {
              return const FilesFromFirebasePage();
            }),
        GoRoute(
            path: "service_management",
            builder: ((context, state) => const ServiceManagerPage())),
        GoRoute(
            path: "selling_management",
            builder: ((context, state) => const SellManagerPage())),
        GoRoute(
            path: "rent_management",
            builder: ((context, state) => const RentManagerPage())),
        GoRoute(
            path: "add_car",
            builder: ((context, state) => const AddRentalCar())),
        GoRoute(
            path: "update_car",
            builder: ((context, state) => const UpdateRentalCar())),
        GoRoute(
            path: "add_service",
            builder: ((context, state) => const AddService())),
        GoRoute(
            path: "update_service",
            builder: ((context, state) => const UpdateService())),
        GoRoute(
            path: "add_selling",
            builder: ((context, state) => const AddSellingPart())),

            GoRoute(
            path: "update_selling",
            builder: ((context, state) => const UpdateSellingPart())),
        GoRoute(
            path: "profile", builder: ((context, state) => const Profile())),
        GoRoute(
            path: "DownloadFile",
            builder: (BuildContext context, GoRouterState state) {
              return const DownloadFilePage();
            }),
        GoRoute(
            path: "UploadFile",
            builder: (BuildContext context, GoRouterState state) {
              return const UploadFilePage();
            }),
      ])
]);

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
