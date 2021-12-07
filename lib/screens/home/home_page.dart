import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/home/menu_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';

import 'package:titanscrypto/screens/pages/avtivity.dart';
import 'package:titanscrypto/screens/pages/editprofile.dart';
import 'package:titanscrypto/screens/pages/market.dart';
import 'package:titanscrypto/screens/pages/profile.dart';
import 'package:titanscrypto/screens/pages/qr_page/notification_free.dart';
import 'package:titanscrypto/screens/pages/qr_page/qr_kod.dart';
import 'package:titanscrypto/screens/pages/trades.dart';
import 'package:titanscrypto/screens/pages/wallets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);
  int index = 0;

  bool aktivmi = false;
  int notification = 40;

  List pagesList = [];
  bool isAppbar = false;
  List appbarlist = [];
  int appindex = 0;
  Barcode? result;
  QRViewController? qrcontroller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String? resultstring;
  Widget? homepag,
      market,
      trade,
      activity,
      wallet,
      qrcode,
      qrresult,
      notificatio;

  @override
  void initState() {
    // TODO: implement initState
    homepag = homepage(context);
    market = const MarketPage();
    trade = const TradesPage();
    activity = const AvtivityPage();
    wallet = const WallwtsPage();
    pagesList = [homepag, market, trade, activity, wallet];

    qrcode = const QrKodPage();
    notificatio = const NotificationPage();
    appbarlist = [qrcode, notificatio];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // qrcode = qrcodePage();
    // qrresult = qrresultpage();
    // notificatio = notificationpage();
    // appbarlist = [qrcode, qrresult, notificatio];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: getWidth(12.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => ProfilPage()));
                },
                child: Padding(
                  padding: EdgeInsets.all(getWidth(12.0)),
                  child: CircleAvatar(
                    radius: getWidth(18.0),
                    backgroundImage: const AssetImage(
                      "assets/images/profile.png",
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      index != 2
                          ? 'assets/icons/search.svg'
                          : 'assets/icons/candle.svg',
                      width: getWidth(30.0),
                      height: getWidth(30.0),
                    ),
                  ),
                  SizedBox(width: getWidth(10.0)),
                  InkWell(
                    onTap: () {
                      appindex = 0;
                      isAppbar = true;
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      index != 2
                          ? 'assets/icons/qr_kod.svg'
                          : 'assets/icons/dollor_circle.svg',
                      width: getWidth(30.0),
                      height: getWidth(30.0),
                    ),
                  ),
                  SizedBox(width: getWidth(10.0)),
                  InkWell(
                    onTap: () {
                      appindex = 1;
                      isAppbar = true;
                      setState(() {});
                    },
                    child: SvgPicture.asset(
                      index != 2
                          ? 'assets/icons/notification.svg'
                          : 'assets/icons/star.svg',
                      width: getWidth(30.0),
                      height: getWidth(30.0),
                    ),
                  ),
                  SizedBox(width: getWidth(10.0)),
                ],
              )
            ],
          ),
        ),
      ),
      body: isAppbar ? appbarlist[appindex] : pagesList[index],
      bottomNavigationBar: _bottomSheet(),
    );
  }

//Samandar
  Column homepage(BuildContext context) {
    return Column(
      children: [
        //  _appBar(),
        SizedBox(
          height: getHeight(710.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _iconSection1(),
                _iconSection2(),
                SizedBox(
                  height: getHeight(20.0),
                ),
                _listTile1(),
                _listTile2(),
                _recentCoinsText(),
                _cardSection(),
                _topCoinText(),
                _cardSection()
              ],
            ),
          ),
        )
      ],
    );
  }
