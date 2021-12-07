import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/helper/list_of_informations.dart';

class AvtivityPage extends StatefulWidget {
  const AvtivityPage({ Key? key }) : super(key: key);

  @override
  _AvtivityPageState createState() => _AvtivityPageState();
}

class _AvtivityPageState extends State<AvtivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bkColor,
      body: activity(context),
    );
  }

  Widget activity(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(20.0),
              vertical: getHeight(24.0),
            ),
            child: Container(
              height: getHeight(150.0),
              decoration: BoxDecoration(
                color: const Color(0xFF161C22),
                borderRadius: BorderRadius.circular(
                  getWidth(12.0),
                ),
              ),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getWidth(10.0), vertical: getHeight(2.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: getHeight(48.0),
                              width: getWidth(48.0),
                              child: SvgPicture.asset(Information.img[index]),
                            ),
                            SizedBox(width: getWidth(10.0)),
                            Text(
                              Information.name[index],
                              style: TextStyle(
                                color: Color(0xFFC1C7CD),
                                fontSize: getWidth(14.0),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: kPrimaryTextColors,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(right: getWidth(259.0), left: getWidth(20.0)),
            height: getHeight(22.0),
            width: getWidth(131.0),
            child: Text(
              'Resent Activity',
              style: TextStyle(
                color: Colors.white,
                fontSize: getWidth(18.0),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: getHeight(26.0)),
          Container(
            height: getWidth(400.0),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    margin: EdgeInsets.only(),
                    height: getWidth(50.0),
                    width: getWidth(50.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.grey.shade400,
                      // color: Images.colors[index],
                      // color: kPrimaryTextColor
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      height: getWidth(30.0),
                      width: getWidth(30.0),
                      child: SvgPicture.asset(
                        Images.images[index],
                      ),
                    ),
                  ),
                  title: Text(
                    'BTC/BUST',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: getWidth(14.0),
                    ),
                  ),
                  subtitle: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: getHeight(4.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: getHeight(17.0),
                              width: getWidth(49.0),
                              child: Text(
                                'Amount',
                                style: TextStyle(
                                  color: kPrimaryTextColors,
                                  fontSize: getWidth(14.0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '2021-08-02 04:39:26',
                                  style: TextStyle(
                                    color: kPrimaryTextColors,
                                    fontSize: getWidth(14.0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios,
                                  color: kPrimaryTextColors,
                                  size: 14.0,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: getHeight(4.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: getHeight(7.0)),
                              alignment: Alignment.centerLeft,
                              height: getHeight(17.0),
                              width: getWidth(49.0),
                              child: Text(
                                'Price',
                                style: TextStyle(
                                  color: kPrimaryTextColors,
                                  fontSize: getWidth(14.0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              height: getHeight(17.0),
                              width: getWidth(60.0),
                              child: Text(
                                '2652.00',
                                style: TextStyle(
                                  color: const Color(0xFFA7AFB7),
                                  fontSize: getWidth(14.0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: getHeight(4.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: getHeight(17.0),
                              width: getWidth(49.0),
                              child: Text(
                                'Status',
                                style: TextStyle(
                                  color: kPrimaryTextColors,
                                  fontSize: getWidth(14.0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: getWidth(4.0)),
                              height: getHeight(17.0),
                              width: getWidth(63.0),
                              child: Text(
                                Images.titles[index],
                                style: TextStyle(
                                  color: Images.colors[index],
                                  fontSize: getWidth(14.0),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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