import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:titanscrypto/constants/size_config.dart';

class ActionPage extends StatelessWidget {
  String img;
  String title;
  ActionPage({required this.img, required this.title});

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: const Color(0xff1B232A),
      body: SizedBox(
        height: getHeight(896),
        width: getWidth(414),
        child: Column(
          children: [
            changePageView(),
            // nextButton(),
          ],
        ),
      ),
    );
  }

  Padding changePageView() {
    return Padding(
      padding: EdgeInsets.only(
        top: getHeight(93),
      ),
      child: Column(
        children: [
          Container(
            height: getHeight(369),
            width: getWidth(331.72),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  // ignore: unnecessary_string_interpolations
                  "$img",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(24),
            ),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getWidth(24),
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: getHeight(24), left: getWidth(24), right: getWidth(24)),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.",
              style: TextStyle(
                  fontSize: getWidth(18),
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  
}
