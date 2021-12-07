import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/home/home_page.dart';
import 'package:titanscrypto/servises/servisauth.dart';

class StartHome extends StatelessWidget {
  late Services _apiService = Helper();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: bkColor,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getWidth(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(125),
              ),
              Image.asset(
                "assets/images/startkosma.png",
                width: getWidth(106),
                height: getHeight(249),
              ),
              SizedBox(
                height: getHeight(45),
              ),
              Text(
                "Your account has been\n successfully created!",
                style: TextStyle(
                  color: whColor,
                  fontSize: getWidth(25),
                ),
              ),
              SizedBox(
                height: getHeight(45),
              ),
              ElevatedButton(
                onPressed: () {
                  //to home
                  Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
                },
                child: Text(
                  "Get started",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: getWidth(16)),
                ),
                style: ElevatedButton.styleFrom(
                  primary: tealColor,
                  fixedSize: Size(
                    getWidth(366),
                    getHeight(54),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
