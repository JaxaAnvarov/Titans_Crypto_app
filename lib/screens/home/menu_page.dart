
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/pages/editprofile.dart';
import 'package:titanscrypto/screens/pages/profile.dart';
import 'package:titanscrypto/screens/pages/settings_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: mainColor,
      appBar: _appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listTile(context),
          _commonText(),
          _divider(),
          _iconSection1(),
          _tradeText(),
          _divider(),
          _tradeIcons(),
          _financeText(),
          _divider(),
          _financeIcon1(),
          _financeIcon2()
        ],
      ),
      bottomNavigationBar: _bottomSheet(),
    );
  }

  Padding _financeIcon2() {
    return Padding(
      padding: EdgeInsets.only(top: getWidth(30.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            "assets/second/Pool.svg",
            height: getWidth(42.0),
            width: getWidth(24.0),
          ),
          SvgPicture.asset(
            "assets/second/ETH_2.0.svg",
            height: getWidth(42.0),
            width: getWidth(44.0),
          ),
          SvgPicture.asset(
            "assets/second/Lunchpad.svg",
            height: getWidth(41.0),
            width: getWidth(54.0),
          ),
          SvgPicture.asset(
            "assets/second/ETH_2.0.svg",
            color: Colors.transparent,
            height: getWidth(42.0),
            width: getWidth(44.0),
          ),
        ],
      ),
    );
  }

  Row _financeIcon1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          "assets/second/Savings.svg",
          height: getWidth(42.0),
          width: getWidth(43.0),
        ),
        SvgPicture.asset(
          "assets/second/Staking.svg",
          height: getWidth(42.0),
          width: getWidth(41.0),
        ),
        SvgPicture.asset(
          "assets/second/Pay.svg",
          height: getWidth(42.0),
          width: getWidth(24.0),
        ),
        SvgPicture.asset(
          "assets/second/Crypto_Loans.svg",
          height: getWidth(56.0),
          width: getWidth(37.0),
        ),
      ],
    );
  }

  Padding _financeText() {
    return Padding(
      padding: EdgeInsets.only(top: getWidth(40.0), left: getWidth(24.0)),
      child: Text(
        "Finance",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: getWidth(18.0),
            color: textColor),
      ),
    );
  }

  Column _tradeIcons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              "assets/second/Convert.svg",
              height: getWidth(42.0),
              width: getWidth(43.0),
            ),
            SvgPicture.asset(
              "assets/second/Spot.svg",
              height: getWidth(43.0),
              width: getWidth(26.0),
            ),
            SvgPicture.asset(
              "assets/second/Margin.svg",
              height: getWidth(43.0),
              width: getWidth(38.0),
            ),
            SvgPicture.asset(
              "assets/second/Grid_Trading.svg",
              height: getWidth(57.0),
              width: getWidth(41.0),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getWidth(24.0),
            top: getWidth(20.0),
          ),
          child: SvgPicture.asset(
            "assets/second/Liquid_Swap.svg",
            height: getWidth(56.0),
            width: getWidth(33.0),
          ),
        ),
      ],
    );
  }

  Padding _tradeText() {
    return Padding(
      padding: EdgeInsets.only(top: getWidth(35.0), left: getWidth(24.0)),
      child: Text(
        "Trade",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: getWidth(18.0),
            color: textColor),
      ),
    );
  }

  Row _iconSection1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SvgPicture.asset(
          "assets/second/Transfer.svg",
          height: getWidth(42.0),
          width: getWidth(45.0),
        ),
        SvgPicture.asset(
          "assets/second/Deposit.svg",
          height: getWidth(42.0),
          width: getWidth(42.0),
        ),
        SvgPicture.asset(
          "assets/second/Orders.svg",
          height: getWidth(42.0),
          width: getWidth(38.0),
        ),
        SvgPicture.asset(
          "assets/second/Referral.svg",
          height: getWidth(42.0),
          width: getWidth(43.0),
        ),
      ],
    );
  }

  Padding _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getWidth(24.0),
      ),
      child: Divider(
        color: textColor,
        thickness: .1,
      ),
    );
  }

  Padding _commonText() {
    return Padding(
      padding: EdgeInsets.only(top: getWidth(60.0), left: getWidth(24.0)),
      child: Text(
        "Common",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: getWidth(18.0),
            color: textColor),
      ),
    );
  }

  Container _listTile(BuildContext context) {
    return Container(
      child: _userInfo(context),
      decoration: BoxDecoration(color: mainColor),
      height: getWidth(60.0),
      width: double.infinity,
    );
  }

  ListTile _userInfo(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: getWidth(43.0),
        height: getWidth(43.0),
        child: Stack(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage(
                "assets/images/profile.png",
              ),
              radius: getWidth(21.0),
            ),
            Positioned(
              bottom: 3,
              right: 3,
              child: CircleAvatar(
                backgroundColor: greenColor,
                radius: getWidth(3.1),
              ),
            ),
          ],
        ),
      ),
      title: Text(
        "User 1234",
        style: TextStyle(
          fontSize: getWidth(18.0),
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        "ID: 1234567890",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: textColor,
          fontSize: getWidth(14.0),
        ),
      ),
      trailing: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => ProfilUpdatePage()));
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Edit Profile",
            style: TextStyle(
                fontSize: getWidth(14.0), fontWeight: FontWeight.w400),
          ),
          width: getWidth(104.0),
          height: getWidth(33.0),
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(
              getWidth(16.0),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: mainColor,
      elevation: 0,
      title: Text(
        "Menu",
        style: TextStyle(
          fontSize: getWidth(18.0),
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => SettingPage()));
          },
          icon: Icon(
            Icons.more_vert,
          ),
        ),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/nav1.svg",
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/nav2.svg",
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/nav3.svg",
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/nav4.svg",
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/nav5.svg",
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
          ],
        ),
      ),
    );
  }
}
