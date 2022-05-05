import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:observateur/splash_screen.dart';
import 'package:observateur/utils/colors.dart';


// bien respecter l'odre du code sinon l'application ne se lance pas 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "L'Observateur",
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: const SplashScreen(),
    );
  }
}
