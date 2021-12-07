import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:titanscrypto/screens/login_pages/sign_up.dart';
import 'package:titanscrypto/screens/login_pages/signin_number.dart';
import 'package:titanscrypto/screens/login_pages/start_home.dart';
import 'package:titanscrypto/screens/splash/home.dart';

void main()async {
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}
