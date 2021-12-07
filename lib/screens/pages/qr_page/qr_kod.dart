import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/home/home_page.dart';
import 'package:titanscrypto/screens/pages/qr_page/notification_free.dart';
import 'package:titanscrypto/screens/pages/qr_page/qr_result.dart';

class QrKodPage extends StatefulWidget {
  const QrKodPage({Key? key}) : super(key: key);

  @override
  State<QrKodPage> createState() => _QrKodPageState();
}

class _QrKodPageState extends State<QrKodPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: mainColor,
      body: qr_codePage(context),
    //  bottomNavigationBar: _bottomSheet(),
    );
  }

  Column qr_codePage(BuildContext context) {
    return Column(
      children: [
        //_appBar(),
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
      onQRViewCreated: ( controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => QrCodeResult(result!.code.toString())));
    });
    var scanArea = getWidth(360.0);
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea);
      onPermissionSet: (ctrl, p) => (BuildContext context, QRViewController ctrl, bool p) {
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
         Container(
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
    )
      ],
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



  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
