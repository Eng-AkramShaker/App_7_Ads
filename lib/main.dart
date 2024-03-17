// // ignore_for_file: depend_on_referenced_packages, unused_import, library_private_types_in_public_api

// ignore_for_file: depend_on_referenced_packages, unused_local_variable, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todotask/data/model/cart.dart';
import 'package:todotask/presentation/screens/splash/splash_screen.dart';
import 'utils/controller/home_controller.dart';
import 'data/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );
}

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => Controller_Home()),
  ChangeNotifierProvider(create: (ctx) => Cart()),
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (ctx) => Controller_Home(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
