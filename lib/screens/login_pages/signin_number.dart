import 'package:flutter/material.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/login_pages/start_home.dart';
import 'package:titanscrypto/servises/servisauth.dart';

class SigninNumber extends StatefulWidget {
  const SigninNumber({Key? key}) : super(key: key);

  @override
  _SigninNumberState createState() => _SigninNumberState();
}

class _SigninNumberState extends State<SigninNumber> {
  Services _apiservis = Helper();

  bool isVerify = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: numbersend(),
    );
  }

  Container numbersend() {
    return Container(
      color: bkColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: isVerify ? codewidget() : numberwidget(),
      ),
    );
  }

  codewidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getHeight(45),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                isVerify = false;
                _apiservis.phoneController.clear();
                setState(() {});
              },
              icon: Icon(
                Icons.arrow_back,
                color: greyColor,
                size: 30,














              ),
            ),
            SizedBox(
              width: getWidth(10),
            ),
            Text(
              "Verification",
              style: TextStyle(
                  color: greywhite, fontSize: getHeight(18)),
            )
          ],
        ),
        SizedBox(
          height: getHeight(30),
        ),
        Text(
          "Enter your code",
          style: TextStyle(
              fontSize: getWidth(28), color: whColor),
        ),
        SizedBox(
          height: getHeight(15),
        ),
        Text(
          "Please type the code we sent to",
          style: TextStyle(
            color: greyColor,
            fontSize: getWidth(14),
          ),
        ),
        Text(
          "${_apiservis.phoneController.text}",
          style: TextStyle(
            color: tealColor,
            fontSize: getWidth(14),
          ),
        ),
        Form(
            child: Column(
          children: [
            SizedBox(
              height: getHeight(45),
            ),
            TextFormField(
              controller: _apiservis.kodController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: whColor),
              cursorColor: whColor,
              decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxHeight: getHeight(54)),
                  hintText: "Enter your code",
                  hintStyle: TextStyle(
                      fontSize: getWidth(14),
                      color: greyColor),
                  fillColor: blackColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                          Radius.circular(getWidth(12))))),
            ),
            SizedBox(
              height: getHeight(20),
            ),
            Text(
              "Resend code (30)",
              style: TextStyle(
                color: greyColor,
                fontSize: getWidth(14),
              ),
            ),
            Text(
              "Resend Link",
              style: TextStyle(
                color: tealColor,
                fontSize: getWidth(14),
              ),
            ),
            SizedBox(
              height: getHeight(40),
            ),
            ElevatedButton(
              onPressed: () {
                _apiservis.verified(_apiservis.phoneController.text,
                    _apiservis.kodController.text, context);
              },
              child: Text(
                "Continue",
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
        ))
      ],
    );
  }

  Column numberwidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getHeight(45),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: greyColor,
                size: 30,
              ),
            ),
            SizedBox(
              width: getWidth(10),
            ),
            Text(
              "Sign Up",
              style: TextStyle(
                  color: greywhite, fontSize: getHeight(18)),
            )
          ],
        ),
        SizedBox(
          height: getHeight(30),
        ),
        Text(
          "Register with mobile",
          style: TextStyle(
              fontSize: getWidth(28), color: whColor),
        ),
        SizedBox(
          height: getHeight(15),
        ),
        Text(
          "Please type your number, then we’ll send a\n verification code for authentication.",
          style: TextStyle(
            color: greyColor,
            fontSize: getWidth(14),
          ),
        ),
        SizedBox(
          height: getHeight(50),
        ),
        Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mobile Number",
              style: TextStyle(
                color: greyColor,
                fontSize: getWidth(14),
              ),
            ),
            SizedBox(
              height: getHeight(8),
            ),
            TextFormField(
              controller: _apiservis.phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: whColor),
              cursorColor: whColor,
              decoration: InputDecoration(
                  constraints: BoxConstraints(
                      maxHeight: getHeight(54)),
                  hintText: "Enter your number",
                  hintStyle: TextStyle(
                      fontSize: getWidth(14),
                      color: greyColor),
                  fillColor: blackColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                          Radius.circular(getWidth(12))))),
            ),
            SizedBox(
              height: getHeight(30),
            ),
            ElevatedButton(
              onPressed: () {
                _apiservis.sendCodephone(_apiservis.phoneController.text);
                isVerify = true;

                setState(() {});
              },
              child: Text(
                "Send OTP",
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
        ))
      ],
    );
  }
}
