import 'package:app_7/core/constants/firebase_options.dart';
import 'package:app_7/presentation/screens/add/controller/add_controller.dart';
import 'package:app_7/presentation/screens/auth/controller/auth_controller.dart';
import 'package:app_7/presentation/screens/home/controller/cart.dart';
import 'package:app_7/presentation/screens/home/screens/home.dart';
import 'package:app_7/presentation/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/screens/home/controller/home_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getString('uid') != null;

  runApp(MultiProvider(providers: providers, child: MyApp(isLoggedIn: isLoggedIn)));
}

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => Controller_Home()),
  ChangeNotifierProvider(create: (ctx) => Cart_Controller()),
  ChangeNotifierProvider(create: (ctx) => Add_Controller()),
  ChangeNotifierProvider(create: (ctx) => Auth_Controller()),
];

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Controller_Home(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: isLoggedIn ? Home() : SplashScreen(),
        ),
      ),
    );
  }
}



 

// akram@gmail.com

// Akram123@



// ElevatedButton(
//   onPressed: () async{
//     print(snapshot.data!.docs);
//   },
//   child: const Text('data'),
// ),


 