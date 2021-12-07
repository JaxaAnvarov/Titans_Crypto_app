import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/helper/list_of_informations.dart';

class WallwtsPage extends StatefulWidget {
  const WallwtsPage({ Key? key }) : super(key: key);

  @override
  _WallwtsPageState createState() => _WallwtsPageState();
}

class _WallwtsPageState extends State<WallwtsPage> {
  var aktivmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bkColor,
      body: wallets(context),
    );
  }

  Widget wallets(BuildContext context) {
    
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: getHeight(49.0)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth(20.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: getHeight(25.0),
                      width: getWidth(162.0),
                      child: Text(
                        'Current Balance',
                        style: TextStyle(
                          color: kPrimaryTextColors,
                          fontWeight: FontWeight.w400,
                          fontSize: getWidth(14.0),
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(12.0)),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: getHeight(46.0),
                      width: getWidth(162.0),
                      child: Text(
                        '40,059.83',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: getWidth(32.0),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: getWidth(50.0),
                  width: getWidth(50.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1B232A),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.visibility_off,
                    color: kPrimaryTextColors,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 290.0, left: 20.0, top: 3.0),
            // alignment: Alignment.centerLeft,
            height: getHeight(17.0),
            width: getWidth(90.0),
            child: Text(
              '\$468,554.23',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: getWidth(14.0),
              ),
            ),
          ),
          SizedBox(height: getHeight(30.0)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (aktivmi == true) {
                        aktivmi = false;
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: getHeight(46.0),
                    width: getWidth(118.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5ED5A8),
                      borderRadius: BorderRadius.circular(
                        getWidth(10.0),
                      ),
                    ),
                    child: Text(
                      'Deposit',
                      style: TextStyle(
                        color: aktivmi == true
                            ? const Color(0xFF171D22)
                            : const Color(0xFF777777),
                        fontSize: getWidth(16.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (aktivmi == false) {
                        aktivmi = true;
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: getHeight(46.0),
                    width: getWidth(118.0),
                    decoration: BoxDecoration(
                      color: aktivmi == true
                          ? const Color(0xFF5ED5A8)
                          : const Color(0xFF1E272E),
                      borderRadius: BorderRadius.circular(
                        getWidth(10.0),
                      ),
                    ),
                    child: Text(
                      'Withdraw',
                      style: TextStyle(
                        color: kPrimaryTextColors,
                        fontSize: getWidth(16.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      aktivmi = !aktivmi;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: getHeight(46.0),
                    width: getWidth(118.0),
                    decoration: BoxDecoration(
                      color: aktivmi == true
                          ? const Color(0xFF5ED5A8)
                          : const Color(0xFF1E272E),
                      borderRadius: BorderRadius.circular(
                        getWidth(10.0),
                      ),
                    ),
                    child: Text(
                      'Transfer',
                      style: TextStyle(
                        color: kPrimaryTextColors,
                        fontSize: getWidth(16.0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getHeight(10.0)),
          Container(
            height: getHeight(450),
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: getHeight(80.0),
                    width: double.infinity,
                    // color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(5.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5.0),
                                height: getWidth(70.0),
                                width: getWidth(70.0),
                                decoration: BoxDecoration(
                                  color: Information.colors[index],
                                  // borderRadius: BorderRadius.circular(30.0),
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  height: getWidth(20.0),
                                  width: getWidth(20.0),
                                  // color: Colors.indigo,
                                  child: SvgPicture.asset(
                                    Information.images[index],
                                    height: 10.0,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: getHeight(24.0),
                                    width: getWidth(70.0),
                                    child: Text(
                                      Information.titles[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: getWidth(14.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: getHeight(4.0)),
                                  Container(
                                    height: getHeight(17.0),
                                    width: getWidth(70.0),
                                    child: Text(
                                      Information.subtitles[index],
                                      style: TextStyle(
                                        color: kPrimaryTextColors,
                                        fontWeight: FontWeight.w400,
                                        fontSize: getWidth(14.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                height: getHeight(24.0),
                                width: getWidth(77.0),
                                child: Text(
                                  Information.price[index],
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                height: getHeight(17.0),
                                width: getWidth(77.0),
                                child: Text(
                                  Information.prices[index],
                                  style: TextStyle(
                                    color: Information.colors_text[index],
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}