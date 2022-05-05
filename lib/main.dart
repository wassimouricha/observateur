import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:observateur/splash_screen.dart';
import 'package:observateur/utils/colors.dart';


// bien respecter l'odre du code sinon l'application ne se lance pas 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
       await Firebase.initializeApp(
         options: const FirebaseOptions(
           apiKey: "AIzaSyB0iPAEsXv4yh9SwEaS9CwiSY-ON1TTOi0", 
           appId: "1:27801334673:web:907cacf2d8c399ff47e030", 
           messagingSenderId: "27801334673", 
           projectId: "observateur-79208",
           storageBucket: "observateur-79208.appspot.com",
         ),
         );
  }else {
    await Firebase.initializeApp();
  }
 
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
