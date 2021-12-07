
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/home/home_page.dart';
import 'package:titanscrypto/screens/pages/qr_page/notification_free.dart';
import 'package:titanscrypto/screens/pages/qr_page/qr_kod.dart';

class QrCodeResult extends StatefulWidget {
  QrCodeResult(this.result);
  String? result;
  @override
  _QrCodeResultState createState() => _QrCodeResultState();
}

class _QrCodeResultState extends State<QrCodeResult> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: mainColor,
      body: qr_resultpage(context),
     // bottomNavigationBar: _bottomSheet(),
    );
  }

  Column qr_resultpage(BuildContext context) {
    return Column(
      children: [
        _appBar(),
        _infoSection(),
        _myQrCodeText(),
        _qrCodePicture(),
        _addressText(),
        _qrCodeLink(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(52.0),
            vertical: getHeight(20.0),
          ),
          child: Text(
            "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: getWidth(14.0),
                fontWeight: FontWeight.w400,
                color: textColor),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => QrKodPage()));
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/camera.svg",
                  width: getWidth(22.0),
                  height: getWidth(22.0),
                ),
                SizedBox(
                  width: getWidth(10.0),
                ),
                Text(
                  "Scan QR code",
                  style: TextStyle(
                    color: greenColor,
                    fontWeight: FontWeight.w400,
                    fontSize: getWidth(18.0),
                  ),
                ),
              ],
            ),
            alignment: Alignment.center,
            width: getWidth(366.0),
            height: getWidth(54.0),
            decoration: BoxDecoration(
              border: Border.all(color: greenColor),
              color: mainColor,
              borderRadius: BorderRadius.circular(
                getWidth(16.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding _qrCodeLink() {
    return Padding(
      padding: EdgeInsets.only(
          top: getHeight(4.0), left: getWidth(40.0), right: getWidth(40.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              widget.result!,
              maxLines: 1,
              style: TextStyle(
                fontSize: getWidth(14.0),
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            width: getWidth(295.0),
            height: getHeight(33.0),
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getWidth(12.0)),
                bottomLeft: Radius.circular(getWidth(12.0)),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: getWidth(39.0),
            height: getHeight(33.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(getWidth(12.0)),
                bottomRight: Radius.circular(getWidth(12.0)),
              ),
            ),
            child: SvgPicture.asset(
              "assets/images/copy.svg",
              height: getHeight(18.0),
              width: getWidth(18.0),
            ),
          ),
        ],
      ),
    );
  }

  Padding _addressText() {
    return Padding(
      padding: EdgeInsets.only(top: getHeight(22.0)),
      child: Text(
        "ADDRESS",
        style: TextStyle(
            color: textColor,
            fontSize: getWidth(14.0),
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Padding _qrCodePicture() {
    return Padding(
      padding: EdgeInsets.only(top: getWidth(20.0)),
      child: SizedBox(
        width: getWidth(258.0),
        height: getWidth(258.0),
        child: Image.asset(
          "assets/images/result.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Padding _myQrCodeText() {
    return Padding(
      padding: EdgeInsets.only(top: getWidth(20.0)),
      child: Text(
        "My QR code",
        style: TextStyle(
            color: Colors.white,
            fontSize: getWidth(18.0),
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Container _infoSection() {
    return Container(
      width: double.infinity,
      height: getHeight(146.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "USD",
                style: TextStyle(
                    color: textColor,
                    fontSize: getWidth(14.0),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: getWidth(20.0),
              ),
              Text(
                "BITS",
                style: TextStyle(
                    color: greenColor,
                    fontSize: getWidth(14.0),
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Text(
            "BTC 40,059.83",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: getWidth(28.0),
            ),
          )
        ],
      ),
    );
  }
///
///
///
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
