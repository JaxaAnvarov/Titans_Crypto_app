import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/home/home_page.dart';
import 'package:titanscrypto/screens/pages/qr_page/qr_kod.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int notification = 40;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: mainColor,
      body: notificationpage(),
      //bottomNavigationBar: _bottomSheet(),
    );
  }

  Column notificationpage() {
    return Column(
      children: [
       // _appBar(),
        ListTile(
          title: Text(
            "Notifications",
            style: TextStyle(
                color: Colors.white,
                fontSize: getWidth(18.0),
                fontWeight: FontWeight.w700),
          ),
          trailing: notification % 2 == 0
              ? SvgPicture.asset(
                  "assets/images/Filter.svg",
                  height: getWidth(22.0),
                  width: getWidth(22.0),
                )
              : SizedBox(
                  width: getWidth(130.0),
                  child: Row(
                    children: [
                      Text(
                        "Mark Read all",
                        style: TextStyle(
                            color: textColor,
                            fontSize: getWidth(14.0),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: getWidth(5.0),
                      ),
                      SvgPicture.asset(
                        "assets/images/Filter.svg",
                        height: getWidth(22.0),
                        width: getWidth(22.0),
                      ),
                    ],
                  ),
                ),
        ),
        notification % 2 == 0
            ? Padding(
                padding: EdgeInsets.only(top: getWidth(180.0)),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/oshpaz.svg",
                      width: getWidth(97.0),
                      height: getWidth(136.0),
                    ),
                    SizedBox(
                      height: getWidth(5.0),
                    ),
                    Text(
                      "You have no notifications",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getWidth(18.0),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: getWidth(5.0),
                    ),
                    Text(
                      "You have no notifications",
                      style: TextStyle(
                          color: textColor,
                          fontSize: getWidth(16.0),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: getWidth(598.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        children: [
                          index % 2 == 0
                              ? Text(
                                  "Withdrawal Successful",
                                  style: TextStyle(
                                      fontSize: getWidth(14.0),
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                )
                              : Text(
                                  "Login From An Unknown Device",
                                  style: TextStyle(
                                      fontSize: getWidth(14.0),
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                ),
                          SizedBox(
                            width: getWidth(6.0),
                          ),
                          CircleAvatar(
                            backgroundColor:
                                index % 2 == 0 ? Colors.red : Colors.yellow,
                            radius: getWidth(6.5),
                          )
                        ],
                      ),
                      subtitle: Text(
                        "You have successfully withdrawed lorem ipsum dolor sit...",
                        style: TextStyle(
                          fontSize: getWidth(14.0),
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                  itemCount: 12,
                ),
              ),
      ],
    );
  }

  Ink _appBar() {
    return Ink(
      width: double.infinity,
      height: getWidth(95.0),
      color: mainColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_profileImage(), _icons()],
      ),
    );
  }

  Padding _profileImage() {
    return Padding(
      padding: EdgeInsets.only(top: getWidth(41.0), left: getWidth(24.0)),
      child: CircleAvatar(
        backgroundImage: const AssetImage(
          "assets/images/profile.png",
        ),
        radius: getWidth(18.0),
      ),
    );
  }

  Padding _icons() {
    return Padding(
      padding: EdgeInsets.only(top: getWidth(40.0), right: getWidth(25.0)),
      child: Row(
        children: [
          _searchIcon(),
          SizedBox(width: getWidth(10.0)),
          _qr_kodIcon(),
          SizedBox(width: getWidth(10.0)),
          _notificationIcon(),
        ],
      ),
    );
  }
InkWell _notificationIcon() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NotificationPage()));
      },
      child: SvgPicture.asset(
        'assets/icons/notification.svg',
        width: getWidth(30.0),
        height: getWidth(30.0),
      ),
    );
  }

  InkWell _qr_kodIcon() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QrKodPage()));
      },
      child: SvgPicture.asset(
        'assets/icons/qr_kod.svg',
        width: getWidth(30.0),
        height: getWidth(30.0),
      ),
    );
  }

  InkWell _searchIcon() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: SvgPicture.asset(
        'assets/icons/search.svg',
        width: getWidth(30.0),
        height: getWidth(30.0),
      ),
    );
  }

  Padding _bottomSheet() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(24.0)),
      child: Container(
        height: getWidth(76.0),
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(
            getWidth(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  index = 0;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/nav1.svg",
                    color: index == 0 ? greenColor : textColor,
                    height: getWidth(44.0),
                    width: getWidth(44.0),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidth(12.0),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/nav2.svg",
                    color: index == 1 ? greenColor : textColor,
                    height: getWidth(44.0),
                    width: getWidth(44.0),
                  ),
                  Text(
                    "Markets",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidth(12.0),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/nav3.svg",
                    color: index == 2 ? greenColor : textColor,
                    height: getWidth(44.0),
                    width: getWidth(44.0),
                  ),
                  Text(
                    "Trades",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidth(12.0),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  index = 3;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/nav4.svg",
                    color: index == 3 ? greenColor : textColor,
                    height: getWidth(44.0),
                    width: getWidth(44.0),
                  ),
                  Text(
                    "Activity",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidth(12.0),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  index = 4;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/nav5.svg",
                    color: index == 4 ? greenColor : textColor,
                    height: getWidth(44.0),
                    width: getWidth(44.0),
                  ),
                  Text(
                    "Wallets",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: getWidth(12.0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