//Appbar Funtion

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

  Column qrcodePage() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/camera.svg",
              height: getWidth(19.0),
              width: getWidth(19.0),
            ),
            SizedBox(
              width: getWidth(10.0),
            ),
            Text(
              "Scan QR code",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getWidth(18.0),
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        SizedBox(
          height: getWidth(4.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getWidth(71.0),
          ),
          child: Text(
            "Scan the QR code and it automatically recognize it.",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontSize: getWidth(14.0),
                fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: getHeight(23),
          ),
          child: SizedBox(
            width: getWidth(358.0),
            height: getHeight(419.0),
            child: QRView(
                key: qrKey,
                onQRViewCreated: (qrcontroller) {
                  setState(() {
                    this.qrcontroller = qrcontroller;
                  });
                  qrcontroller.scannedDataStream.listen((scanData) {
                    setState(() {
                      result = scanData;
                    });
                    resultstring = result!.code.toString();
                    isAppbar = true;
                    appindex = 1;
                  });
                  var scanArea = getWidth(360.0);
                  overlay:
                  QrScannerOverlayShape(
                      borderColor: Colors.white,
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: scanArea);
                  onPermissionSet:
                  (ctrl, p) =>
                      (BuildContext context, QRViewController ctrl, bool p) {
                        log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
                        if (!p) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('no Permission')),
                          );
                        }
                      };
                }),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/qr-code.svg",
                  width: getWidth(22.0),
                  height: getWidth(22.0),
                ),
                SizedBox(
                  width: getWidth(10.0),
                ),
                Text(
                  "Show QR code",
                  style: TextStyle(
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
              color: greenColor,
              borderRadius: BorderRadius.circular(
                getWidth(16.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: getWidth(20.0),
        ),
        InkWell(
          onTap: () {
            isAppbar = false;
            setState(() {});
          },
          child: Container(
            child: Text(
              "Cancel",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: getWidth(18.0),
              ),
            ),
            alignment: Alignment.center,
            width: getWidth(366.0),
            height: getWidth(54.0),
            decoration: BoxDecoration(
              color: textColor,
              borderRadius: BorderRadius.circular(
                getWidth(16.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  Column qrresultpage() {
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => QrKodPage()));
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
              resultstring!,
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

  //Navigationbar
  _bottomSheet() {
    return Container(
      color: index != 2 && index != 0 ? bkColor : whColor,
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
                isAppbar = false;
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
                isAppbar = false;
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
                isAppbar = false;
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
                isAppbar = false;
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
                isAppbar = false;
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

  //Home functions
  Padding _topCoinText() {
    return Padding(
      padding: EdgeInsets.only(
        left: getWidth(24.0),
        top: getWidth(25.0),
      ),
      child: Text(
        "Top Coin",
        style: TextStyle(fontSize: getWidth(18.0), fontWeight: FontWeight.w700),
      ),
    );
  }

  Padding _cardSection() {
    return Padding(
      padding: EdgeInsets.only(left: getWidth(16.0), top: getWidth(16.0)),
      child: SizedBox(
        height: getWidth(125.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _greenCard(),
              _redCard(),
              _greenCard(),
            ],
          ),
        ),
      ),
    );
  }

  Container _redCard() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(
          getWidth(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "2,059.83",
                  style: TextStyle(
                      fontSize: getWidth(16.0),
                      fontWeight: FontWeight.w700,
                      color: redColor),
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    "assets/icons/burchak.svg",
                    height: getWidth(15.21),
                    width: getWidth(11.49),
                  ),
                  backgroundColor: blueColor,
                  radius: getWidth(12.1),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "SOL/BUSD",
                  style: TextStyle(
                      fontSize: getWidth(14.0), fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: getWidth(4.0),
                ),
                Text(
                  "+0.81%",
                  style: TextStyle(
                      color: redColor,
                      fontSize: getWidth(12.0),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/icons/red_static.svg",
              width: getWidth(142.5),
              height: getWidth(31.0),
            )
          ],
        ),
      ),
      margin: EdgeInsets.only(left: getWidth(8.0)),
      width: getWidth(163.0),
      height: getWidth(118.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: .2,
            blurRadius: 1,
            offset: Offset(3, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  Container _greenCard() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(
          getWidth(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "40,059.83",
                  style: TextStyle(
                      fontSize: getWidth(16.0),
                      fontWeight: FontWeight.w700,
                      color: greenColor),
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    "assets/icons/bitcoin.svg",
                    height: getWidth(15.21),
                    width: getWidth(11.49),
                  ),
                  backgroundColor: Color(0xffF7931A),
                  radius: getWidth(12.1),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "BTC/BUSD",
                  style: TextStyle(
                      fontSize: getWidth(14.0), fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: getWidth(4.0),
                ),
                Text(
                  "+0.81%",
                  style: TextStyle(
                      color: greenColor,
                      fontSize: getWidth(12.0),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/icons/green_static.svg",
              width: getWidth(142.5),
              height: getWidth(31.0),
            )
          ],
        ),
      ),
      margin: EdgeInsets.only(left: getWidth(10.0)),
      width: getWidth(163.0),
      height: getWidth(118.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: .2,
            blurRadius: 1,
            offset: Offset(3, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  Padding _recentCoinsText() {
    return Padding(
      padding: EdgeInsets.only(
        left: getWidth(24.0),
        top: getWidth(28.0),
      ),
      child: Text(
        "Recent Coin",
        style: TextStyle(fontSize: getWidth(18.0), fontWeight: FontWeight.w700),
      ),
    );
  }

  Padding _listTile2() {
    return Padding(
      padding: EdgeInsets.only(
        top: getWidth(10.0),
        right: getWidth(24.0),
        left: getWidth(24.0),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getWidth(16.0),
          ),
        ),
        tileColor: listtileColor,
        leading: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.green,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                color: Colors.red,
                borderRadius: BorderRadius.circular(
                  getWidth(16.0),
                ),
              ),
              width: getWidth(44.0),
              height: getWidth(44.0),
            ),
            SvgPicture.asset(
              'assets/images/credit.svg',
              width: getWidth(51.0),
              height: getWidth(51.0),
            ),
          ],
        ),
        title: Text(
          "Credit/Debit Card",
          style:
              TextStyle(fontSize: getWidth(16.0), fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          "Visa, Mastercard",
          style: TextStyle(
              fontSize: getWidth(14.0),
              fontWeight: FontWeight.w400,
              color: Colors.grey),
        ),
        trailing: Container(
          child: const Icon(
            Icons.arrow_forward,
          ),
          width: getWidth(40.0),
          height: getWidth(40.0),
          decoration: BoxDecoration(
            color: trailingcolor,
            borderRadius: BorderRadius.circular(
              getWidth(16.0),
            ),
          ),
        ),
      ),
    );
  }

  Padding _listTile1() {
    return Padding(
      padding: EdgeInsets.only(
        right: getWidth(24.0),
        left: getWidth(24.0),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getWidth(16.0),
          ),
        ),
        tileColor: listtileColor,
        leading: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.green,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
                color: Colors.red,
                borderRadius: BorderRadius.circular(
                  getWidth(16.0),
                ),
              ),
              width: getWidth(44.0),
              height: getWidth(44.0),
            ),
            SvgPicture.asset(
              'assets/images/Rocket.svg',
              width: getWidth(52.0),
              height: getWidth(57.0),
            ),
          ],
        ),
        title: Text(
          "P2P Trading",
          style:
              TextStyle(fontSize: getWidth(16.0), fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          "Bank Transfer, Paypal Revolut...",
          style: TextStyle(
              fontSize: getWidth(14.0),
              fontWeight: FontWeight.w400,
              color: Colors.grey),
        ),
        trailing: Container(
          child: const Icon(
            Icons.arrow_forward,
          ),
          width: getWidth(40.0),
          height: getWidth(40.0),
          decoration: BoxDecoration(
            color: trailingcolor,
            borderRadius: BorderRadius.circular(
              getWidth(16.0),
            ),
          ),
        ),
      ),
    );
  }

  Row _iconSection1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _depositIcon(),
        _referralIcon(),
        VerticalDivider(
          color: mainColor,
          width: .1,
        ),
        _gridTrading(),
        _marginIcon(),
      ],
    );
  }

  Row _iconSection2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _launchpadIcon(),
        _savingsIcon(),
        VerticalDivider(
          color: mainColor,
          width: .1,
        ),
        _liquid_swap(),
        _moreIcon(),
      ],
    );
  }

  Ink _launchpadIcon() {
    return Ink(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/launchpad.svg',
            width: getWidth(44.0),
            height: getWidth(44.0),
          ),
          Text(
            "Launchpad",
            style: TextStyle(
                color: textColor,
                fontSize: getWidth(12.0),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      color: secondColor,
      width: getWidth(116.0),
      height: getWidth(84.0),
    );
  }

  Ink _savingsIcon() {
    return Ink(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/savings.svg',
            width: getWidth(44.0),
            height: getWidth(44.0),
          ),
          Text(
            "Savings",
            style: TextStyle(
                color: textColor,
                fontSize: getWidth(12.0),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      color: secondColor,
      width: getWidth(91.0),
      height: getWidth(84.0),
    );
  }

  Ink _liquid_swap() {
    return Ink(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/liquid_swap.svg',
            width: getWidth(44.0),
            height: getWidth(44.0),
          ),
          Text(
            "Liquid Swap",
            style: TextStyle(
                color: textColor,
                fontSize: getWidth(12.0),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      color: secondColor,
      width: getWidth(91.0),
      height: getWidth(84.0),
    );
  }

  InkWell _moreIcon() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MenuPage()));
      },
      child: Ink(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/more.svg',
              width: getWidth(44.0),
              height: getWidth(44.0),
            ),
            Text(
              "More",
              style: TextStyle(
                  color: textColor,
                  fontSize: getWidth(12.0),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
        color: secondColor,
        width: getWidth(115.8),
        height: getWidth(84.0),
      ),
    );
  }

  Ink _depositIcon() {
    return Ink(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/deposit.svg',
            width: getWidth(44.0),
            height: getWidth(44.0),
          ),
          Text(
            "Deposit",
            style: TextStyle(
                color: textColor,
                fontSize: getWidth(12.0),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      color: secondColor,
      width: getWidth(116.0),
      height: getWidth(84.0),
    );
  }

  Ink _referralIcon() {
    return Ink(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/referral.svg',
            width: getWidth(44.0),
            height: getWidth(44.0),
          ),
          Text(
            "Referral",
            style: TextStyle(
                color: textColor,
                fontSize: getWidth(12.0),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      color: secondColor,
      width: getWidth(91.0),
      height: getWidth(84.0),
    );
  }

  Ink _gridTrading() {
    return Ink(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/grid_trading.svg',
            width: getWidth(44.0),
            height: getWidth(44.0),
          ),
          Text(
            "Grid Trading",
            style: TextStyle(
                color: textColor,
                fontSize: getWidth(12.0),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      color: secondColor,
      width: getWidth(91.0),
      height: getWidth(84.0),
    );
  }

  Ink _marginIcon() {
    return Ink(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/margin.svg',
            width: getWidth(44.0),
            height: getWidth(44.0),
          ),
          Text(
            "Margin",
            style: TextStyle(
                color: textColor,
                fontSize: getWidth(12.0),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      color: secondColor,
      width: getWidth(115.8),
      height: getWidth(84.0),
    );
  }

//Appbar
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

//Appbar Functions
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
        appindex = 2;
        isAppbar = true;
        setState(() {});
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
        appindex = 0;
        isAppbar = true;
        setState(() {});
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
      onTap: () {},
      child: SvgPicture.asset(
        'assets/icons/search.svg',
        width: getWidth(30.0),
        height: getWidth(30.0),
      ),
    );
  }
}
