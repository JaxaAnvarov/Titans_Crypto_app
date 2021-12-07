import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/home/home_page.dart';
import 'package:titanscrypto/screens/splash/page_view.dart';
import 'package:titanscrypto/servises/servisauth.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    late Services _apiService;
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () { 

         _apiService = Helper();
    _apiService.isLogin().then((value) {
      if (value == 'logged') {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
      } else { Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Pages(),
          ),
        );}
    });
       
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: getHeight(896),
        width: getWidth(414),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/2.png')),
          gradient: LinearGradient(
            begin: AlignmentDirectional.center,
            end: AlignmentDirectional.bottomCenter,
            colors: [
              Color.fromRGBO(27, 35, 42, 1),
              Color.fromRGBO(27, 35, 42, 0.99),
              Color.fromRGBO(27, 35, 42, 0.96),
              Color.fromRGBO(27, 35, 42, 0.96),
            ],
          ),
        ),
      ),
    );
  }
}
