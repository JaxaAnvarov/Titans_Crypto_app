import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/login_pages/sign_up.dart';
import 'package:titanscrypto/screens/splash/action_page.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  late List titles;
  @override
  void initState() {
    titles = [
      "Trade any time anywhere",
      "Save and invest at the same time",
      "Transact fast and easy"
    ];
    
    super.initState();
  }

  int _currentIndex = 0;
  late List circleA;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xff1B232A),
      body: Column(
        children: [
          Container(
              height: getHeight(660),
              width: MediaQuery.of(context).size.width,
              child: ActionPage(
                  title: titles[_currentIndex],
                  img: "assets/images/kos${_currentIndex + 1}.png")),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: getWidth(181.0)),
                     child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      CircleAvatar(
                        radius: getWidth(6.0),
                        backgroundColor: _currentIndex==0? Colors.white :Colors.grey,
                      ),
                      CircleAvatar(
                        radius: getWidth(6.0),
                        backgroundColor: _currentIndex==1? Colors.white :Colors.grey,
                      ),
                      CircleAvatar(
                        radius: getWidth(6.0),
                        backgroundColor: _currentIndex==2? Colors.white :Colors.grey,
                      ),
                  ],
                ),
                   ),
          nextButton()
        ],
      ),
    );
  }
  
  Widget nextButton() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getHeight(41),
            left: getWidth(181),
            right: getWidth(181),
          ),
          child: SizedBox(

          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getHeight(40.76),
            left: getWidth(117),
            right: getWidth(117),
          ),
          child: Container(
            height: getHeight(54),
            width: getWidth(184),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff5ED5A8).withOpacity(0.5),
                  spreadRadius: .3,
                  blurRadius: 30,
                  offset: Offset(0, 8), // changes position of shadow
                ),
              ],
              color: const Color(0xff5ED5A8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                _currentIndex != 2
                    ? _currentIndex += 1
                    : Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SignIn()),
        (Route<dynamic> route) => false);
                setState(() {});
              },
              child: Text(
                'Next',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(18)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
